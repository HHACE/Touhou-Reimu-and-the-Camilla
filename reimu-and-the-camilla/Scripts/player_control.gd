extends CharacterBody2D

const SPEED = 600.0
var facing_direction = Vector2.RIGHT
var direction = Vector2.ZERO

func _ready() -> void:
	pass

func shoot_bullet():
	var bullet = PoolingManager.get_node("bulletPool").get_bullet()
	if bullet != null:
		bullet.position = position  
		bullet.velocity = facing_direction
		bullet.set_all_process(true)
		if bullet.get_parent() == null:
			get_parent().add_child(bullet)

func get_input() -> Vector2:
	var direction := Vector2()
	direction.y = Input.get_axis("move_up", "move_down")
	direction.x = Input.get_axis("move_left", "move_right")
	if direction.x != 0:
		facing_direction.x = direction.x
	return direction.normalized()

func _physics_process(delta: float) -> void:
	direction = get_input()
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity.y = 0
		velocity.x = 0
	
	move_and_slide()
	
	# Clamp position to stay within the viewport
	var viewport_size = get_viewport().size
	position.x = clamp(position.x, 0, viewport_size.x)
	position.y = clamp(position.y, 0, viewport_size.y)

func _on_shot_timer_timeout() -> void:
	shoot_bullet()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if not area.is_in_group("PlayerBullet"):
		print(area)
