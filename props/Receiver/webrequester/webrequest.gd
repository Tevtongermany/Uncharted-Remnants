extends Node2D
@onready var http = $HTTPRequest

# Called when the node enters the scene tree for the first time.
func _ready():
	http.request("")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start(state):
	var x = http.request_raw("https://fortnite-api.com/v2/aes")
	print(x)
