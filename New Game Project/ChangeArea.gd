extends Control

# !! List of positions that the player should be entering scenes at
#func _ready():
	#if Global.currentArea == 1:
		#Global.position_x = 1056
		#Global.position_y = 224
	#elif Global.currentArea == 2:
		#Global.position_x = 448
		#Global.position_y = 1824
	#elif Global.currentArea == 3:
		#Global.position_x = -768
		#Global.position_y = 256
	#elif Global.currentArea == 4:
		#Global.position_x = 256
		#Global.position_y = 1056

# Checks if the player has entered the area, if they have then
# the player moves on to the next area
func _on_ExitArea_body_entered(body):
	if body.get_name() == "Waker Character":
		get_tree().change_scene("res://Area"+ str(Global.currentArea + 1) +".tscn")
		Global.currentArea += 1

# Checks if the player has entered the area, if they have then
# the player moves on to the previous area
func _on_backArea_body_entered(body):
	if body.get_name() == "Waker Character":
		get_tree().change_scene("res://Area"+ str(Global.currentArea - 1) +".tscn")
		Global.currentArea -= 1
		
		# !! Set the position of the player to where they are entering the scene
		#get_node("World/Waker Character").set_pos.x = Global.position_x
		#get_node("World/Waker Character").set_pos.y = Global.position_y

# Save the area that the player is in
func save():
	var save_dict = {
		area = Global.currentArea
	}
	return save_dict
