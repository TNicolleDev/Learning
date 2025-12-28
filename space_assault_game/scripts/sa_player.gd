extends CharacterBody2D

signal took_damage
@onready var rocket_fire_sound: AudioStreamPlayer = $RocketFireSound


var player_speed: float = 300
var rocket_scene = preload("res://space_assault_game/scenes/rocket.tscn")
var player_hp: int = 3

#@onready var rocket_container:Node = get_node("RocketContainer")
# same as above
@onready var rocket_container:Node = $RocketContainer


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta: float) -> void:
	player_movement()
	check_global_position()
	move_and_slide()

func player_movement():
	# make the player stand still if not inputs first, this is a design choice
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		# alternatively
		velocity.y = player_speed
	if Input.is_action_pressed("move_left"):
		velocity = Vector2(-player_speed, 0)
	if Input.is_action_pressed("move_right"):
		velocity = Vector2(player_speed, 0)
	if Input.is_action_pressed("move_up"):
		velocity = Vector2(0, -player_speed)
	
	# global_position shows the exact coordinates of the node with this script
	#print(global_position)
	
func check_global_position() -> void:
	#print(get_viewport_rect().size)
	var screen_size: Vector2 = get_viewport_rect().size
	#if global_position.x < 0:
		#global_position.x = 0
	#if global_position.x > screen_size.x:
		#global_position.x = screen_size.x
	#if global_position.y < 0:
		#global_position.y = 0
	#if global_position.y > screen_size.y:
		#global_position.y = screen_size.y
	
	# this does what the above does in less lines
	#global_position.x = clampf(global_position.x,0,screen_size.x)
	#global_position.y = clampf(global_position.y,0,screen_size.y)
	
	#this is the godtier version
	# since global postion itself is a Vector2 with a built in clamp method
	global_position = global_position.clamp(Vector2(0,0),screen_size)

func shoot():
	# print("shoot")
	# moved to a global variable.
	# var rocket_scene = preload("res://space_assault_game/scenes/rocket.tscn")
	rocket_fire_sound.play()
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80

func take_damage():
	emit_signal("took_damage")

func die():
	queue_free()
