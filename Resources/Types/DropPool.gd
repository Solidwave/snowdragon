extends Resource

class_name DropPoolResource

#Note: the rarest items should be at the start of the array
@export var items: Array[ItemResource] = []
@export var chances: Array[float] = []

func drop():
	var totalChance = 1

	var rand = randf()
	
	for i in range(items.size()):
		if rand < chances[i]:
			return items[i]
	return null;
