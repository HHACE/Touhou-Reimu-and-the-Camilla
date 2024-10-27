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
		if pattern["positions"] == null:
			$"../DialogueBox".dialogueString = pattern["event"]
			GameManager.emit_signal("_Dialogue") 
			
			current_pattern_index += 1
			if current_pattern_index < patterns.size():
				if patterns[current_pattern_index]["interval"] == 0:
					_on_timer_timeout()
				else:
					timer.wait_time = patterns[current_pattern_index]["interval"]
					timer.start()
			else:
				timer.stop()  # Stop once all enemies in the pattern have spawned
		else:
			for i in pattern["positions"]:
					
				#print(i)
				_spawn_enemy(i,pattern["movement"],pattern["despawn_timer"], pattern["speed"], pattern["direction"], pattern["circle_radius"], pattern["phase_offset"], pattern["circle_start_position"], pattern["circle_direction"], pattern["enemy_scene"])
			current_pattern_index += 1
			if current_pattern_index < patterns.size():
				if patterns[current_pattern_index]["interval"] == 0:
					_on_timer_timeout()
				else:
					timer.wait_time = patterns[current_pattern_index]["interval"]
					timer.start()
			else:
				timer.stop()  # Stop once all enemies in the pattern have spawned
		
		
var enemy_funcs = {
	"enemy_test": PoolingManager.get_node("enemyPool").get_enemy_test,
	"enemy_duck": PoolingManager.get_node("enemyPool").get_enemy_duck,
	"enemy_butterfly": PoolingManager.get_node("enemyPool").get_enemy_butterfly,
	"enemy_boss_yukari": PoolingManager.get_node("enemyPool").get_enemy_boss_yukari
}

func _spawn_enemy(spawn_position, movement, despawn_timer, speed, direction, circle_radius, phase_offset, circle_start_position ,circle_direction,  enemy_scene):
	var enemy = enemy_funcs[enemy_scene].call()
	if enemy != null:
		enemy.position = spawn_position
		enemy.movement = movement
		enemy.movement_center = spawn_position
		enemy.despawn_time =  despawn_timer
		enemy.SPEED =  speed
		enemy.facing_dir =  direction
		enemy.circle_radius =  circle_radius
		enemy.phase_offset =  phase_offset
		enemy.circle_start_position =  circle_start_position
		enemy.circle_direction =  circle_direction
		if enemy.get_parent() == null:
			get_parent().add_child(enemy)
		enemy.set_all_process(true)
