extends Node2D

@export var player: NodePath
@export_file("*json") var Dialogue_file
@export var Mode : TRIGGERMODE
@export var Retriggable: bool

@onready var tree = get_tree()
@onready var my_node = get_node(player)
@onready var my_node_full_path = my_node.get_path()
@onready var tocall = tree.get_root().get_node(my_node_full_path)

#Trigger variables
var used = false
@onready var area = $Area2D
var nodialoguefileselected = false

enum TRIGGERMODE{
	Zone,
	Should_be_Called,
	onready,
	
}


func _ready():
	if Dialogue_file:
		pass
	else:
		nodialoguefileselected = true
		print_debug("No Dialogue File selected!!")
	if Mode == 2:
		if nodialoguefileselected == true:
			pass
		else:
			tocall.call("on_called",Dialogue_file)
		
		
		
		


func _on_area_2d_body_entered(body):
	if Mode == 1:
		if nodialoguefileselected == true:
			pass
		else:
			print("entered zone")
			if used == true:
				pass
			elif used == false:
				if body.name == "Cat":
					used = true
					tocall.call("on_called",Dialogue_file)
		
func _on_area_2d_body_exited(body):
	if Mode == 1:
		if nodialoguefileselected == true:
			pass
		else:
			if Retriggable == true:
				used = false
		
func start(state):
	if nodialoguefileselected == true:
		pass
	else:
		if Mode == 1:
			if Retriggable == true:
				tocall.call("on_called",Dialogue_file)
			if Retriggable == false:
				if used == false:
					tocall.call("on_called",Dialogue_file)
					used = true
		
		
	
