extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

var path_enemy_scene = preload("res://space_assault_game/scenes/path_enemy.tscn")
var enemy_scene = preload("res://space_assault_game/scenes/easy_enemy.tscn")
@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_postion = spawn_positions_array.pick_random()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_postion.global_position
	emit_signal("enemy_spawned", enemy_instance)
	#random_spawn_postion.add_child(enemy_instance)
	#enemy_instance.global_position = Vector2(1350,300)


func _on_path_enemy_timer_timeout() -> void:
	spawn_path_enemy()

func spawn_path_enemy():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
