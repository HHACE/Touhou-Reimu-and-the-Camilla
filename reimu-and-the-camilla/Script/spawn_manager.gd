extends Node2D

var patterns = []

var timer: Timer
var current_pattern_index: int = 0

func _ready():
	patterns = $stage1_spawnPattern.patterns
	
	timer = Timer.new()
	timer.one_shot = false
	timer.wait_time = patterns[0]["interval"]
	timer.connect("timeout", _on_timer_timeout)
	add_child(timer)
	timer.start()

	
func _on_timer_timeout():
	var pattern = patterns[current_pattern_index]
	if pattern != null:
		for i in pattern["positions"]:
			#print(i)
			_spawn_enemy(i, pattern["enemy_scene"])
		current_pattern_index += 1
		if current_pattern_index < patterns.size():
			
			timer.wait_time = patterns[current_pattern_index]["interval"]
			timer.start()
		else:
			timer.stop()  # Stop once all enemies in the pattern have spawned
		
		
var enemy_funcs = {
	"enemy_test": PoolingManager.get_node("enemyPool").get_enemy_test,
	"enemy_duck": PoolingManager.get_node("enemyPool").get_enemy_duck,
	"enemy_butterfly": PoolingManager.get_node("enemyPool").get_enemy_butterfly
}

func _spawn_enemy(position, enemy_scene):
	var enemy = enemy_funcs[enemy_scene].call()
	if enemy != null:
		enemy.position = position
		if position.x < 0:
			enemy.facing_dir =  Vector2.RIGHT
		else:
			enemy.facing_dir =  Vector2.LEFT
		if enemy.get_parent() == null:
			get_parent().add_child(enemy)
		enemy.set_all_process(true)
