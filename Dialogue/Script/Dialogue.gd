extends Control


var d_file = JSON
var dialogue = []
var dialogueid = 0
var json = JSON.new()
@onready var img = $NinePatchRect/TextureRect
signal next_button_pressed
var skylerwhite = preload("res://Assets/UI/Cat_Images/Skylerwhite.png")
var nothing = preload("res://Assets/UI/empty.png")
var lossofwords = preload("res://Assets/UI/Cat_Images/-.-.png")
var angry = preload("res://Assets/UI/Cat_Images/Angry.png")
var ayo = preload("res://Assets/UI/Cat_Images/Ayo.png")
var normal = preload("res://Assets/UI/Cat_Images/normal.png")





func start(jsonfile):
	d_file = jsonfile
	dialogue = load_dialogue()
	$NinePatchRect.show()
	$NinePatchRect/Name.text = dialogue[str(dialogueid)]["name"]
	$NinePatchRect/Text.text = dialogue[str(dialogueid)]["text"]
	if dialogue[str(dialogueid)]["expression"] == "skylerwhite":
		img.set_texture(skylerwhite)
	elif dialogue[str(dialogueid)]["expression"] == "angry":
		img.set_texture(angry)
	elif dialogue[str(dialogueid)]["expression"] == "lossofwords":
		img.set_texture(lossofwords)
	elif dialogue[str(dialogueid)]["expression"] == "ayo":
		img.set_texture(ayo)
	elif dialogue[str(dialogueid)]["expression"] == "normal":
		img.set_texture(normal)
	else:
		img.set_texture(nothing)
		
func load_dialogue():
	var file = FileAccess.get_file_as_string(d_file)
	var file_as_dict = json.parse_string(file)
	return file_as_dict

	
func updateDialog():
	$NinePatchRect/Name.text = dialogue[str(dialogueid)]["name"]
	$NinePatchRect/Text.text = dialogue[str(dialogueid)]["text"]
	if dialogue[str(dialogueid)]["expression"] == "skylerwhite":
		img.set_texture(skylerwhite)
	elif dialogue[str(dialogueid)]["expression"] == "angry":
		img.set_texture(angry)
	elif dialogue[str(dialogueid)]["expression"] == "lossofwords":
		img.set_texture(lossofwords)
	elif dialogue[str(dialogueid)]["expression"] == "ayo":
		img.set_texture(ayo)
	elif dialogue[str(dialogueid)]["expression"] == "normal":
		img.set_texture(normal)
	else:
		img.set_texture(nothing)

func _on_button_pressed():
	dialogueid += 1
	if dialogueid >= len(dialogue):
		$NinePatchRect.hide()
		dialogueid = 0
		emit_signal("next_button_pressed")
	else:
		updateDialog()
