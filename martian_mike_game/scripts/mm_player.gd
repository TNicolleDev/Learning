extends CharacterBody2D

class_name Player

@export var player_speed: float = 200
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var gravity: float = 400.0
var jump_height: float = 200.0
var terminal_velocity: float = 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	
	player_movement(delta)
	move_and_slide()
	


func player_movement(delta: float) -> void:
	var direction = Input.get_axis("move_left","move_right")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump(jump_height)
	if not is_on_floor():
		velocity.y += gravity * delta
	if velocity.y > terminal_velocity:
		velocity.y = terminal_velocity
	velocity.x = player_speed * direction
	update_animations(direction)

func update_animations(direction):
	# flipping sprite horizontally
	if direction != 0:
		animated_sprite_2d.flip_h = (direction == -1)
		print(animated_sprite_2d.flip_h)
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	elif velocity.y < 0:
		animated_sprite_2d.play("jump")
	else:
		animated_sprite_2d.play("fall")
		
func jump(jump_height):
	velocity.y = -jump_height
