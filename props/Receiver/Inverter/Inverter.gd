extends Node2D

@export var Invertet_State_Receiver: NodePath
@onready var tocall = null
@onready var tree = get_tree()
var _state = 0


func _ready():
	$Inverterico.hide()
	if Invertet_State_Receiver:
		var _Node = get_node(Invertet_State_Receiver)
		var _Node_path = _Node.get_path()
		var _tocall = tree.get_root().get_node(_Node_path)
		tocall = _tocall
	else:
		print_debug("No Node Selected!")
		
func start(state):
	if state == 1:
		_state = 0
		tocall.call("start",_state)
	elif state ==0:
		_state = 1
		tocall.call("start",_state)
	
	
