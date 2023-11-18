extends PowerUp

var target : Player;

func onStart():
	target = get_parent()
	
	target.speed += 30
