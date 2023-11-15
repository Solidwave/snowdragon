extends Node

class_name PowerUp

@export var duration : float = 5

var timer : SceneTreeTimer

func _ready():
	onStart()
	
	timer = get_tree().create_timer(duration, true, false, true)
	
	timer.timeout.connect(onEnd)
	
func onStart():
	pass
	
func onEnd():
	pass
	


#
