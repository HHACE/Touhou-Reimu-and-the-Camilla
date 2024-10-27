extends Area2D

var Health = 5.0;
var SPEED = 600

var despawn_time = 5
var despawn_bool = false

var facing_dir = Vector2.ZERO
var movement_center = Vector2.ZERO  # Define center for circular movement
var circle_radius = 0              # Radius for circular movement
var movement = ""      
var circle_start_position = ""
var circle_direction = false
var phase_offset = 0.0



func _ready() -> void:
	pass
	#movement_center = position


func _process(delta: float) -> void:
	# Get enemy's name to determine movement type
	#var enemy_name = self.name  # Assuming the node name is used to identify the enemy type
	#
	## Apply movement based on the enemy's name
	if movement == "straight_movement":
		position += $EnemyMovePattern.straight_movement(facing_dir, SPEED, delta)
	elif movement == "circular_movement":
		position = movement_center + $EnemyMovePattern.circular_movement(SPEED, circle_radius, circle_start_position, circle_direction, phase_offset)  # Counterclockwise starting from left

	if facing_dir == Vector2.LEFT:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
	if is_off_screen():
		return_self()

func set_all_process(x: bool):
	set_process(x)
	set_physics_process(x)
	$".".visible = x
	if x == true:
		$ShotTimer.start()
		reset_all_property()
		$CollisionShape2D.call_deferred("set_disabled", false)
	else:
		$ShotTimer.stop()
		$CollisionShape2D.call_deferred("set_disabled", true)

func reset_all_property():
	Health = 5.0
	despawn_bool = false
	$DespawnTimer.wait_time = despawn_time
	$DespawnTimer.start()

func is_off_screen() -> bool:
	var screen_size = get_viewport().size 
	return position.x < 0 or position.x > screen_size.x or position.y < 0 or position.y > screen_size.y
func _on_despawn_timer_timeout() -> void:
	despawn_bool = true

func return_self():
	if despawn_bool == true or Health<=0:
		set_all_process(false)
		PoolingManager.get_node("enemyPool").return_enemy_duck(self)
		
func deal_damage(damage: float):
	Health -= damage
	#print("Enemy damage taken: " + str(damage));
	flash_red()
	#TweenManager.flash_red(self)
	if Health <= 0:
		GameManager.score += 100
		return_self()

func flash_red() -> void:
	var tween = create_tween() 
	tween.set_trans(Tween.TRANS_LINEAR)
	#tween.set_ease(Tween.EASE_OUT)

	tween.tween_property($AnimatedSprite2D, "modulate", Color(1, 0, 0), 0.1)
	tween.tween_property($AnimatedSprite2D, "modulate", Color(1, 1, 1), 0.1)
