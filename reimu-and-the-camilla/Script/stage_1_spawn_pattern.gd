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
		"interval": 0.1,
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
		"positions": null,
		"event": "dialogue_Prologue",
		"interval": 0.0
	},
	{
		"positions": [Vector2(-100, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.RIGHT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "bottom-left",
		"circle_direction": true,
		"interval": 1.0,
		"enemy_scene": "enemy_duck"
	},
	{
		"positions": [Vector2(-100, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.RIGHT,
		"circle_radius": 800.0,
		"phase_offset": 0.5,
		"circle_start_position": "bottom-left",
		"circle_direction": true,
		"interval": 0.0,
		"enemy_scene": "enemy_duck"
	},
	{
		"positions": [Vector2(-100, 545)],
		"movement": "circular_movement",
		"despawn_timer": 10,
		"speed": 0.25,
		"direction": Vector2.RIGHT,
		"circle_radius": 800.0,
		"phase_offset": 1.0,
		"circle_start_position": "bottom-left",
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
		"interval": 10.0,
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
	

#	phase 4
	{
		"positions": [Vector2(-100, 700), Vector2(-100, 100)],
		"movement": "straight_movement",
		"despawn_timer": 10,
		"speed": 100,
		"direction": Vector2.RIGHT,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 6.0,
		"enemy_scene": "enemy_test"
	},
	{
		"positions": [Vector2(2000, 700), Vector2(2000, 100)],
		"movement": "straight_movement",
		"despawn_timer":10,
		"speed": 100,
		"direction": Vector2.LEFT,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 0.0,
		"enemy_scene": "enemy_test"
	},
#	phase 5
	{
		"positions": [Vector2(2000, 817)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 5.0,
		"enemy_scene": "enemy_duck"
	},
	{
		"positions": [Vector2(2000, 545)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.5,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 0.5,
		"enemy_scene": "enemy_duck"
	},
	{
		"positions": [Vector2(2000, 272)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.5,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 1.0,
		"enemy_scene": "enemy_duck"
	},
	
	{
		"positions": [Vector2(-100, 817)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.RIGHT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 5.0,
		"enemy_scene": "enemy_duck"
	},
	{
		"positions": [Vector2(-100, 545)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.RIGHT,
		"circle_radius": 800.0,
		"phase_offset": 0.5,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 0.5,
		"enemy_scene": "enemy_duck"
	},
	{
		"positions": [Vector2(-100, 272)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.RIGHT,
		"circle_radius": 800.0,
		"phase_offset": 0.5,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 1.0,
		"enemy_scene": "enemy_duck"
	},

#	phase 6
	{
		"positions": [Vector2(2000, 100), Vector2(2000, 200), Vector2(2000, 300), Vector2(2000, 400),Vector2(2000, 500)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 5.0,
		"enemy_scene": "enemy_butterfly"
	},

	{
		"positions": [Vector2(-100, 600), Vector2(-100, 700), Vector2(-100, 800), Vector2(-100, 900),Vector2(-100, 1000)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.RIGHT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 3.0,
		"enemy_scene": "enemy_butterfly"
	},

#	phase 7
	{
		"positions": [Vector2(2000, 100), Vector2(2000, 300), Vector2(2000, 500), Vector2(2000, 700),Vector2(2000, 900)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.LEFT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 5.0,
		"enemy_scene": "enemy_test"
	},
#	phase 8
	{
		"positions": [Vector2(-100, 100), Vector2(-100, 300), Vector2(-100, 500), Vector2(-100, 700),Vector2(-100, 900)],
		"movement": "straight_movement",
		"despawn_timer": 100,
		"speed": 200,
		"direction": Vector2.RIGHT,
		"circle_radius": 800.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": true,
		"interval": 5.0,
		"enemy_scene": "enemy_test"
	},
#	phase 9
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
		"interval": 10.0,
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

#	phase final
	{
		"positions": null,
		"event": "dialogue_final_boss_dialogue",
		"interval": 10.0
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
		"interval": 1.0,
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
	
