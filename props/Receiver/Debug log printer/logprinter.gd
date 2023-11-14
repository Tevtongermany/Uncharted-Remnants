extends Node2D

@export var _print = ""



# Called when the node enters the scene tree for the first time.
func _ready():
	$Logprintericon.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start(state):
	print(_print)
