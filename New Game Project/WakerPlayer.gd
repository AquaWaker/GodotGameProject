extends KinematicBody2D

# Player's motion x and y
var motion = Vector2()

# This will check to see if the player is pressing any of
# the arrow keys, if they are it will make the player walk
# in the corresponding direction and change the animation
# to the moving animation.  Will also flip which direction
# the player is facing based on the last inputted direction
func _physics_process(delta):
	if Input.is_action_pressed('ui_right'):
		motion.x = 250
		get_node("StillAnimation").set_flip_h(true)
		get_node("StillAnimation").set_visible(false)
		get_node("RunningAnimation").set_flip_h(true)
		get_node("RunningAnimation").set_visible(true)
	elif Input.is_action_pressed('ui_left'):
		motion.x = -250
		get_node("StillAnimation").set_flip_h(false)
		get_node("StillAnimation").set_visible(false)
		get_node("RunningAnimation").set_flip_h(false)
		get_node("RunningAnimation").set_visible(true)
	else:
		motion.x = 0
	
	if Input.is_action_pressed('ui_up'):
		motion.y = -250
		get_node("StillAnimation").set_visible(false)
		get_node("RunningAnimation").set_visible(true)
	elif Input.is_action_pressed('ui_down'):
		motion.y = 250
		get_node("StillAnimation").set_visible(false)
		get_node("RunningAnimation").set_visible(true)
	else:
		motion.y = 0
	
	if motion.x == 0 and motion.y == 0:
		get_node("StillAnimation").set_visible(true)
		get_node("RunningAnimation").set_visible(false)
	
	move_and_slide(motion)

