extends Node2D
@onready var player: CharacterBody2D = $Player
@onready var hud: Control = $UI/HUD
@onready var gameover_screen = preload("res://space_assault_game/scenes/gameover_screen.tscn")
@onready var enemy_hit_sound: AudioStreamPlayer = $EnemyHitSound
@onready var player_hit_sound: AudioStreamPlayer = $PlayerHitSound

var lives: int = 3
var score: int = 0

func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_deathlier_zone_area_entered(area: Area2D) -> void:
	area.queue_free()
	_on_player_took_damage()

func _on_player_took_damage() -> void:
	player_hit_sound.play()
	lives -= 1
	hud.set_lives(lives)
	if (lives ==0):
		print("Game over")
		player.die()
		
		# Wait, then create a new timer node, set it for 1.5 seconds and then emit the timeout signal
		# we are awaiting that signal
		await get_tree().create_timer(1.5).timeout
		
		var go_screen = gameover_screen.instantiate()
		go_screen.set_score(score)
		hud.add_child(go_screen)
		
	else:
		print(lives)


func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	print("enemy died")
	enemy_hit_sound.play()
	score += 100
	print("Score: " + str(score))
	hud.set_score_label(score)


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance: Variant) -> void:
	add_child(path_enemy_instance)
	path_enemy_instance.easy_enemy.connect("died", _on_enemy_died)
