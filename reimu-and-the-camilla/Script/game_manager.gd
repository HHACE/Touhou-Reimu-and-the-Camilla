extends Node2D

var currentStage = 1

var Playerlife = 3
var score = 0


signal _GameOver
signal _Pause
signal _Resume
signal _win

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("_GameOver", _on_game_over)
	connect("_Pause",_on_pause)
	connect("_Resume",_on_resume)
	connect("_win", _on_win)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_game_over():
	#pass
	print("_on_game_over")
func _on_pause():
	#pass
	print("_on_pause")
func _on_resume():
	#pass
	print("_on_resume")
func _on_win():
	#pass
	print("_on_win")

func reset_game():
	Playerlife = 3
	score = 0
