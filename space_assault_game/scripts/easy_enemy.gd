extends Area2D

@export var enemy_speed: float = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	global_position.x -= enemy_speed * delta

func die():
	queue_free()
