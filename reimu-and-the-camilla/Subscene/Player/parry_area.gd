extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func set_all_process(x: bool):
	#set_process(x)
	#set_physics_process(x)
	#$".".visible = x
	#if x == true:
		#$CollisionShape2D.call_deferred("set_disabled", false)
	#else:
		#$CollisionShape2D.call_deferred("set_disabled", true)
		


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.deal_damage(10)
	if area.is_in_group("EnemyBullet") or area.is_in_group("EnemyBullet2"):
		# Calculate parry direction or normal, in this case, let's say we just use 'direction'
		var parry_direction = (area.global_position - global_position).normalized()
		area._got_parry(parry_direction)
		
		
