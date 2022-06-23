extends CanvasLayer

export(String, FILE, "*.json") var dialogue_file

var dialogues = []

func _ready():
	play()
	
func play():
	dialogues = load_dialogue()
	
func _input(event):
	if event.is_action_pressed("game_usage"):
		next_line()	

func next_line():
	current_dialogue_id += 1
	
	

func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())

