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
		
		if collision.get_collider().is_in_group("Enemy"):
			player.enemyCollision = collision
			
			Transitioned.emit(self,"playerstunned")
			
		if collision.get_collider().is_in_group("Drop"):
			print(collision.get_collider())
			player.processDrop(collision.get_collider())


