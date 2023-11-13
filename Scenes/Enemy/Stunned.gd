extends State

class_name EnemyStunned

@onready var enemy = $"../.."

@onready var knockback_component = $"../../KnockbackComponent"


func Update(delta):
	if knockback_component.hit == false:
		Transitioned.emit(self, "idle")
		
