extends Node2D

@export_file("*tscn") var Change_level_to 

func start():
	get_tree().change_scene(Change_level_to)
