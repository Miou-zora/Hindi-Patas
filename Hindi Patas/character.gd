extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -800.0
var _animator = AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	_animator.PROCESS_MODE_ALWAYS
	move_and_slide()
