extends KinematicBody2D

export var _movespeed: = 100.0

func _physics_process(_delta: float) -> void:
	var motion = Vector2.ZERO
	
	if Input.get_action_strength("up"):
		motion.y -= 1
	if Input.get_action_strength("down"):
		motion.y += 1
	if Input.get_action_strength("left"):
		motion.x -= 1
	if Input.get_action_strength("right"):
		motion.x += 1
	
	motion = motion.normalized()
	motion = move_and_slide(motion * _movespeed)
