extends State
@onready var animation_player = $"../../AnimationPlayer"
@onready var weapon : Weapon = $"../.."
@onready var weapon_sprite = $"../../WeaponSprite"

@onready var targeting_area = $"../../TargetingArea"

func Enter():
	animation_player.play(weapon.res.attackAnimation)

func Exit():
	animation_player.play("RESET")
	
func Update(_delta):
	if weapon.target == null:
		Transitioned.emit(self, "weaponidle")
	else:	
		# slowly changes the rotation to face the angle
		weapon.look_at(weapon.target.global_position)

func _on_targeting_area_area_exited(area):
	if area == weapon.target:
		Transitioned.emit(self, "weaponidle")


func _on_pivot_area_entered(area):
	if area is HitboxComponent and area.is_in_group(weapon.res.targetGroup):
		weapon.attack.position = weapon.global_position
		area.damage(weapon.attack)