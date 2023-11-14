class_name Attack

@export var damage : float
@export var knockbackForce : float
@export var position : Vector2


func _init(damageParam : float, knockbackForceParam: float, positionParam: Vector2):
	damage = damageParam
	
	knockbackForce = knockbackForceParam
	
	position = positionParam
