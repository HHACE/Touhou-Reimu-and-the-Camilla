extends CharacterBody2D

var SPEED = 600.0
var facing_direction = Vector2.RIGHT
var direction = Vector2.ZERO


func _ready() -> void:
	GameManager.connect("_GameOver", _on_game_over)
	GameManager.connect("_Pause",_on_pause)
	GameManager.connect("_Resume",_on_resume)
	GameManager.connect("_win", _on_win)


var is_paused: bool = false

func _on_game_over():
	#is_paused = !is_paused
	#get_tree().paused = is_paused
	$"../GameOver"._set_all_process(true)
func _on_pause():
	pass
	#is_paused = !is_paused
	#get_tree().paused = is_paused
func _on_resume():
	pass
	#is_paused = !is_paused
	#get_tree().paused = is_paused
func _on_win():
	pass

func shoot_bullet():
	var bullet = PoolingManager.get_node("bulletPool").get_bullet()
	if bullet != null:
		bullet.position = position  
		bullet.direction = facing_direction
		bullet.set_all_process(true)
		if bullet.get_parent() == null:
			get_parent().add_child(bullet)
			
func _input(event):
	if Input.is_action_just_pressed("flip_player"):
		if $AnimatedSprite2D.flip_h == false:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D/afterEffect.flip_h = true
			$parryArea.transform.x.x = -1
		else:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D/afterEffect.flip_h = false
			$parryArea.transform.x.x = 1
		facing_direction.x = -facing_direction.x
		
		var tween = create_tween() 
		tween.set_trans(Tween.TRANS_LINEAR)

		tween.parallel().tween_property($AnimatedSprite2D/afterEffect, "scale", Vector2(1, 1), 0.0)
		tween.parallel().tween_property($AnimatedSprite2D/afterEffect, "modulate", Color(1, 1, 1, 1), 0.0)
		
		tween.tween_property($AnimatedSprite2D/afterEffect, "scale", Vector2(2, 2), 0.5)
		tween.parallel().tween_property($AnimatedSprite2D/afterEffect, "modulate", Color(1, 1, 1, 0), 0.5)

		
	if Input.is_action_just_pressed("cancel"):
		#if $"../Pause".visible==false:
		GameManager.emit_signal("_Pause")
		$"../Pause"._set_all_process(true)
		#else:
			#$"../Pause"._set_all_process(false)
	#if Input.is_action_just_pressed("confirm"):
		#GameManager.emit_signal("_Dialogue")
		#_set_all_process(false)
		
	if Input.is_action_just_pressed("parry"):
		parry_start()
	if Input.is_action_just_pressed("mode_switching"):
		GameManager.emit_signal("_mode_switching")
		$modeSprite.scale
		var tween = create_tween() 
		tween.set_trans(Tween.TRANS_LINEAR)
		if GameManager.is_mode_switching == true:
			tween.tween_property($modeSprite, "scale", Vector2(1, 1), 0.0)
			tween.parallel().tween_property($modeSprite, "modulate", Color(1, 1, 1, 0), 0.0)

			tween.tween_property($modeSprite, "scale", Vector2(100, 100), 0.75)
			tween.parallel().tween_property($modeSprite, "modulate", Color(0, 0, 0, 0.2), 0.5)
		else:
			tween.tween_property($modeSprite, "scale", Vector2(100, 100), 0.0)
			tween.parallel().tween_property($modeSprite, "modulate", Color(0, 0, 0, 0.2), 0.0)
			
			tween.tween_property($modeSprite, "scale", Vector2(1, 1), 0.75)
			tween.parallel().tween_property($modeSprite, "modulate", Color(1, 1, 1, 0), 0.75)
		
	if Input.is_action_pressed("slow_down"):
		SPEED = 300
	else:
		SPEED = 600
		
func parry_start():
	$parryArea/AnimationTree.get("parameters/playback").travel("slash")
#func slow_down():
	#if SPEED == 600:
		#SPEED = SPEED/2
	#else:
		#SPEED = 600
	
func get_input() -> Vector2:
	var direction := Vector2()
	direction.y = Input.get_axis("move_up", "move_down")
	direction.x = Input.get_axis("move_left", "move_right")
	#if direction.x != 0:
		#facing_direction.x = direction.x

	return direction.normalized()



func _physics_process(delta: float) -> void:
	direction = get_input()
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity.y = 0
		velocity.x = 0
	
	move_and_slide()
	
	# Clamp position to stay within the viewport
	var viewport_size = get_viewport().size
	position.x = clamp(position.x, 0, viewport_size.x)
	position.y = clamp(position.y, 0, viewport_size.y)
	
func _set_all_process(x : bool):
	set_process(x)
	set_physics_process(x)
	set_process_input(x)


func _set_invincible(x : bool):
	if x == true:
		hit_buffer = true
		$ShotTimer.start()
		$Area2D/CollisionShape2D.call_deferred("set_disabled", false)
	else:
		$ShotTimer.stop()
		$Area2D/CollisionShape2D.call_deferred("set_disabled", true)
		
func _on_shot_timer_timeout() -> void:
	shoot_bullet()

var hit_buffer = true
func _on_area_2d_area_entered(area: Area2D) -> void:
	if hit_buffer and not area.is_in_group("PlayerBullet"):
		hit_buffer = false  # Disable further hits until reset
		#print("Player got hit")
		GameManager.Playerlife -= 1
		death_animation()
		
		# Handle Game Over condition
		if GameManager.Playerlife <= 0:
			await get_tree().create_timer(1.0).timeout
			GameManager.emit_signal("_GameOver")


func death_animation():
	_set_all_process(false)
	_set_invincible(false)
	var tween = create_tween() 
	tween.set_trans(Tween.TRANS_LINEAR)

	tween.tween_property($AnimatedSprite2D, "scale", Vector2(2, 2), 0.5)
	tween.parallel().tween_property($AnimatedSprite2D, "modulate", Color(1, 1, 1, 0), 0.5)
	
	await get_tree().create_timer(0.6).timeout
	if GameManager.Playerlife > 0:
		spawn_animation()
	
	

func spawn_animation():
	var spawnPoint = Vector2(-100, 540)
	var targetPoint = Vector2(280, 540)
	
	$".".position = spawnPoint
	#await get_tree().create_timer(0.1).timeout 
	#$AnimatedSprite2D.scale = Vector2(1, 1)
	#$AnimatedSprite2D.modulate = Color(1, 1, 1, 1)
	var tween = create_tween() 
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(0.3, 0.3), 0.0)
	tween.parallel().tween_property($AnimatedSprite2D, "modulate", Color(1, 1, 1, 0.5), 0.0)
	
	tween.tween_property($".", "position", targetPoint, 1.0)
	#tween.parallel().tween_property($AnimatedSprite2D, "modulate", Color(1, 1, 1, 0), 0.5)
	
	await get_tree().create_timer(1.0).timeout 
	_set_all_process(true)
	await get_tree().create_timer(0.5).timeout 
	#tween.tween_property($AnimatedSprite2D, "modulate", Color(1, 1, 1, 1), 0.0)
	$AnimatedSprite2D.modulate = Color(1, 1, 1, 1)
	_set_invincible(true)
