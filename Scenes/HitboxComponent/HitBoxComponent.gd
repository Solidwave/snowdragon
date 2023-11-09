extends Area2D

class_name HitboxComponent

@export var health_component : HealthComponent

func damage(attack: Attack):
	print('gotme')
	if health_component:
		print('gotme')
		health_component.damage(attack)
