extends Node2D


@onready var spikezone = $Area2D
@onready var tree = get_tree()
@onready var my_node = get_node("../Cat")
@onready var my_node_full_path = my_node.get_path()
@onready var tocall = tree.get_root().get_node(my_node_full_path)
@export var damage = 1
@export var delay: float
var do_once = false

func _process(delta):
	for bodies in spikezone.get_overlapping_bodies():
		if bodies.name == "Cat":
			if do_once == false:
				tocall.call("takedamage",damage)
				do_once = true
