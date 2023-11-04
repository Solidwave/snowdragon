extends Node2D

class_name HealthComponent

@export var maxHealth := 10

var health : float


func _ready():
	health = maxHealth
	
func damage(attack: Attack):
	health = health - attack.damage
	
	if health <= 0:
		get_parent().queue_free()
	
	
