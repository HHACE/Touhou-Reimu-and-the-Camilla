extends Node2D

var currentStage = 1

var Playerlife = 3
var score = 0


signal _GameOver
signal _Pause
signal _Dialogue
signal _Resume
signal _win


var is_mode_switching = false
signal _mode_switching

var isDialogue = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("_GameOver", _on_game_over)
	connect("_Pause",_on_pause)
	connect("_Dialogue",_on_dialogue)
	connect("_Resume",_on_resume)
	connect("_win", _on_win)
	
	connect("_mode_switching", _on_mode_switching)

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

var is_paused: bool = false
func _on_game_over():
	#pass
	print("_on_game_over")
	is_paused = !is_paused
	get_tree().paused = is_paused
func _on_pause():
	#pass
	if isDialogue==false:
		print("_on_pause")
		is_paused = !is_paused
		get_tree().paused = is_paused
	
	
func _on_dialogue():
	#pass
	print("_on_dialogue")
	isDialogue= !isDialogue
	is_paused = !is_paused
	get_tree().paused = is_paused
func _on_resume():
	#pass
	if isDialogue==false:
		print("_on_resume")
		is_paused = !is_paused
		get_tree().paused = is_paused
func _on_win():
	#pass
	print("_on_win")

func _on_mode_switching():
	print("_on_mode_switching")
	is_mode_switching = !is_mode_switching

func reset_game():
	is_mode_switching = false
	Playerlife = 3
	score = 0
