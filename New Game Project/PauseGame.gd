extends Control

# Creates a variable checking to see if the world is paused
var pause

# Set variable
func _ready():
    pause = false

# While the game is unpaused, it will hide all of the options
# the player has while the game is paused.  When the ESC button
# is pressed it will pause the game and give the player options
# on actions to take
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
		get_node("Container/saveButton").set_visible(true)
	else:
		get_tree().paused = false
		get_node("Container/pauseEffect").set_visible(false)
		get_node("Container/quitButton").set_visible(false)
		get_node("Container/returnMenu").set_visible(false)
		get_node("Container/saveButton").set_visible(false)


# Quit the game is player is done
func _on_quitButton_pressed():
	get_tree().quit()

# Returns player to menu 
func _on_returnMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://MainMenu.tscn")


func _on_saveButton_pressed():
	save.save_game()

