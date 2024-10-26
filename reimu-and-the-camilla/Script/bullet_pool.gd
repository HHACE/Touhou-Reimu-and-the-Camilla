extends Node2D

var bullet_scene = preload("res://Subscene/Player/bullet/reimu_bullet_1.tscn")
var enemy_test_bullet_scene = preload("res://Subscene/Enemies/bullet/enemy_test_bullet_1.tscn")
var enemy_test_bullet_2_scene = preload("res://Subscene/Enemies/bullet/enemy_test_bullet_2.tscn")

var bullet_pool = []
var enemy_test_bullet_pool = []
var enemy_test_bullet_2_pool = []


func _process(delta: float) -> void:
	#print ("me: ",bullet_pool.size())
	pass

func _ready() -> void:
	reset_pool()

func get_bullet():
	if bullet_pool.size() > 0:
		return bullet_pool.pop_back()
	else:
		#var bullet = bullet_scene.instantiate()
		return null


func get_enemy_test_bullet():
	if enemy_test_bullet_pool.size() > 0:
		return enemy_test_bullet_pool.pop_back()
	else:
		#var bullet = bullet_scene.instantiate()
		return null
func get_enemy_test_bullet_2():
	if enemy_test_bullet_2_pool.size() > 0:
		return enemy_test_bullet_2_pool.pop_back()
	else:
		#var bullet = bullet_scene.instantiate()
		return null


func return_bullet(bullet):
	bullet_pool.append(bullet)
func return_enemy_test_bullet(bullet):
	enemy_test_bullet_pool.append(bullet)
func return_enemy_test_bullet_2(bullet):
	enemy_test_bullet_2_pool.append(bullet)

func reset_pool():
	# Pre-create a number of enemy objects and add to the pool
	bullet_pool.clear()
	enemy_test_bullet_pool.clear()
	enemy_test_bullet_2_pool.clear()
	
	for i in range(1000):  # Pre-create 100 bullets
		var bullet = bullet_scene.instantiate()
		var enemy_test_bullet = enemy_test_bullet_scene.instantiate()
		var enemy_test_bullet_2 = enemy_test_bullet_2_scene.instantiate()
		bullet_pool.append(bullet)
		enemy_test_bullet_pool.append(enemy_test_bullet)
		enemy_test_bullet_2_pool.append(enemy_test_bullet_2)
		#bullet.queue_free()
