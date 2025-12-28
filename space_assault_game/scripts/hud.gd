extends Control

@onready var score: Label = $Score
@onready var remaining_lives: Label = $RemainingLives



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_score_label(new_score: int):
	score.text = "SCORE: " + str(new_score)

func set_lives(amount:int):
	remaining_lives.text = str(amount)
