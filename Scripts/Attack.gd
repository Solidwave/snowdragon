class_name Attack

var damage : float
var knockbackForce : float
var position : Vector2


func _init(damage : float, knockbackForce: float, position: Vector2):
	self.damage = damage
	
	self.knockbackForce = knockbackForce
	
	self.position = position
