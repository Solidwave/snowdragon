extends Node2D

class_name ProcessSideComponent

@export var character2d : CharacterBody2D

@export var animation_tree : AnimationTree

var lookingRight = true


func _process(delta):
	processSide()


func processSide():
	if character2d.velocity.x > 0 && !lookingRight:
		lookingRight = true
		
		if animation_tree:
			animation_tree.set("parameters/StateMachine/conditions/lookright", true)
			
			animation_tree.set("parameters/StateMachine/conditions/lookleft", false)
		else:
			character2d.scale.x *= -1
	if character2d.velocity.x < 0 && lookingRight:
		lookingRight = false
		
		if animation_tree:
			animation_tree.set("parameters/StateMachine/conditions/lookright", false)
			
			animation_tree.set("parameters/StateMachine/conditions/lookleft", true)
		else:
			character2d.scale.x *= -1
		
		
