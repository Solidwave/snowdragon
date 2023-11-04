extends Area2D

class_name Weapon

@onready var targeting_area = $TargetingArea

@export var targetGroup := 'Enemy'

@export var damage := 10
@export var knockBack := 10

@onready var animation_player = $AnimationPlayer

var target : Area2D

var attack : Attack

func _ready():
	attack = Attack.new(damage, knockBack, Vector2.ZERO)
func playAttack():
	animation_player.play('attack')
