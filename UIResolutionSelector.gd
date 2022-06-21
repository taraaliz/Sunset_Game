# Scene with an OptionButton to select resolution from list of options
tool
extends Control

# Emitted when selected resolution changes
signal resolution_changed(new_resolution)

# storing reference to option button to get the selected option later
onready var option_button: OptionButton = $OptionButton
export var title := "" setget set_title

onready var label := $Label

func _update_selected_item(text: String) -> void:
	# resolutions in format XRESxYRES
	# split_floats gives array with both vals as floats
	var values := text.split_floats("x")
	
	# emit signal for new resolution
	emit_signal("resolution_changed", Vector2(values[0], values[1]))
	
func _on_OptionButton_item_selected(_index: int) -> void:
	# call when user selects new item
	_update_selected_item(option_button.text)
	
# executed when title variable changes
func set_title(value: String) -> void:
	title = value
	# wait until scene is ready if label is null
	if not label:
		yield(self, "ready")
	# update label's text
	label.text = title
