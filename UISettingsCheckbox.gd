# Scene with a checkbox to switch settings with boolean values
# tool allows us to see labels text updated when changing editor's title variable
tool
extends Control

# emitted when checkbox state changes
signal toggled(is_button_pressed)

# lets us change text when title variable changes
export var title := "" setget set_title

onready var label := $Label

# emit toggled signal when checkbox state changes
func _on_CheckBox_toggled(button_pressed: bool) -> void:
	emit_signal("toggled", button_pressed)

# executed when title variable changes
func set_title(value: String) -> void:
	title = value
	# wait until scene is ready if label is null
	if not label:
		yield(self, "ready")
	# update label's text
	label.text = title
