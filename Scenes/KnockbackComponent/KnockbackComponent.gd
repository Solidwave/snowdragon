extends Node

class_name KnockbackComponent

@export var target : CharacterBody2D

func receiveKnockBack(attack : Attack):
	target.velocity = (target.global_position - attack.position).normalized() * 6000
	
