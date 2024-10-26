extends Node2D


var enemy_test = [
	{
		"direction": [Vector2.ZERO],
		"interval": 3.0,
		"bullet_scene": "test_bullet"
	}
]

var enemy_duck = [
	{
		"direction": [Vector2(0, 1)],
		"interval": 3.0,
		"bullet_scene": "test_bullet"
	}
]

var enemy_butterfly = [
	{
		"direction": [Vector2(0, 1)],
		"interval": 3.0,
		"bullet_scene": "test_bullet_2"
	}
]

var enemy_boss_yukari = [
	{
		"direction": [Vector2(-1, 0), Vector2(-0.75, 0.75), Vector2(-0.75, -0.75), Vector2(-0.875, 0.35), Vector2(-0.875, -0.35)],
		"interval": 3.0,
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
		
