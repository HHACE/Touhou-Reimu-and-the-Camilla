extends Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_all_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label2.text = "Final Score: \n" + str(GameManager.score) 
	_submit_selected()

func _set_all_process(x : bool):
	set_process(x)
	set_physics_process(x)
	if x:
		$".".visible = true
	else:
		$".".visible = false
			
func _submit_selected():

	if Input.is_action_just_pressed("confirm"):
		
		for child in PoolingManager.get_children():
			if child.has_method("reset_pool"):
				child.reset_pool()
		GameManager.reset_game()
		get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")
