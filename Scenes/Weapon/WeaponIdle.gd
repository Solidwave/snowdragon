extends State

@onready var animation_player = $"../../AnimationPlayer"

@onready var weapon : Weapon = $"../.." 

func Enter():
	animation_player.stop()
	
#func Update(_delta):
#	var closestEnemy = find_closest_enemy()
#
#	if 	closestEnemy :
#		weapon.target = closestEnemy.get_node("HitboxComponent")
#
#		Transitioned.emit(self,"weaponattacking")


func find_closest_enemy() -> CharacterBody2D:
	var enemies = get_tree().get_nodes_in_group("Enemy") # Assuming enemies are in a group

	var closest_enemy: CharacterBody2D = null
	
	var closest_distance = weapon.res.attackRange

	for enemy in enemies:
		var distance = enemy.global_position.distance_to(weapon.pivot.global_position)
		if distance < closest_distance:
			closest_enemy = enemy
			
			closest_distance = distance
	return closest_enemy


func _on_detect_timer_timeout():
	var closestEnemy = find_closest_enemy()
	
	if 	closestEnemy :
		weapon.target = closestEnemy.get_node("HitboxComponent")
		
		Transitioned.emit(self,"weaponattacking")
