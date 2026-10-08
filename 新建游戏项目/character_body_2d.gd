extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0
const MAX_JUMPS=5
var jumps_left=MAX_JUMPS


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumps_left=MAX_JUMPS

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and jumps_left>0:
		velocity.y = JUMP_VELOCITY
		jumps_left-=1	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("smaller"):
		scale*=0.8
	if Input.is_action_just_pressed("lager"):
		scale*=1.2

	move_and_slide()
