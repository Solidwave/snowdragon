extends CharacterBody2D

class_name Player

@export var joystick : Joystick

@export var hitbox : HitboxComponent
@onready var rig = $Rig

@onready var animation_player = $AnimationPlayer


@onready var healthComponent : HealthComponent = $"HealthComponent"
@onready var animation_tree : AnimationTree = $AnimationTree

@export var speed = 300
@onready var weapon = $Weapon

var lookingRight := true

var enemyCollision : KinematicCollision2D = null

func _ready():
	set_process_input(true)
	
func _physics_process(_delta):
	move_and_slide()
	
func move(_delta):
	var direction = joystick.posVector
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
		
		
func processDrop(drop: Drop):
	match drop.res.type:
		'powerup' :
			var powerup = drop.res.scene.instantiate()
			add_child(powerup)
		'healing':
			var healQuantity = drop.res.healthValue
			
			var healthComponent : HealthComponent = get_node("HealthComponent")
			if 	healthComponent :
				var newHealth = healthComponent.health + healQuantity
				
				healthComponent.health = min(healthComponent.maxHealth,newHealth)
				
				
				healthComponent.health_changed.emit()
				
	
	drop.queue_free()
	


