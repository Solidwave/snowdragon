extends State

class_name EnemyChase
@export var enemy : CharacterBody2D
@export var moveSpeed := 60

var player : CharacterBody2D

func Enter():
#	play chasing animation
	player = get_tree().get_first_node_in_group("Player")

func PhysicsUpdate(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 100:
		enemy.velocity = direction.normalized() * moveSpeed
	else:
		enemy.velocity = Vector2.ZERO
		
	if direction.length() > 500:
		Transitioned.emit(self,"idle")
