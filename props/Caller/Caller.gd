@tool
extends Node2D
@onready var area = $Area2D
# Called when the node enters the scene tree for the first time.
@onready var tree = get_tree()

@export var node: NodePath
@onready var my_node = get_node(node)
@onready var my_node_full_path = my_node.get_path()
@onready var tocall = tree.get_root().get_node(my_node_full_path)
@onready var sprite = $Sprite
@onready var Lable = $Label
@export var Type : TYPE

# Variables for Lever
enum LEVER_STATE{
	on,
	off,
}

enum TYPE {
	lever,
	button,
	pressure_plate
}

func _process(delta):
	if Engine.is_editor_hint():
		if Type == 0:
			Lable.text =  "lever"
			
		

		

		
		
func _input(event):
	for body in area.get_overlapping_areas():
		if body.name == "cat" and Input.is_action_just_pressed("game_interact"):
			if tocall:
				tocall.call("start")
			else:
				print_debug("No Node selected")

