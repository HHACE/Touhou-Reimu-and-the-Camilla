extends Node2D

var patterns = []

var timer: Timer
var current_position_index: int = 0

func _ready():
	patterns.append({
		"positions": [Vector2(2000, 100), Vector2(2000, 300), Vector2(2000, 500)],
		"interval": 1.0,
		"enemy_scene": preload("res://Subscene/enemy_test.tscn")
	})
	timer = Timer.new()
	timer.one_shot = false
	timer.wait_time = patterns[0]["interval"]
	timer.connect("timeout", _on_timer_timeout)
	add_child(timer)
	start_pattern(0)

func start_pattern(pattern_index):
	current_position_index = 0
	timer.start()
	
func _on_timer_timeout():
	var pattern = patterns[0]
	if current_position_index < pattern["positions"].size():
		_spawn_enemy(pattern["positions"][current_position_index], pattern["enemy_scene"])
		current_position_index += 1
	else:
		timer.stop()  # Stop once all enemies in the pattern have spawned
		
func _spawn_enemy(position, enemy_scene):
	var enemy = PoolingManager.get_node("enemyPool").get_enemy()
	if enemy != null:
		enemy.position = position
		enemy.set_all_process(true)
		if enemy.get_parent() == null:
			get_parent().add_child(enemy)
