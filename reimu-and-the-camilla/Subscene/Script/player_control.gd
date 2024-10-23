extends CharacterBody2D

const SPEED = 300.0
#var bullet_scene = preload("res://Subscene/reimu_bullet_1.tscn")
var facing_direction = Vector2.RIGHT

func _ready() -> void:
	pass


func shoot_bullet():
	var bullet = BulletPool.get_bullet()
	if bullet != null:
		bullet.position = position  # Adjust bullet spawn position if neede
		bullet.velocity = facing_direction
		bullet.set_all_process(true)
		#bullet.bullet_pool = BulletPool
		get_parent().add_child(bullet)

var direction
func get_input():
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
		##slide
		#velocity.y = move_toward(velocity.y, 0, SPEED * delta)
		#velocity.x = move_toward(velocity.x, 0, SPEED * delta)
	
	move_and_slide()


func _on_shot_timer_timeout() -> void:
	shoot_bullet()
