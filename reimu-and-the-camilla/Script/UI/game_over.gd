extends Panel

var tryAgainSelected = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_all_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_menu_control()
	_submit_selected()

func _set_all_process(x : bool):
	set_process(x)
	set_physics_process(x)
	if x:
		$".".visible = true
	else:
		$".".visible = false

func _menu_control():
	var moved = false
	if Input.is_action_just_pressed("move_left") || Input.is_action_just_pressed("move_right"):
		tryAgainSelected = !tryAgainSelected;
		if tryAgainSelected:
			$TryAgain/Selection.show();
			$MainMenu/Selection.hide();
		else:
			$MainMenu/Selection.show();
			$TryAgain/Selection.hide();
			
func _submit_selected():

	if Input.is_action_just_pressed("confirm"):
		GameManager.emit_signal("_Resume")
		
		#PoolingManager.get_node("enemyPool").reset_pool()
		#PoolingManager.get_node("bulletPool").reset_pool()
		for child in PoolingManager.get_children():
			if child.has_method("reset_pool"):
				child.reset_pool()
		GameManager.reset_game()
		
		if tryAgainSelected:
			get_tree().change_scene_to_file("res://Scene/game_prototype.tscn")
		else:
			get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")
