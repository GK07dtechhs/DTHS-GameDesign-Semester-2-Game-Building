extends Area2D

# Path to your background node (Sprite2D, TextureRect, or CanvasLayer)
@export var sky_background_path: NodePath
@export var fade_duration: float = 1.0   # seconds

var sky_background: Node = null

func _ready() -> void:
	# Cache the background node
	if sky_background_path:
		sky_background = get_node(sky_background_path)
	else:
		push_error("sky_background_path not assigned!")
	
	# Connect Area2D signals
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body: Node) -> void:
	# Only trigger for the player
	if body.is_in_group("player") or body is CharacterBody2D:
		_fade_background(0.0)  # Fade out

func _fade_background(to_alpha: float) -> void:
	if sky_background:
		var tween = get_tree().create_tween()
		tween.tween_property(
			sky_background,
			"modulate:a",     # Fade the alpha
			to_alpha,
			fade_duration
		)
