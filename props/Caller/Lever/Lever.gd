@tool
extends Node2D
@onready var area = $Area2D
# Called when the node enters the scene tree for the first time.
@onready var tree = get_tree()

@export var node: NodePath
@export var starting_state: START_STATE
@onready var tocall = null
@onready var base = $Base
@onready var Lever = $Lever

var lever_state = 0

enum START_STATE {
	off,
	on
}



func _ready():
	if starting_state == 0:
		Lever.rotation = -50
		lever_state = 1
	elif starting_state ==1:
		Lever.rotation = 50
		lever_state = 0
	if node:
		var _Node = get_node(node)
		var _Node_path = _Node.get_path()
		var _tocall = tree.get_root().get_node(_Node_path)
		tocall = _tocall
	else:
		print_debug("No Node Selected!")
	
func _input(event):
	if not Engine.is_editor_hint():
		for body in area.get_overlapping_bodies():
			if body.name == "Cat" and Input.is_action_just_pressed("input_interact"):
				if tocall:
					if lever_state == 0:
						Lever.rotation = -50
						lever_state = 1
						tocall.call("start",lever_state)
					elif lever_state == 1:
						Lever.rotation = 50
						lever_state = 0
						tocall.call("start",lever_state)
				else:
					print_debug("No Node selected")
				
func _physics_process(delta):
	if Engine.is_editor_hint():
		if starting_state == 0:
			Lever.rotation = -50
		elif starting_state == 1:
			Lever.rotation = 50
	elif not Engine.is_editor_hint():
		pass
