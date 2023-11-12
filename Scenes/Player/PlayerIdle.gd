extends State

class_name PlayerIdle

@onready var player = $"../.."

func Enter():
	pass

func Exit():
	pass
	
func Update(delta: float):
	if player.enemyCollision != null:
		Transitioned.emit(self,"playerstunned")
	
func PhysicsUpdate(delta: float):
	player.move(delta)


