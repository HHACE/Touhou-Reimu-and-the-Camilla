extends Area2D

var Health = 5.0;
const SPEED = 600
#var velocity = Vector2.ZERO
#var enemy_pool = null

func _ready() -> void:
	pass
	#enemy_pool = get_node("/root/EnemyPool")  # Adjust path as needed

func _process(delta: float) -> void:
	position.x += -SPEED * delta
	if is_off_screen():
		return_self()

func set_all_process(x: bool):
	set_process(x)
	set_physics_process(x)
	$".".visible = x
	if x == true:
		$CollisionShape2D.disabled = false
	else:
		$CollisionShape2D.disabled = true

func is_off_screen() -> bool:
	var screen_size = get_viewport().size * 2
	return position.x < -screen_size.x or position.x > screen_size.x or position.y < -screen_size.x or position.y > screen_size.y

func return_self():
	set_all_process(false)
	PoolingManager.get_node("enemyPool").return_enemy(self)
		
func deal_damage(damage: float):
	Health -= damage;
	print("Enemy damage taken: " + str(damage));
	if Health <= 0:
		return_self();
	
