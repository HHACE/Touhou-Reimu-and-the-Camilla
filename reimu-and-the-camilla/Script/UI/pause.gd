extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_all_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#pass
	input_check()

func input_check():
	if Input.is_action_just_pressed("cancel") and press_buffer==false:
		
		GameManager.emit_signal("_Resume")
		_set_all_process(false)

var press_buffer = false

func _set_all_process(x : bool):
	press_buffer = true
	set_process(x)
	set_physics_process(x)
	if x:
		$".".visible = true
	else:
		$".".visible = false
	await get_tree().create_timer(0.1).timeout
	press_buffer = false
	
