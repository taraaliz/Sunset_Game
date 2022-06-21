extends Control

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused
		$CenterContainer/VBoxContainer/ResumeBtn.grab_focus()
		
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_ResumeBtn_pressed():
	self.is_paused = false

func _on_QuitBtn_pressed():
	get_tree().quit()

# adds options scene behind pause menu
# todo: figure out how to add it on top of pause menu
func _on_OptionsBtn_pressed():
	var options = load("res://resources/menu/Options.tscn").instance()
	get_tree().current_scene.add_child(options)
