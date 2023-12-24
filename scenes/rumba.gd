extends KinematicBody2D

export var _movespeed: = 100.0

var move_direction

func _physics_process(_delta: float) -> void:
	var motion = Vector2.ZERO
	
	# Debug controls
#	if Input.get_action_strength("up"):
#		motion.y -= 1
#	if Input.get_action_strength("down"):
#		motion.y += 1
#	if Input.get_action_strength("left"):
#		motion.x -= 1
#	if Input.get_action_strength("right"):
#		motion.x += 1
	
	match move_direction:
		"up":
			motion.y -= 1
		"down":
			motion.y += 1
		"left":
			motion.x -= 1
		"right":
			motion.x += 1
		_:
			pass
	
	motion = motion.normalized()
	motion = move_and_slide(motion * _movespeed)

func on_conductor_emmited(direction: String):
	move_direction = direction

func on_conductor_emit_stopped():
	move_direction = "none"
