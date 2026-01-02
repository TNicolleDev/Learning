extends Node

func _ready() -> void:
	print("Dice autoloader present")

func roll_d20():
	var result: int = randi_range(1,20)
	print(result)
	return result

func roll_d4():
	var result: int = randi_range(1,4)
	print(result)

func roll_d6():
	var result: int = randi_range(1,6)
	print(result)


func roll_d8():
	var result: int = randi_range(1,8)
	print(result)
	
func roll_d10():
	var result: int = randi_range(1,10)
	print(result)
	
func roll_d12():
	var result: int = randi_range(1,12)
	print(result)
	
