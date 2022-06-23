extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartBtn.grab_focus()

func _on_StartBtn_pressed():
	get_tree().change_scene("res://scenes/World.tscn")

func _on_OptionsBtn_pressed():
	var options = load("res://resources/menu/Options.tscn").instance()
	get_tree().current_scene.add_child(options)

func _on_QuitBtn_pressed():
	get_tree().quit()
