extends State

class_name PlayerIdle

@onready var player = $"../.."

func Enter():
	pass

func Exit():
	pass
	
#func Update(delta: float):
#	if player.enemyCollision != null:
#		Transitioned.emit(self,"playerstunned")
#
func PhysicsUpdate(delta: float):
	player.move(delta)
	
	for i in player.get_slide_collision_count():
		var collision = player.get_slide_collision(i)
		
		var collider = collision.get_collider()
		
		if collider.is_in_group("Enemy"):
			player.enemyCollision = collision
			
			Transitioned.emit(self,"playerstunned")
			
		if collider.is_in_group("Drop"):
			player.processDrop(collider)


