extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ok"):
		if get_viewport().gui_get_focus_owner() == $Continue:
			_on_continue_pressed()
		elif get_viewport().gui_get_focus_owner() == $Quit:
			_on_quit_pressed()

func _on_continue_pressed():
	if Globals.onMobile:
		$"/root/Game/TouchControls".show()
		$"/root/Game/TouchPauseMenuContainer".hide()
	else:
		$"/root/Game/PauseMenuContainer".hide()
	get_tree().paused = false

func _on_quit_pressed():
	$"/root/Game".onExit()
	get_tree().quit()
