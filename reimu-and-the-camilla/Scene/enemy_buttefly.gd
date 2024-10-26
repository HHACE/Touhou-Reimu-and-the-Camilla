extends Area2D

var Health = 3.0;
const SPEED = 600

var facing_dir =  Vector2.ZERO
#var velocity = Vector2.ZERO
#var enemy_pool = null

func _ready() -> void:
	pass
	#enemy_pool = get_node("/root/EnemyPool")  # Adjust path as needed

func _process(delta: float) -> void:
	position.x += facing_dir.x * SPEED * delta
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
	Health = 3.0;

func is_off_screen() -> bool:
	var screen_size = get_viewport().size * 1.25
	return position.x < -screen_size.x/2 or position.x > screen_size.x or position.y < -screen_size.y/2 or position.y > screen_size.y

func return_self():
	set_all_process(false)
	PoolingManager.get_node("enemyPool").return_enemy_butterfly(self)
		
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
