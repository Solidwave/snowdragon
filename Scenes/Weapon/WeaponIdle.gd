extends State

@onready var animation_player = $"../../AnimationPlayer"

@onready var targeting_area = $"../../TargetingArea"
@onready var weapon : Weapon = $"../.." 



func Enter():
	animation_player.stop()
	targeting_area.monitoring = true

func Exit():
	targeting_area.monitoring = false


func _on_targeting_area_area_entered(area):
	if 	area is HitboxComponent and area.is_in_group(weapon.targetGroup):
		weapon.target = area
		
		Transitioned.emit(self, "weaponattacking")
