extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_all_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#pass
	input_check()

func input_check():
	if Input.is_action_just_pressed("cancel"):
		GameManager.emit_signal("_Resume")
		$"../Pause"._set_all_process(false)

func _set_all_process(x : bool):
	set_process(x)
	set_physics_process(x)
	if x:
		$".".visible = true
	else:
		$".".visible = false
