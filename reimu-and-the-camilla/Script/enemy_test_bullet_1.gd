extends Area2D

var speed = 600
var direction = Vector2(-1,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	if is_off_screen():
		set_all_process(false)
		PoolingManager.get_node("bulletPool").return_enemy_test_bullet(self)
		

func is_off_screen() -> bool:
	var screen_size = get_viewport().size * 1.25
	return position.x < -screen_size.x/2 or position.x > screen_size.x or position.y < -screen_size.y/2 or position.y > screen_size.y

func set_all_process(x: bool):
	set_process(x)
	set_physics_process(x)
	$".".visible = x
	if x == true:
		$CollisionShape2D.call_deferred("set_disabled", false)
	else:
		$CollisionShape2D.call_deferred("set_disabled", true)
