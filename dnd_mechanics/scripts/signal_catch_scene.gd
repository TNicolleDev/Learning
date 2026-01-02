extends Node2D

@onready var another_signal_catcher: Label = $AnotherSignalCatcher
@onready var dice_roller: CanvasLayer = $"../DiceRoller"

func _ready() -> void:
	dice_roller.connect("dice_has_rolled", change_this_label)

func change_this_label(number: int):
	another_signal_catcher.text = str(number)
