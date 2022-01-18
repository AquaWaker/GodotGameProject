# Start Menu Code
extends Control

# Will start a game
func _on_newButton_pressed():
	get_tree().change_scene("res://Area1.tscn")
	save.save_game()

# !!! When an options menu is made, this button will
# access it
func _on_optionsButton_pressed():
	pass

# !! Will continue the game
func _on_continueButton_pressed():
	save.load_game()
	get_tree().change_scene("res://Area" + str(Global.currentArea) + ".tscn")

# Will close the game
func _on_quitButton_pressed():
	get_tree().quit()
