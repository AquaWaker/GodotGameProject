extends Control

var pause

func _ready():
    pause = false

func _process(delta):
	if Input.is_action_just_pressed('ui_cancel'):
		if pause == false:
			pause = true
		else:
			pause = false
	if pause == true:
		get_tree().paused = true
		get_node("Container/pauseEffect").set_visible(true)
		get_node("Container/quitButton").set_visible(true)
		get_node("Container/returnMenu").set_visible(true)
	else:
		get_tree().paused = false
		get_node("Container/pauseEffect").set_visible(false)
		get_node("Container/quitButton").set_visible(false)
		get_node("Container/returnMenu").set_visible(false)



func _on_quitButton_pressed():
	get_tree().quit()
	pass 


func _on_returnMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://MainMenu.tscn")
	pass 
