@tool
extends Node2D

@onready var Line = $Line2D
@onready var marker = $Marker2D
@onready var raycast = $RayCast2D
var tocall = null
@export var laserpos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		marker.position = laserpos
		Line.set_point_position(1,laserpos)
		raycast.target_position = Vector2(marker.position.x,marker.position.y-4)
		var tree = get_tree()
		var my_node = get_node("../Cat")
		var my_node_full_path = my_node.get_path()
		tocall = tree.get_root().get_node(my_node_full_path)

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		Line.set_point_position(1,laserpos)
		marker.position = laserpos
		raycast.target_position = Vector2(marker.position.x,marker.position.y-4)
	elif not Engine.is_editor_hint():
		if raycast.is_colliding():
			var raycast_collider = raycast.get_collider()
			if raycast_collider.name == "Cat":
				tocall.call("takedamage", 100)

	
func start(state):
	if state == 1:
		on()
	elif state == 0:
		off()
	
	
func off():
	raycast.enabled = false
	Line.visible = false
	
func on():
	raycast.enabled = true
	Line.visible = true
