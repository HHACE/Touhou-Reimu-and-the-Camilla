extends Node2D

var enemy_scene = preload("res://Subscene/enemy_test.tscn")
var pool = []

func _ready():
	reset_pool()

func get_enemy() -> Node2D:
	if pool.size() > 0:
		return pool.pop_back()
	else:
		#var enemy = enemy_scene.instantiate()
		return null

func return_enemy(enemy):
	pool.append(enemy)
	#enemy.queue_free()  # Reuse the enemy by making it inactive

func reset_pool():
	# Pre-create a number of enemy objects and add to the pool
	pool.clear()
	for i in range(10):
		var enemy = enemy_scene.instantiate()
		pool.append(enemy)
		#enemy.queue_free()  # Ensure they are not active at start
