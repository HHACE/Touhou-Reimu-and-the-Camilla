extends Node2D

var enemy_test_scene = preload("res://Subscene/Enemies/enemy_test.tscn")
var enemy_duck_scene = preload("res://Subscene/Enemies/enemy_duck.tscn")
var enemy_butterfly_scene = preload("res://Subscene/Enemies/enemy_butterfly.tscn")
var enemy_boss_yukari_scene = preload("res://Subscene/Enemies/enemy_boss_yukari.tscn")
var enemy_test_pool = []
var enemy_duck_pool = []
var enemy_butterfly_pool = []
var enemy_boss_yukari_pool = []

func _ready():
	reset_pool()

func get_enemy_test() -> Node2D:
	if enemy_test_pool.size() > 0:
		return enemy_test_pool.pop_back()
	else:
		return null

func get_enemy_duck() -> Node2D:
	if enemy_duck_pool.size() > 0:
		return enemy_duck_pool.pop_back()
	else:
		return null

func get_enemy_butterfly() -> Node2D:
	if enemy_butterfly_pool.size() > 0:
		return enemy_butterfly_pool.pop_back()
	else:
		return null
		
func get_enemy_boss_yukari() -> Node2D:
	if enemy_boss_yukari_pool.size() > 0:
		return enemy_boss_yukari_pool.pop_back()
	else:
		return null

func return_enemy_test(enemy):
	enemy_test_pool.append(enemy)
func return_enemy_duck(enemy):
	enemy_duck_pool.append(enemy)
func return_enemy_butterfly(enemy):
	enemy_butterfly_pool.append(enemy)
func return_enemy_boss_yukari(enemy):
	enemy_boss_yukari_pool.append(enemy)

func reset_pool():
	# Pre-create a number of enemy objects and add to the pool
	enemy_test_pool.clear()
	enemy_duck_pool.clear()
	enemy_butterfly_pool.clear()
	enemy_boss_yukari_pool.clear()
	for i in range(50):
		var enemy_test = enemy_test_scene.instantiate()
		var enemy_duck = enemy_duck_scene.instantiate()
		var enemy_butterfly = enemy_butterfly_scene.instantiate()
		enemy_test_pool.append(enemy_test)
		enemy_duck_pool.append(enemy_duck)
		enemy_butterfly_pool.append(enemy_butterfly)
		#enemy.queue_free()  # Ensure they are not active at start
	enemy_boss_yukari_pool.append(enemy_boss_yukari_scene.instantiate())
