extends State

class_name PlayerStunned

@onready var player = $"../.."
@onready var knockback_component = $"../../KnockbackComponent"
@onready var hitbox_component = $"../../HitboxComponent"


func Enter():
	var enemy: Enemy = player.enemyCollision.get_collider()
	if 	enemy == null:
		Transitioned.emit(self,"playeridle")	
	enemy.attack.position = enemy.global_position
	hitbox_component.damage(enemy.attack)
	
func Exit():
	player.enemyCollision = null
	
func Update(delta: float):
	if !knockback_component.hit:
		Transitioned.emit(self,"playeridle")

