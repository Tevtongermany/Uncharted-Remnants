@tool
extends Node2D

# Wall property
@export_category("Wall Properties")
@export var position_to_move_to : Vector2
@export var move_speed = 1.0
@onready var wall = $CharacterBody2D
@onready var preview_area = $Preview
@export_category("Optional")
@export var finish_callback: NodePath
# values for door
var original_pos = Vector2()
var open = false
var _state = 0


		
	
func start(state):
	if state == 1:
		_state = state
		var tween1 = create_tween()
		tween1.tween_property(wall, "position", position_to_move_to, move_speed)
		
	elif state == 0:
		_state = state
		var tween = create_tween()
		tween.tween_property(wall, "position", original_pos, move_speed)
		
func _physics_process(delta):
	if Engine.is_editor_hint():
		preview_area.position.x = position_to_move_to.x
		preview_area.position.y = position_to_move_to.y
	
	
	
	



