extends ParallaxBackground

@export var ScrollSpeed : float = 1;

func _process(delta: float) -> void:
	scroll_base_offset -= Vector2(100, 0) * ScrollSpeed * delta;
