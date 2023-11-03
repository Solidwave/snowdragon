extends CharacterBody2D

@export var joystick : Node2D

@export var speed = 300

func _physics_process(delta):
	var direction = joystick.posVector
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	
