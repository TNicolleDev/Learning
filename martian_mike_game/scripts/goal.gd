extends StaticBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var next_level: PackedScene

func animate():
	animated_sprite_2d.play("win")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		animate()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_packed(next_level)
