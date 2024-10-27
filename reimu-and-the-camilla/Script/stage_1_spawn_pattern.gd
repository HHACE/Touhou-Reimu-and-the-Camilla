extends Node2D



var patterns = [
	{
		"positions": [Vector2(2000, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "top-left",
		"circle_direction": false,
		"interval": 0.0,
		"enemy_scene": "enemy_test"
	},
	{
		"positions": [Vector2(2000, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.5,
		"circle_start_position": "top-left",
		"circle_direction": false,
		"interval": 0.0,
		"enemy_scene": "enemy_test"
	},
	{
		"positions": [Vector2(2000, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 1.0,
		"circle_start_position": "top-left",
		"circle_direction": false,
		"interval": 0.0,
		"enemy_scene": "enemy_test"
	},
	{
		"positions": [Vector2(2000, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "bottom-right",
		"circle_direction": true,
		"interval": 0.0,
		"enemy_scene": "enemy_test"
	},
	{
		"positions": [Vector2(2000, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.5,
		"circle_start_position": "bottom-right",
		"circle_direction": true,
		"interval": 0.0,
		"enemy_scene": "enemy_test"
	},
	{
		"positions": [Vector2(2000, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 1.0,
		"circle_start_position": "bottom-right",
		"circle_direction": true,
		"interval": 0.0,
		"enemy_scene": "enemy_test"
	},
#phase 2
	{
		"positions": [Vector2(-100, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "top-left",
		"circle_direction": true,
		"interval": 0.0,
		"enemy_scene": "enemy_duck"
	},
	{
		"positions": [Vector2(-100, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.5,
		"circle_start_position": "top-left",
		"circle_direction": true,
		"interval": 0.0,
		"enemy_scene": "enemy_duck"
	},
	{
		"positions": [Vector2(-100, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 1.0,
		"circle_start_position": "top-left",
		"circle_direction": true,
		"interval": 0.0,
		"enemy_scene": "enemy_duck"
	},
	
#	phase 3
	{
		"positions": [Vector2(-100, 700), Vector2(-100, 100)],
		"movement": "straight_movement",
		"despawn_timer": 5,
		"speed": 300,
		"direction": Vector2.RIGHT,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 2.0,
		"enemy_scene": "enemy_butterfly"
	},
	{
		"positions": [Vector2(2000, 700), Vector2(2000, 100)],
		"movement": "straight_movement",
		"despawn_timer": 5,
		"speed": 300,
		"direction": Vector2.LEFT,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 0.0,
		"enemy_scene": "enemy_butterfly"
	},
	{
		"positions": [Vector2(1566, 545)],
		"movement": "circular_movement",
		"despawn_timer": 1000,
		"speed": 0.5,
		"direction": Vector2.LEFT,
		"circle_radius": 100.0,
		"phase_offset": 0.0,
		"circle_start_position": "left",
		"circle_direction": true,
		"interval": 5.0,
		"enemy_scene": "enemy_boss_yukari"
	},
	#phase 2
	#{
		#"positions": [Vector2(-100, 545)],
		#"movement": "circular_movement",
		#"despawn_timer": 100,
		#"speed": 0.25,
		#"direction": Vector2.LEFT,
		#"circle_radius": 800.0,
		#"phase_offset": 0.0,
		#"circle_start_position": "top-left",
		#"circle_direction": true,
		#"interval": 0.0,
		#"enemy_scene": "enemy_duck"
	#},
	#{
		#"positions": [Vector2(-100, 545)],
		#"movement": "circular_movement",
		#"despawn_timer": 100,
		#"speed": 0.25,
		#"direction": Vector2.LEFT,
		#"circle_radius": 800.0,
		#"phase_offset": 0.5,
		#"circle_start_position": "top-right",
		#"circle_direction": true,
		#"interval": 1.0,
		#"enemy_scene": "enemy_duck"
	#},
	#{
		#"positions": [Vector2(-100, 544)],
		#"movement": "circular_movement",
		#"despawn_timer": 100,
		#"speed": 0.25,
		#"direction": Vector2.LEFT,
		#"circle_radius": 800.0,
		#"phase_offset": 0.0,
		#"circle_start_position": "bottom-left",
		#"circle_direction": true,
		#"interval": 0.0,
		#"enemy_scene": "enemy_duck"
	#},
	

	
]
	
