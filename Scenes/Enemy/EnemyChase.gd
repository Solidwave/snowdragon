extends State

class_name EnemyChase
@export var enemy : CharacterBody2D
@export var moveSpeed := 100
@onready var knockback_component = $"../../KnockbackComponent"

var player : CharacterBody2D

func Enter():
#	play chasing animation
	player = get_tree().get_first_node_in_group("Player")

func PhysicsUpdate(delta: float):
	if player == null:
		Transitioned.emit(self,"idle")
		return
	if knockback_component.hit:
		Transitioned.emit(self,"stunned")
		return
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 50:
		enemy.velocity = direction.normalized() * moveSpeed
	else:
		enemy.velocity = Vector2.ZERO
	
	if direction.length() > enemy.detectionRange:
		Transitioned.emit(self,"idle")
	

