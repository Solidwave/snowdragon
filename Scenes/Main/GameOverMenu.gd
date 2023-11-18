extends MarginContainer

@export var player : Player

var healthComponent : HealthComponent

func _ready():
	healthComponent = player.healthComponent
	
	if healthComponent:
		healthComponent.im_dead.connect(showMenu)

func showMenu():
	visible = true	
	
	get_tree().paused = true
	
func _on_retry_button_button_up():
	get_tree().reload_current_scene()
	
	get_tree().paused = false

func _on_menu_button_button_up():
	get_tree().change_scene_to_file('res://UI/Menu/Menu.tscn')
	get_tree().paused = false
	

func _on_exit_button_button_up():
	get_tree().quit()
