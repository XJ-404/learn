extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(_delta: float) -> void:
	# Add the gravity.
	velocity.x=0
	if Input.is_action_pressed("left"):
		velocity.x=-1000
	elif Input.is_action_pressed("right"):
		velocity.x=1000
	velocity.y=0
	if Input.is_action_just_pressed("up"):
		velocity.y=-20000
	elif Input.is_action_just_pressed("down"):
		velocity.y=20000
	else: 
		velocity.y+=20000*3*_delta
		
	move_and_slide()
	pass
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
