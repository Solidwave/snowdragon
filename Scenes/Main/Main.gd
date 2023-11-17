extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_tree().root.content_scale_size)
	get_tree().root.content_scale_size = get_tree().root.content_scale_size * 2
	print(get_tree().root.content_scale_size)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
