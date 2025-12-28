extends Area2D

@export var rocket_speed: float = 200
@onready var tims_onscreen_notifier = $VisibleOnScreenNotifier2D

func _ready() -> void:
	tims_onscreen_notifier.connect("screen_exited", tims_signal_function)

func _physics_process(delta: float) -> void:
	# by multiplying by delta we make this movement consistent between frame rates
	global_position.x += rocket_speed * delta

#func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
#	queue_free()

func tims_signal_function():
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	
	area.die()
	queue_free()
