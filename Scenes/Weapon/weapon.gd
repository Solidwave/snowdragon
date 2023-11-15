extends Node2D

class_name Weapon

@onready var targeting_area = $TargetingArea

@export var res : WeaponResource

@onready var weapon_sprite = $Pivot/WeaponSprite

@export var disabled := false

@export var attackSpeed : float = 1

@onready var animation_player = $AnimationPlayer

var target : Area2D

var attack : Attack

func _ready():
	weapon_sprite.texture = res.texture
	
	attack = Attack.new(res.damage,res.knockback, Vector2.ZERO)
	
	
