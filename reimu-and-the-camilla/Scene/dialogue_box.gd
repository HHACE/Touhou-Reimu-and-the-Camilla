extends Panel

var dialogue = [
	{"character": "Yukari", "line": ""},
	{"character": "Reimu", "line": "Hello"},
	{"character": "Yukari", "line": "Hi"},
	{"character": "Reimu", "line": "Bye"},
	{"character": "Yukari", "line": "Buh Bye"}
]

var dialogue_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_all_process(false)
	
	GameManager.connect("_Pause",_on_pause)
	GameManager.connect("_Resume",_on_resume)
	GameManager.connect("_Dialogue",_on_dialogue)
func _on_pause():
	_set_all_process(false)
func _on_resume():
	if GameManager.isDialogue == true:
		press_cancel_buffer = true
		_set_all_process(true)
		await get_tree().create_timer(0.1).timeout
		press_cancel_buffer = false
func _on_dialogue():
	if $".".visible == true:
		_set_all_process(false)
	else:
		_update_show_text()
		_set_all_process(true)

var press_cancel_buffer = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("confirm"):
		if dialogue_index >= dialogue.size()-1:
			dialogue_index = 0
			GameManager.emit_signal("_Dialogue")
		else:
			dialogue_index += 1
			_update_show_text()
			
	if Input.is_action_just_pressed("cancel") and press_cancel_buffer == false:
		#if $"../Pause".visible==false:
		GameManager.emit_signal("_Pause")
		$"../Pause"._set_all_process(true)

func _update_show_text():
	$TextBox/dialogue.text = dialogue[dialogue_index]["line"]
	if dialogue[dialogue_index]["character"] == "Reimu":
		$Reimu.animation = "default"
		$NPC.animation = "hide"
	elif dialogue[dialogue_index]["character"] == "Yukari":
		$Reimu.animation = "hide"
		$NPC.animation = "default"

func _set_all_process(x : bool):
	set_process(x)
	set_physics_process(x)
	set_process_input(x)
	if x:
		$".".visible = true
	else:
		$".".visible = false
