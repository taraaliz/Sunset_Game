# Settings UI
# methods of updating window size in Main.gd
extends Control

# Emitted when user presses apply button
signal apply_button_pressed(settings)

# dictionary to store selected settings
var _settings := {resolution = Vector2(640, 480), fullscreen = false, 
master_vol = 100, music_vol = 100, sfx_vol = 100}

func _on_ApplyButton_pressed() -> void:
	# Send settings with signal
	emit_signal("apply_button_pressed", _settings)
	
# Store selected resoltuion
func _on_UIResolutionSelector_resolution_changed(new_resolution):
	_settings.resolution = new_resolution

# Store fullscreen setting
func _on_UIFullScreenCheckbox_toggled(is_button_pressed):
	_settings.fullscreen = is_button_pressed
	
# volume stuff goes here

func _on_BackButton_pressed():
	visible = false
