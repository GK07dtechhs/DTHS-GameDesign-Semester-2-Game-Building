extends CharacterBody2D

const SPEED = 60

var direction = 1

@onready var Left = $RayCastLeft
@onready var Right = $RayCastRight
@onready var Sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if Right.is_colliding():
		direction = -1
		Sprite.flip_h = true
		
	if Left.is_colliding():
		direction = 1
		Sprite.flip_h = false
		
	
	position.x += direction * SPEED * delta
