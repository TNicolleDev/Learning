extends Node2D

@onready var dice_result_label: Label = $Sprite2D/DiceResultLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	#animation_player.play("roll")
	#roll_dice()
	pass
func roll_dice():
	animation_player.play("roll")
	
