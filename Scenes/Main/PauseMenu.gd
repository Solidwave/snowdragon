extends MarginContainer

@export var player : Player

var healthComponent : HealthComponent

func _on_retry_button_button_up():
	get_tree().paused = false
	
	get_tree().reload_current_scene()
	

func _on_menu_button_button_up():
	get_tree().paused = false
	get_tree().change_scene_to_file('res://UI/Menu/Menu.tscn')

func _on_exit_button_button_up():
	get_tree().quit()


func _on_texture_button_button_up():
	if get_tree().paused:
		get_tree().paused = false
		visible = false
	else:
		get_tree().paused = true
		visible = true
		
		
