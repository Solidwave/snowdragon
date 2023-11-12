extends Node2D

class_name HealthComponent

@export var maxHealth := 10

@export var healthBar : HealthBar

var health : float

func _ready():
	health = maxHealth
	
	if 	healthBar:
		
		healthBar.max_value = maxHealth
		
		healthBar.min_value = 0
		
		healthBar.value = maxHealth
	
func damage(attack: Attack):
	health = health - attack.damage
	
	if 	healthBar:
		healthBar.value = health
	
	if health <= 0 && get_parent().name != "Player":
		get_parent().queue_free()
	
	
