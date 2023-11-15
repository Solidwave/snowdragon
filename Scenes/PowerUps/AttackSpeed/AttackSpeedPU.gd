extends PowerUp

var weapon: Weapon
func onStart():
	weapon = get_parent().get_node("Weapon")
	
	if weapon:
		weapon.attackSpeed += 0.2
