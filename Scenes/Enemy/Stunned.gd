extends State

class_name EnemyStunned

@onready var enemy = $"../.."

@onready var knockback_component = $"../../KnockbackComponent"

		
func PhysicsUpdate(delta):
	if enemy.velocity.length() < knockback_component.exitVelocity:
		Transitioned.emit(self, "idle")
