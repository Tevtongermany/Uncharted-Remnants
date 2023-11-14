extends PointLight2D
@onready var light = $Light2D
@export_category("Light Properties")
@export var enabled_at_start: bool

#light var
func _ready():
	$Light.hide()
	enabled = enabled_at_start
	
func start(state):
	enabled = state
	

	
