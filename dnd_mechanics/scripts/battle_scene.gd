extends Node2D
@onready var signal_catcher_label: Label = $CanvasLayer/SignalCatcherLabel
@onready var dice_roller: CanvasLayer = $DiceRoller


func my_signal_method(result: int):
	signal_catcher_label.text = "Signal Result = " + str(result)

func _on_dice_roller_dice_has_rolled(result: int) -> void:
	signal_catcher_label.text = "Signal Result = " + str(result)
