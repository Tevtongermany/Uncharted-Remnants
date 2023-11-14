extends Control


@onready var play_container = $Play

# Called when the node enters the scene tree for the first time.




func _on_exit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scene/Level 1.tscn")
