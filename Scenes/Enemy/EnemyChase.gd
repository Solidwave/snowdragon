extends State

class_name EnemyChase
@export var enemy : Enemy

@onready var knockback_component = $"../../KnockbackComponent"

@onready var animationPlayer = $"../../AnimationPlayer"



var player : CharacterBody2D

func Enter():
#	play chasing animation

	if animationPlayer:
		animationPlayer.play(enemy.resource.chaseAnimation)	

	player = get_tree().get_first_node_in_group("Player")

func PhysicsUpdate(_delta: float):
	if player == null:
		Transitioned.emit(self,"idle")
		return
	if knockback_component.hit:
		Transitioned.emit(self,"stunned")
		return
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 50:
		enemy.velocity = direction.normalized() * enemy.resource.speed
	else:
		enemy.velocity = Vector2.ZERO
	
	if direction.length() > enemy.resource.detectRange:
		Transitioned.emit(self,"idle")
	

