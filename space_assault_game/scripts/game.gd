extends Node2D


func _on_deathlier_zone_area_entered(area: Area2D) -> void:
	area.die()
