extends Node2D

# Straight movement
func straight_movement(direction: Vector2, speed: float, delta: float) -> Vector2:
	return direction * speed * delta

# Zig-zag movement
func zigzag_movement(direction: Vector2, speed: float, delta: float) -> Vector2:
	var zigzag_amplitude = 100.0  # The horizontal distance between zigs and zags
	var zigzag_frequency = 2.0   # How fast the zig-zag alternates (higher values make sharper turns)
	
	# Calculate zig-zag based on time
	var zigzag_offset = Vector2(sin(Time.get_ticks_msec() / 1000.0 * zigzag_frequency) * zigzag_amplitude, 0)
	
	return (direction + zigzag_offset.normalized()) * speed * delta

# Curved movement
func curved_movement_1(direction: Vector2, speed: float, delta: float) -> Vector2:
	var curve_amplitude = 100.0  # Curve intensity
	var curve_frequency = 2.0   # How fast the curve oscillates
	var curve_offset = Vector2(0, sin(Time.get_ticks_msec() / 1000.0 * curve_frequency) * curve_amplitude)
	return (direction + curve_offset.normalized()) * speed * delta
	
	
func circular_movement(speed: float, radius: float, start_position: String, clockwise: bool, phase_offset: float) -> Vector2:
	# Get the current time in seconds
	var time = (Time.get_ticks_msec() / 1000.0) + phase_offset
	
	# Adjust direction based on clockwise or counterclockwise
	var direction_modifier = 1 if clockwise else -1  # Clockwise is positive, counterclockwise is negative
	
	# Starting position adjustment (top, left, right, down)
	var initial_angle = 0.0
	match start_position:
		"top":
			initial_angle = 0.0  # Start at the top (12 o'clock)
		"top-right":
			initial_angle = PI / 4  # Start at the top-right (1:30)
		"right":
			initial_angle = PI / 2  # Start at the right (3 o'clock)
		"bottom-right":
			initial_angle = 3 * PI / 4  # Start at the bottom-right (4:30)
		"bottom":
			initial_angle = PI  # Start at the bottom (6 o'clock)
		"bottom-left":
			initial_angle = 5 * PI / 4  # Start at the bottom-left (7:30)
		"left":
			initial_angle = 3 * PI / 2  # Start at the left (9 o'clock)
		"top-left":
			initial_angle = 7 * PI / 4  # Start at the top-left (10:30)
	
	if direction_modifier == 1:
		initial_angle =  initial_angle + (-PI/2) #THIS IS DUMB, WHY IT WORK LIKE THIS???
	# Calculate the current rotation angle based on time and the direction
	var angle = initial_angle  + (time * speed * direction_modifier)

	
	# Circular movement using sine and cosine for x and y
	var circular_position = Vector2(
		radius * cos(angle),  # X-axis movement
		radius * sin(angle)   # Y-axis movement
	)
	
	return circular_position
