extends RigidBody2D

class_name Drop

@export var res : ItemResource
@onready var sprite_2d : Sprite2D = $Sprite2D

var player : Player

var speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_2d.set_texture(res.texture)
	
	continuous_cd = RigidBody2D.CCD_MODE_DISABLED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		
		speed += 100

		global_position += direction * speed * delta


func _on_area_2d_body_entered(body):
	if body is Player:
		player = body
