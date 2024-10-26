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

var last_milestone = 0
var milestone_step = 100000  
var milestone_buffer = false

func _process(delta: float) -> void:
	if GameManager.score >= last_milestone + milestone_step  and milestone_buffer==false:
		milestone_buffer = true
		Playerlife += 1
		last_milestone += milestone_step
		await get_tree().create_timer(1.0).timeout 
		milestone_buffer = false
	
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
