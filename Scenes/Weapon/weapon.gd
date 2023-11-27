extends Node2D

class_name Weapon

@onready var targeting_area = $TargetingArea

@export var res : WeaponResource

@export var pivot : Node2D

@onready var weapon_sprite = $Hitbox/WeaponSprite

@export var disabled := false

@export var attackSpeed : float = 1

@export var radius := 5

@onready var animation_player = $AnimationPlayer

var target : HitboxComponent

var attack : Attack

func _ready():
	weapon_sprite.texture = res.texture
	
	attack = Attack.new(res.damage,res.knockback, Vector2.ZERO)
	
func _physics_process(delta):
	if target != null:
		var direction = target.global_position - pivot.global_position
		
		#Calculate weapon animation direction
		if direction.x > 0:
			scale.y = 1
		else:
			scale.y = -1
		
		# Calculate the angle between the direction and the player's forward direction
		var angle = atan2(direction.y, direction.x)
		
		# Calculate the desired circular movement around the player
		var circle_center = pivot.global_position
		var circle_radius = 50 # Adjust the radius of the circular path as needed
		
		# Calculate the position on the circle based on the angle
		var circle_position = Vector2(
			circle_center.x + circle_radius * cos(angle),
			circle_center.y + circle_radius * sin(angle)
		)
		
		look_at(target.global_position)
		
		# Move the sword to the calculated circular position
		global_position = circle_position

