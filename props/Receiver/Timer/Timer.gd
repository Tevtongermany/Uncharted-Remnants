extends Node2D

#onready
@onready var tocall = null
@onready var tree = get_tree()
@onready var timer = $Timer
#export
@export_category("Receiver")
@export var Finish_Callback: NodePath
@export var Should_State_Affect: STATUS
@export var Do_once: bool
@export_category("Timer")
@export var Wait_Time = 1.0
@export var One_Shot: bool
@export var Auto_Start: bool
# Timer Variables
var _state = 0
var _do_once = false


enum STATUS{
	state_affect_timer,
	state_dont_affect_timer,
}

func _ready():
	if Finish_Callback:
		var _Node = get_node(Finish_Callback)
		var _Node_path = _Node.get_path()
		var _tocall = tree.get_root().get_node(_Node_path)
		tocall = _tocall
	else:
		print_debug("No Node Selected!")
	timer.wait_time = Wait_Time
	timer.autostart = Auto_Start
	$sprite.hide()
	
		
		
func start(state):
	if Do_once == true and _do_once == false:
		timer.start()
		_do_once = true
		_state = state
	if Do_once == false:
		timer.start()
		_state = state



func _on_timer_timeout():
	if Do_once == true and _do_once == true:
		tocall.call("start",_state)
	if Do_once == false:
		print("timeout")
		tocall.call("start",_state)
