extends Popup


# onready var player = get_node("/root/Root/Player")
var already_paused
var selected_menu

#var player

# Called when the node enters the scene tree for the first time.
func _ready():
	#player = get_node("/root/Root/Player")
	pass


# TODO: change this to use button nodes 
func _input(_event):
	if not visible:
		if Input.is_action_just_pressed("ui_cancel"):
			# Pause game
			already_paused = get_tree().paused
			get_tree().paused = true
			# Reset the popup
			selected_menu = 0
			#change_menu_color()
			# Show popup
			# player.set_process_input(false)
			popup()
	elif visible:
		if Input.is_action_just_pressed("ui_cancel"):
			# Unpause game
			get_tree().paused = false
			# Reset the popup
			selected_menu = 0
			hide()
	else:
		if Input.is_action_just_pressed("ui_down"):
			selected_menu = (selected_menu + 1) % 3;
			#change_menu_color()
		elif Input.is_action_just_pressed("ui_up"):
			if selected_menu > 0:
				selected_menu = selected_menu - 1
			else:
				selected_menu = 2
			#change_menu_color()
#		elif Input.is_action_just_pressed("ui_cancel"):
#			match selected_menu:
#				#0:
#					# Resume game
#					#if not already_paused:
#					#	get_tree().paused = false
#					# player.set_process_input(true)
#					#hide()
#				1:
#					
#				2:
#					# Quit game
#					get_tree().quit()


func _on_Resume_pressed():
	# Resume game
	if not already_paused:
		get_parent().paused = false
	# player.set_process_input(true)
	hide()


func _on_Save_pressed():
	get_parent().save_game()
	
	
func _on_Quit_pressed():
	get_parent().quit()
	# Restart game
#	get_tree().change_scene("res://Scenes/Main.tscn")
#	get_tree().paused = false
