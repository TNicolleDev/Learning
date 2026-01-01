extends Node2D

@onready var mm_player: Player = null
@onready var start_platform: StaticBody2D = $StartPlatform


func _ready() -> void:
	mm_player = get_tree().get_first_node_in_group("player")
	mm_player.global_position = start_platform.global_position
	var trap_array: Array[Node] = get_tree().get_nodes_in_group("traps")
	print(trap_array)
	for trap in trap_array:
		#trap.connect("touched_player", _on_trap_touched_player)
		trap.touched_player.connect(_on_trap_touched_player)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()


func _on_death_zone_body_entered(body: Node2D) -> void:
	body.velocity = Vector2.ZERO
	body.global_position = start_platform.global_position


func _on_trap_touched_player() -> void:
	reset_player()

func reset_player():
	mm_player.velocity = Vector2.ZERO
	mm_player.global_position = start_platform.global_position
