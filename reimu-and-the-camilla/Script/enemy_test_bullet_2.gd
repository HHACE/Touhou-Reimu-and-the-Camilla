extends Area2D



var speed = 600
var tempspeed = speed
var direction = Vector2(-1,0)

var movement = ""
var circle_center 
var circle_radius = 0              # Radius for circular movement
var circle_start_position = ""
var circle_direction = false
var phase_offset = 0.0

var is_parry = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _for_mode_changing():
	if GameManager.is_mode_switching == false:
		if is_in_group("EnemyBullet"):
			speed = tempspeed
			modulate = Color(1, 1, 1, 1)
		elif is_in_group("EnemyBullet2"):
			speed = tempspeed/2
			modulate = Color(0.5, 0.5, 0.5, 1)
	else: 
		if is_in_group("EnemyBullet"):
			speed = tempspeed/2
			modulate = Color(0.5, 0.5, 0.5, 1)
		elif is_in_group("EnemyBullet2"):
			speed = tempspeed
			modulate = Color(1, 1, 1, 1)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_for_mode_changing()
	if movement == "straight_movement":
		position += $BulletMovePattern.straight_movement(direction, speed, delta)
	elif movement == "circular_movement":
		if circle_center.visible==false:
			set_all_process(false)
			PoolingManager.get_node("bulletPool").return_enemy_test_bullet_2(self)
		position = circle_center.position + $BulletMovePattern.circular_movement(speed, circle_radius, circle_start_position, circle_direction, phase_offset)  # Counterclockwise starting from left

		
	if is_off_screen():
		set_all_process(false)
		PoolingManager.get_node("bulletPool").return_enemy_test_bullet_2(self)
		

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
		reset_value()
		$CollisionShape2D.call_deferred("set_disabled", true)
		
func reset_value():
	is_parry = false
	modulate = Color(1, 1, 1, 1)
	$".".remove_from_group("PlayerBullet")
	$".".add_to_group("EnemyBullet2")


func _got_parry(parry_direction: Vector2):
	is_parry = true
	# Reflect the bullet's direction against the parry direction (like a mirror reflection)
	direction = direction.bounce(parry_direction.normalized())
	modulate = Color(1, 1, 1, 0.3)
	remove_from_group("EnemyBullet2")
	add_to_group("PlayerBullet")

func _on_area_entered(area: Area2D) -> void:
	#if area.is_in_group("PlayerParry") and is_parry == false:
		#is_parry = true
		#direction = -direction
		#modulate = Color(1, 1, 1, 0.3)
		#$".".remove_from_group("EnemyBullet2")
		#$".".add_to_group("PlayerBullet")
		
	if is_parry==true and area.is_in_group("Enemy"):
		area.deal_damage(2);
