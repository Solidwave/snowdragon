extends State

class_name EnemyStunned

@onready var enemy : Enemy = $"../.." 

@onready var knockback_component = $"../../KnockbackComponent"

@onready var animationPlayer = $"../../AnimationPlayer"


func Enter():
	if animationPlayer:
		animationPlayer.play(enemy.resource.stunnedAnimation)

func Update(_delta):
	if knockback_component.hit == false:
		Transitioned.emit(self, "idle")
		
