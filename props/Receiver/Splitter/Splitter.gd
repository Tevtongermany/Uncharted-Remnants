extends Node2D

@export var node_1: NodePath
@export var node_2: NodePath
@export var node_3: NodePath
@export var node_4: NodePath
@export var node_5: NodePath
@onready var tree = get_tree()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Splitter.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func start(state):
	if node_1:
		var _Node1 = get_node(node_1)
		var _Node_path1 = _Node1.get_path()
		var _tocall1 = tree.get_root().get_node(_Node_path1)
		_tocall1.call("start",state)
	if node_2:
		var _Node2 = get_node(node_2)
		var _Node_path2 = _Node2.get_path()
		var _tocall2 = tree.get_root().get_node(_Node_path2)
		_tocall2.call("start",state)
	if node_3:
		var _Node3 = get_node(node_3)
		var _Node_path3 = _Node3.get_path()
		var _tocall3 = tree.get_root().get_node(_Node_path3)
		_tocall3.call("start",state)
	if node_4:
		var _Node4 = get_node(node_4)
		var _Node_path4 = _Node4.get_path()
		var _tocall4 = tree.get_root().get_node(_Node_path4)
		_tocall4.call("start",state)
	if node_5:
		var _Node5 = get_node(node_5)
		var _Node_path5 = _Node5.get_path()
		var _tocall5 = tree.get_root().get_node(_Node_path5)
		_tocall5.call("start",state)
	
