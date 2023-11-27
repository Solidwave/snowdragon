extends State
@onready var animation_player = $"../../AnimationPlayer"
@onready var weapon : Weapon = $"../.."
@onready var weapon_sprite = $"../../WeaponSprite"

@onready var targeting_area = $"../../TargetingArea"

func Enter():
	animation_player.play(weapon.res.attackAnimation)
	animation_player.speed_scale = weapon.attackSpeed
	pass

func Exit():
	animation_player.play("RESET")
	pass
	
func Update(_delta):
	if weapon.target == null:
		Transitioned.emit(self, "weaponidle")
		return
	if weapon.target.global_position.distance_to(weapon.pivot.global_position) > weapon.res.attackRange:
		weapon.target = null
	if weapon.target != null:
		weapon.look_at(weapon.target.global_position)



func _on_weapon_area_entered(area):
	if area is HitboxComponent and area.is_in_group(weapon.res.targetGroup):
		weapon.attack.position = weapon.global_position
		area.damage(weapon.attack)
