extends TextureButton

@onready var joystick = $Joystick

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		if(get_rect().has_point(event.position)):
			joystick.global_position = event.position
	
