extends Node2D


signal touched_player



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Player entered")
		touched_player.emit()

func call_me_in_animation_player():
	#print("calling me")
	pass
