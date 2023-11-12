extends CharacterBody2D

class_name Enemy

var attack : Attack

@export var damage := 5

@export var knockBack := 200

@export var detectionRange := 500


func _ready():
	attack = Attack.new(damage, knockBack, Vector2.ZERO)

func _physics_process(delta):
	move_and_slide()
	
	
