extends Panel

var dialogueString = ""
var dialogue

var dialogue_Prologue = [
	{"character": "??????", "line": "Hi, Shrine Maiden of the Hakurei family"},
	{"character": "??????", "line": "Hakurei Reimu"},
	{"character": "??????", "line": "I am in need of your expertises once again. "},
	{"character": "??????", "line": "The occurrences of souls and spirits becoming malformed or vengeful spirits has risen to an uncontrollable state"},
	{"character": "??????", "line": "it has overrun Hell and is slowly seeping to the surface, this incidents is our specialty but we don't have enough manpower to handle this outbreak and in need of your abilities."},
	{"character": "??????", "line": "The balance of the afterlife and Gensokyo is at state, I'm counting on you."},
	{"character": "??????", "line": "I am in need of your expertises once again. "},
]
var dialogue_final_boss_dialogue = [
	{"character": "Reimu", "line": "This incident is a new one, this place has already morphed beyond recognition..."},
	{"character": "??????", "line": "And the first time Hell has ever been this populated."},
	{"character": "Reimu", "line": "To think this is another part of your 'grand scheme'..."},
	{"character": "Yukari", "line": "How was the 'convention' for you? Never has this village been this wide spread."},
	{"character": "Reimu", "line": "A grand firework display that burns the village down, what got you out of your hibernation?"},
	{"character": "Yukari", "line": "fufufu... you know the purpose of the Hakurei barrier and why Gensokyo was establish correct?"},
	{"character": "Reimu", "line": " I'll humor you for a moment then wiping the floor with you after, to maintain a world for youkais and others."},
	{"character": "Yukari", "line": "And beliefs is at the core of it, as the air to a bird or the sea to a fish, so is contempt to the contemptible."},
	{"character": "Reimu", "line": "But you already knew it would end up like this, why would you let it happen?"},
	{"character": "Yukari", "line": "I envy your impatiences... I 'allowed' outsiders to be residents of Gensokyo spiritually as well."},
	{"character": "Reimu", "line": "But you already knew it would end up like this, why would you let it happen?"},
	{"character": "Yukari", "line": "Emotion is strength, and with suffering, holds an eternity for Gensokyo, don't you agree?"},
	{"character": "Reimu", "line": "Hearing you already leave a bad taste in my mouth, not in this lifetime."},
]
var dialogue_final_boss_victory = [
	{"character": "Yukari", "line": "I don't exactly care for your intention, but your long-term plan has caused plenty issues for me enough already."},
	{"character": "Reimu", "line": "If the fool would persist in his folly he would become wise, don't you agree?"},
	{"character": "Yukari", "line": "Hakurei Reimu"},
	{"character": "Reimu", "line": "Go love without the help of any Thing on Earth."},
]
var dialogue_epilogue = [
	{"character": "Yukari", "line": "When my body refuse to be mine... would I have the same lives as them? and her mine?"},
	{"character": "Reimu", "line": "That's one for you, two for me!"},
	{"character": "Yukari", "line": "When did you learn how to count? We're even!"},
	{"character": "Reimu", "line": "this isn't going to end anytime soon is it?"},
	{"character": "Yukari", "line": "No... at least I know I have more conviction than you."},
	{"character": "Reimu", "line": "this isn't going to end anytime soon is it?"},
	{"character": "Yukari", "line": "When did you learn how to count? We're even!"},
	{"character": "Reimu", "line": "this isn't going to end anytime soon is it?"},
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

var dialogues = {
	"dialogue_Prologue": dialogue_Prologue,
	"dialogue_final_boss_dialogue": dialogue_final_boss_dialogue,
	"dialogue_final_boss_victory": dialogue_final_boss_victory,
	"dialogue_epilogue": dialogue_epilogue
}

func get_dialogue(dialogueString: String):
	if dialogueString in dialogues:
		return dialogues[dialogueString]
	else:
		return null  # or handle the case where the dialogue is not found

func _on_dialogue():
	if $".".visible == true:
		_set_all_process(false)
	else:
		dialogue = get_dialogue(dialogueString)
		dialogue_index = 0
		_update_show_text()
		_set_all_process(true)

var press_cancel_buffer = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("confirm"):
		if dialogue_index >= dialogue.size()-1:
			if dialogueString == "dialogue_final_boss_victory":
				#for child in PoolingManager.get_children():
					#if child.has_method("reset_pool"):
						#child.reset_pool()
				#GameManager.reset_game()
				#GameManager.emit_signal("_Dialogue")
				get_tree().paused = false
				get_tree().change_scene_to_file("res://Scene/victory_scence.tscn")
				
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
	else:
		$Reimu.animation = "hide"
		$NPC.animation = "hide"

func _set_all_process(x : bool):
	set_process(x)
	set_physics_process(x)
	set_process_input(x)
	if x:
		$".".visible = true
	else:
		$".".visible = false
