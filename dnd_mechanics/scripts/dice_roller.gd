extends CanvasLayer

signal dice_has_rolled(result: int)
@onready var the_dice: Node2D = null

@onready var d_4_label: Label = $HBoxContainer/D4Label
@onready var d_6_label: Label = $HBoxContainer/D6Label
@onready var d_8_label: Label = $HBoxContainer/D8Label
@onready var d_10_label: Label = $HBoxContainer/D10Label
@onready var d_12_label: Label = $HBoxContainer/D12Label
@onready var d_20_label: Label = $HBoxContainer/D20Label


func _ready() -> void:
	print("Dice roller active")
	the_dice = $"../TheDice"


func _on_d_20_pressed() -> void:
	var result: int = 0
	result = Dice.roll_d20()
	d_20_label.text = "D20 Result: " + str(result)
	dice_has_rolled.emit(result)
	if the_dice != null:
		the_dice.roll_dice()
		the_dice.dice_result_label.text ="?"
		await get_tree().create_timer(2).timeout
		the_dice.dice_result_label.text = str(result)
