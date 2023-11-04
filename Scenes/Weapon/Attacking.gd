extends State
@onready var animation_player = $"../../AnimationPlayer"
@onready var weapon = $"../.."

@onready var targeting_area = $"../../TargetingArea"

func Enter():
	print("entered weapon attack")
	animation_player.play("attack")
	
func Update(delta):
	if weapon.target == null:
		Transitioned.emit(self, "weaponidle")




func _on_targeting_area_area_exited(area):
	if area == weapon.target:
		Transitioned.emit(self, "weaponidle")
