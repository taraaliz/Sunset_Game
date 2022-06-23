extends Node2D

func update_settings(settings: Dictionary) -> void:
	OS.window_fullscreen = settings.fullscreen
	get_tree().set_screen_stretch(
		SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, 
		settings.resolution
	)
	OS.set_window_size(settings.resolution)
	# volume stuff here

func _on_UISettings_apply_button_pressed(settings) -> void:
	update_settings(settings)
