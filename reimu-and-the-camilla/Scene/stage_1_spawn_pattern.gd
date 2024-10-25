extends Node2D



var patterns = [
	{
		"positions": [Vector2(2000, 100), Vector2(2000, 300), Vector2(2000, 500)],
		"interval": 1.0,
		"enemy_scene": preload("res://Subscene/enemy_test.tscn")
	},
	{
		"positions": [Vector2(-100, 100), Vector2(-100, 300), Vector2(-100, 500)],
		"interval": 1.0,
		"enemy_scene": preload("res://Subscene/enemy_test.tscn")
	},
	{
		"positions": [Vector2(-100, 700), Vector2(2000, 700), Vector2(-100, 100), Vector2(2000, 100)],
		"interval": 1.0,
		"enemy_scene": preload("res://Subscene/enemy_test.tscn")
	}
	
]
	
