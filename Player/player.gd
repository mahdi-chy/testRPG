extends CharacterBody2D
const SPEED = 100.0
const SHIFT_SPEED = 135.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim=$AnimatedSprite2D
var lastDirection="down"
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
	if velocity.y>0:
		lastDirection="down"
		anim.play("JenoIce_player_front")
	elif velocity.y<0:
		lastDirection="up"
		anim.play("JenoIce_player_back")
	elif velocity.x<0:
		lastDirection="left"
		anim.flip_h=true
		anim.play("JenoIce_player_side")
	elif velocity.x>0:
		lastDirection="right"
		anim.flip_h=false
		anim.play("JenoIce_player_side")
	else:
		match lastDirection:
			"down":
				anim.play("idle_down")
			"up":
				anim.play("idle_up")
			"left":
				anim.flip_h=true
				anim.play("idle_side")
			"right":
				anim.flip_h=false
				anim.play("idle_side")
	move_and_slide()
