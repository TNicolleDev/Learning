extends RigidBody2D

var player_speed: float = 1000.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# This is the function specifically meant to hold physics processses
func _physics_process(delta: float) -> void:
	player_movement()
		
func player_movement():
	if Input.is_action_pressed("move_down"):
		apply_force(Vector2(0,player_speed))
	if Input.is_action_pressed("move_left"):
		apply_force(Vector2(-player_speed,0))
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(player_speed,0))
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2(0,-player_speed))
