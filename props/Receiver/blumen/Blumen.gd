extends Node2D

@onready var blumen = $GPUParticles2D
@export var lebenszeit: float
@export var anzahl: int
# Called when the node enters the scene tree for the first time.
func _ready():
	blumen.lifetime = lebenszeit
	blumen.amount = anzahl


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start(state):
	if state == 1:
		blumen.emitting = true
	elif state == 0:
		blumen.emitting = false
