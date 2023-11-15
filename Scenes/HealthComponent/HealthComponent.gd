extends Node2D

class_name HealthComponent

@export var maxHealth := 10

@export var healthBar : HealthBar

@export var invincible := false

var health : float


func _ready():
	health = maxHealth
	
	if 	healthBar:
		
		healthBar.max_value = maxHealth
		
		healthBar.min_value = 0
		
		healthBar.value = maxHealth
		
func updateBar(_maxHealth,_value):
	print(_maxHealth,_value, healthBar)
	if healthBar:
		if _maxHealth:
			healthBar.max_value = _maxHealth
		if _value:
			healthBar.value = _value
		
	
func damage(attack: Attack):
	if invincible:
		return
	health = health - attack.damage
	
	if 	healthBar:
		healthBar.value = health
	
	if health <= 0 && get_parent().name != "Player":
		get_parent().queue_free()
	
	
