extends Resource

class_name DropPoolResource

@export var items: Array[ItemResource] = []
@export var chances: Array[float] = []

func drop():
	var totalChance = 1

	var rand = randf()
	
	print(rand)

	for i in range(items.size()):
		if rand < chances[i]:
			return items[i]
		rand -= chances[i]
	return null;
