extends State

class_name EnemyIdle

@export var enemy : CharacterBody2D

@export var moveSpeed := 50

var player : CharacterBody2D

var moveDirection : Vector2

var wanderTime : float

func randomizeWander():
	moveDirection = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wanderTime = randf_range(1,3)
	
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomizeWander()
	
func Update(delta):
	if wanderTime > 0:
		wanderTime -= delta
	else:
		randomizeWander()
		
func PhysicsUpdate(delta):
	if enemy:
		enemy.velocity = moveDirection * moveSpeed
		
	if player == null:
		return
		
	var direction = player.global_position - enemy.global_position
	
	if direction.length() < enemy.detectionRange:
		Transitioned.emit(self,"chase")
	
