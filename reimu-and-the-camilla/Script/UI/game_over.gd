extends Panel

var MenuIndex = 0
var menu_buttons = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_all_process(false)
	menu_buttons.append($restart)
	menu_buttons.append($mainMenu)
	_display_selected()  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_menu_control()
	_display_selected()
	_submit_selected()

func _set_all_process(x : bool):
	set_process(x)
	set_physics_process(x)
	if x:
		$".".visible = true
	else:
		$".".visible = false

func _menu_control():
	if Input.is_action_just_pressed("move_left"):
		MenuIndex = (MenuIndex + 1) % menu_buttons.size()  
	elif Input.is_action_just_pressed("move_right"):
		MenuIndex = (MenuIndex - 1 + menu_buttons.size()) % menu_buttons.size()  
func _display_selected():
	for i in range(menu_buttons.size()):
		if i == MenuIndex:
			menu_buttons[i].grab_focus()  
		else:
			menu_buttons[i].release_focus() 

func _submit_selected():

	if Input.is_action_just_pressed("confirm"):
		GameManager.emit_signal("_Resume")
		
		PoolingManager.get_node("enemyPool").reset_pool()
		PoolingManager.get_node("bulletPool").reset_pool()
		for child in PoolingManager.get_children():
			if child.has_method("reset_pool"):
				child.reset_pool()
		GameManager.reset_game()
		
		if MenuIndex == 0:

			get_tree().change_scene_to_file("res://Scene/game_prototype.tscn")
		else:
			get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")
