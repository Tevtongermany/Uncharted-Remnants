extends CharacterBody2D

# Scene stuff
@onready var animsprite2d = $Sprite
# player stats
const SPEED = 100
const JUMP_VELOCITY = -350
var Jumped: bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("input_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("input_left", "input_right")
	
	change_horizontal(direction)
	# handle animations based on certain actions 
	play_animations()
	move(direction)
	# tbh i have no idea what it does :skull:
	move_and_slide()
	
	
func move(direction):
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func change_horizontal(direction):
	# rotate sprite
	if direction < 0:
		animsprite2d.flip_h = true
	elif direction > 0:
		animsprite2d.flip_h = false
		
		
func play_animations():
	if velocity.x != 0 and is_on_floor():
		animsprite2d.play("moving")
	elif is_on_floor():
		animsprite2d.play("default")
		
	if Input.is_action_just_pressed("input_jump") and is_on_floor():

		animsprite2d.play("jump")
