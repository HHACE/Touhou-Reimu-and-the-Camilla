extends Control

func _process(delta: float) -> void:
	if !visible:
		
		return;
	if (Input.is_action_just_pressed("cancel") || Input.is_action_just_pressed("confirm")):
		visible = false;
		await get_tree().process_frame
		get_parent().ReturnToMenu();
