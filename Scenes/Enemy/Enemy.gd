extends CharacterBody2D

class_name Enemy

var attack : Attack

@export var resource : EnemyResource

@onready var sprite : Sprite2D = $"Sprite2D"

@onready var health_component : HealthComponent = $"HealthComponent" 

@export var stop = false

func _ready():
	attack = Attack.new(resource.attack, resource.knockback, Vector2.ZERO)

	sprite.texture = resource.texture
	
	health_component.health = resource.maxHealth
	
	health_component.updateBar(resource.maxHealth, resource.maxHealth) 
	if resource.dropPool.items.size() > 0:
		tree_exiting.connect(drop)
	
	

func _physics_process(_delta):
	if !stop:
		move_and_slide()
		
func drop():
	var drop : ItemResource = resource.dropPool.drop();
	
	if drop:
		var dropInstance = load("res://Scenes/Drop/drop.tscn").instantiate()
		
		dropInstance.res = drop
		
		dropInstance.global_position = global_position
		
		get_parent().add_child.call_deferred(dropInstance)
		
		
		
	
