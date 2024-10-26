extends Node2D
# Assuming you have a reference to the player node
@onready var player = $".".get_parent().get_parent().get_node("Player")

var current_pattern_index = 0
var patterns = []
#[
	##{
		##"direction": [Vector2(-1, 0)],  # Default fallback direction
		##"interval": 2.0,
		##"bullet_scene": preload("res://Subscene/enemy_test_bullet_1.tscn")
	##},
	#{
		#"direction": [Vector2(1, 0)],
		#"interval": 3.0,
		#"bullet_scene": "test_bullet"
	#}
#]



func _ready() -> void:
	#pass
   # Construct the path dynamically
	var property_name = get_node("name").get_child(0).name
	
	patterns = $bulletPattern._get_enemy_pattern(str(property_name))
	


func _on_shot_timer_timeout() -> void:
	var pattern = patterns[current_pattern_index]
	if pattern != null:
		# Calculate the dynamic direction towards the player for each bullet shot
		for i in pattern["direction"]:
			var direction : Vector2
			if i == Vector2.ZERO:
				direction = _get_direction_to_player()
			else:
				direction = i
			_spawn_bullet(direction, pattern["bullet_scene"])

		#current_pattern_index += 1
		if current_pattern_index < patterns.size():
			$"../ShotTimer".wait_time = patterns[current_pattern_index]["interval"]
			$"../ShotTimer".start()
		else:
			$"../ShotTimer".stop()  # Stop once all patterns have been shot

# Function to calculate direction towards the player
func _get_direction_to_player() -> Vector2:
	if player != null:
		var direction_to_player = (player.position - get_parent().position).normalized()
		return direction_to_player
	else:
		# Fallback in case player is not found
		return Vector2(-1, 0)  # Default direction

var buller_funcs = {
	"test_bullet": PoolingManager.get_node("bulletPool").get_enemy_test_bullet,
	"test_bullet_2": PoolingManager.get_node("bulletPool").get_enemy_test_bullet_2
}

func _spawn_bullet(direction, bullet_scene):
	var bullet = buller_funcs[bullet_scene].call()
	if bullet != null:
		bullet.position = get_parent().position  # Spawn bullet at shooter's position
		bullet.direction = direction  # Set the calculated direction
		bullet.set_all_process(true)
		if bullet.get_parent() == null:
			get_parent().get_parent().add_child(bullet)
