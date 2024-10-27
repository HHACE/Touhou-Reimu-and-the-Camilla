extends Node2D


var enemy_test = [
	{
		"direction": [Vector2.ZERO],
		"random_addon": null,
		"movement": "straight_movement",
		"speed": 600,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 3.0,
		"bullet_scene": "test_bullet"
	},
	{
		"direction": [Vector2.ZERO],
		"random_addon": null,
		"movement": "straight_movement",
		"speed": 600,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 1.0,
		"bullet_scene": "test_bullet"
	},
	{
		"direction": [Vector2.ZERO],
		"random_addon": null,
		"movement": "straight_movement",
		"speed": 600,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 1.0,
		"bullet_scene": "test_bullet"
	}
]

var enemy_duck = [
	{
		"direction": [Vector2.ZERO],
		"random_addon": null,
		"movement": "straight_movement",
		"speed": 600,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 3.0,
		"bullet_scene": "test_bullet"
	},
	{
		"direction": [Vector2.ZERO, Vector2.ZERO],
		"random_addon": Vector2(randf_range(-0.5,0.5),randf_range(-0.5,0.5)),
		"movement": "straight_movement",
		"speed": 600,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 0.0,
		"bullet_scene": "test_bullet"
	},
	{
		"direction": [Vector2.ZERO, Vector2.ZERO, Vector2.ZERO],
		"random_addon": Vector2(randf_range(-0.5,0.5),randf_range(-0.5,0.5)),
		"movement": "straight_movement",
		"speed": 600,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 0.2,
		"bullet_scene": "test_bullet"
	}
]

var enemy_butterfly = [
	{
		"direction": [Vector2(0, 1)],
		"random_addon": null,
		"movement": "circular_movement",
		"speed": 1.0,
		"circle_radius": 100.0,
		"phase_offset": 0.0,
		"circle_start_position": "top",
		"circle_direction": false,
		"interval": 3.0,
		"bullet_scene": "test_bullet_2"
	},
	{
		"direction": [Vector2(0, 1)],
		"random_addon": null,
		"movement": "circular_movement",
		"speed": 1.0,
		"circle_radius": 100.0,
		"phase_offset":33.0,
		"circle_start_position": "top",
		"circle_direction": false,
		"interval": 0.0,
		"bullet_scene": "test_bullet_2"
	},
	{
		"direction": [Vector2(0, 1)],
		"random_addon": null,
		"movement": "circular_movement",
		"speed": 1.0,
		"circle_radius": 100.0,
		"phase_offset": 66.0,
		"circle_start_position": "top",
		"circle_direction": false,
		"interval": 0.0,
		"bullet_scene": "test_bullet_2"
	}
]

var enemy_boss_yukari = [
	{
		"direction": [Vector2(-1, 0), Vector2(-0.75, 0.75), Vector2(-0.75, -0.75), Vector2(-0.875, 0.35), Vector2(-0.875, -0.35)],
		"random_addon": null,
		"movement": "straight_movement",
		"speed": 600,
		"circle_radius": 0.0,
		"phase_offset": 0.0,
		"circle_start_position": "",
		"circle_direction": false,
		"interval": 0.1,
		"bullet_scene": "test_bullet_2"
	}
]


# Define a dictionary to map enemy names to their respective patterns
var enemy_patterns = {
	"enemy_test": enemy_test,
	"enemy_duck": enemy_duck,
	"enemy_butterfly": enemy_butterfly,
	"enemy_boss_yukari": enemy_boss_yukari
}

func _get_enemy_pattern(name: String):
	# Access the pattern directly from the dictionary
	if enemy_patterns.has(name):
		return enemy_patterns[name]
	else:
		return null  # Return 
	#print(enemy_patterns[name])
	#return enemy_patterns[name]
		
