extends CharacterBody2D

const SPEED = 100.0
const SHIFT_SPEED = 135.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var input_direction=Vector2.ZERO
	input_direction.x=Input.get_axis("move_left_a","move_right_d")
	input_direction.y=Input.get_axis("move_up_w","move_down_s")
	input_direction=input_direction.normalized()
	if Input.is_action_pressed("shift_pressed"):
		velocity.x=input_direction.x*SHIFT_SPEED
		velocity.y=input_direction.y*SHIFT_SPEED
	else:
		velocity.x=input_direction.x*SPEED
		velocity.y=input_direction.y*SPEED
	
	move_and_slide()
