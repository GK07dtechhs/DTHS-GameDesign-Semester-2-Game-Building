extends Node

@onready var Player = %Player
@onready var RespawnTimer = $RespawnTimer

func game_over():
	print("You died!")
	Engine.time_scale = 0.5
	RespawnTimer.start()
	Player.get_node("CollisionShape2D").queue_free()

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_respawn_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
