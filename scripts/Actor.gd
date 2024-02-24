class_name actor extends CharacterBody2D
@export var max_speed := 800
@export var acceleration := 16000
const SLOW_DOWN := 1600
@export var jump_power := 800
@export var gravity := 3000
var double_jump = true
var passing = 0

func _physics_process(delta):
	handle_x(delta)
	handle_y(delta)
	move_and_slide()

func jump_ready() -> bool:
	return double_jump || is_on_floor()

func get_left_or_right():
	var x = 0
	if(Input.is_action_pressed("left")):
		x -= 1
	if(Input.is_action_pressed("right")):
		x += 1
	return x

func handle_x(delta : float):
	var x = get_left_or_right()
	if(x != 0):
		velocity.x += x * acceleration * delta 
		velocity.x = clampf(velocity.x, -max_speed, max_speed)
	else:
		velocity.x /= (1 + SLOW_DOWN * delta)

func handle_y(delta : float):
	if(jump_ready() && Input.is_action_just_pressed("jump")):
		print("jumping")
		if(!is_on_floor()):
			double_jump = false
		velocity.y = -jump_power
	else:
		velocity.y += gravity * delta
	if(is_on_floor()):
		double_jump = true
	handle_down()

func handle_down():
	if(Input.is_action_pressed("down")):
		set_collision_mask_value(2, false)
	else:
		set_collision_mask_value(2, true)
