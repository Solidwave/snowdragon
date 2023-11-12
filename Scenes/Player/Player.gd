extends CharacterBody2D

class_name Player

@export var joystick : Node2D

@export var hitbox : HitboxComponent

@export var speed = 300
@onready var weapon = $Weapon

var enemyCollision : KinematicCollision2D = null

func _physics_process(delta):
		
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("Enemy"):
			enemyCollision = collision
			
	
func move(delta):
	var direction = joystick.posVector
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
