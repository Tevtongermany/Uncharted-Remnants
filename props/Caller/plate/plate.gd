
extends Node2D
@onready var area = $Area2D
# Called when the node enters the scene tree for the first time.
@onready var tree = get_tree()
@export var node: NodePath
@onready var tocall = null
@onready var pressure_plate = preload("res://Assets/props/pressure plate/Plate.png")
@onready var pressure_plate_pressed = preload("res://Assets/props/pressure plate/Plate_pressed.png")
@onready var plate = $Plate

var state = 0
var doonce = false





func _ready():
	
	if node:
		var _Node = get_node(node)
		var _Node_path = _Node.get_path()
		var _tocall = tree.get_root().get_node(_Node_path)
		tocall = _tocall
	else:
		print_debug("No Node Selected!")
	plate.texture = pressure_plate

func _on_area_2d_body_entered(body):
	if node: 
		var state = 1
		tocall.call("start",state)
		plate.texture = pressure_plate_pressed



func _on_area_2d_body_exited(body):
	if node:
		var state = 0
		tocall.call("start",state)
		plate.texture = pressure_plate
