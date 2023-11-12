extends Node

class_name KnockbackComponent

@export var target : CharacterBody2D

@export var exitVelocity := 50

var hit = false

func receiveKnockBack(attack : Attack):
	target.velocity = (target.global_position - attack.position).normalized() * attack.knockbackForce
	hit = true

func _physics_process(delta):
	if 	hit:
		target.velocity = target.velocity - target.velocity * delta   
		
		if target.velocity.length() < exitVelocity:
			hit = false
	
