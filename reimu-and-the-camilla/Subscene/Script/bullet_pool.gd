extends Node2D

var bullet_scene = preload("res://Subscene/reimu_bullet_1.tscn")
var bullet_pool = []

func _process(delta: float) -> void:
	#print ("me: ",bullet_pool.size())
	pass

func _ready() -> void:
	for i in range(5):  # Pre-create 100 bullets
		var bullet = bullet_scene.instantiate()
		bullet_pool.append(bullet)
		#bullet.queue_free()

func get_bullet():
	if bullet_pool.size() > 0:
		return bullet_pool.pop_back()
	else:
		#var bullet = bullet_scene.instantiate()
		return null

func return_bullet(bullet):
	#print("meme")
	bullet_pool.append(bullet)
	#bullet.queue_free()
