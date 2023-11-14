extends Node

class_name KnockbackComponent

@export var target : CharacterBody2D
@export var exitVelocity := 50

var hit = false
var velocity = Vector2.ZERO

func receiveKnockBack(attack : Attack):
	velocity = (target.global_position - attack.position).normalized() * 2000
	hit = true
 
func _physics_process(delta):
	if hit:
		target.global_position += velocity * delta

		velocity = velocity.lerp(Vector2.ZERO, 0.2)
		
		if velocity.length() < 5:
			hit = false
