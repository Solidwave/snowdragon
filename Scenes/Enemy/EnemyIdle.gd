extends State

class_name EnemyIdle

@export var enemy : Enemy

@onready var animationPlayer = $"../../AnimationPlayer"

var player : CharacterBody2D

var moveDirection : Vector2

var wanderTime : float

func randomizeWander():
	moveDirection = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wanderTime = randf_range(1,3)
	
func Enter():
	if animationPlayer:
		animationPlayer.play(enemy.resource.idleAnimation)
	player = get_tree().get_first_node_in_group("Player")
	randomizeWander()
	
func Update(delta):
	if wanderTime > 0:
		wanderTime -= delta
	else:
		randomizeWander()
		
func PhysicsUpdate(_delta):
	if enemy:
		enemy.velocity = moveDirection * enemy.resource.speed
		
	if player == null:
		return
		
	var direction = player.global_position - enemy.global_position
	
	if direction.length() < enemy.resource.detectRange:
		Transitioned.emit(self,"chase")
	
