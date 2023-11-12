extends State

class_name PlayerStunned

@onready var player = $"../.."
@onready var knockback_component = $"../../KnockbackComponent"
@onready var hitbox_component = $"../../HitboxComponent"


func Enter():
	var enemy: Enemy = player.enemyCollision.get_collider()
	enemy.attack.position = enemy.global_position
	hitbox_component.damage(enemy.attack)
	
func Exit():
	player.enemyCollision = null
	
func Update(delta: float):
	if player.velocity.length() < 50:
		Transitioned.emit(self,"playeridle")

