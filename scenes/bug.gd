extends KinematicBody2D

export var _movespeed: = 140.0

var input_vector = Vector2.ZERO
var last_motion: = Vector2()
var _is_dazzled = false

onready var sprite = $AnimatedSprite

func _physics_process(_delta: float) -> void:
	var motion = last_motion
	
	if Input.get_action_strength("up"):
		motion.y -= 1
	if Input.get_action_strength("down"):
		motion.y += 1
	if Input.get_action_strength("left"):
		motion.x -= 1
	if Input.get_action_strength("right"):
		motion.x += 1
	
	motion = motion.normalized()
	last_motion = motion
	motion = move_and_slide(motion * _movespeed)
	
	sprite.rotation = -motion.angle_to(Vector2.UP)
	
	if sprite.animation == "moving":
		sprite.playing = motion.abs().x > 0 or motion.abs().y > 0
	if sprite.animation == "triggering":
		sprite.playing = true

func _process(delta: float) -> void:
	if _is_dazzled:
		print("dazzle")

func dazzle():
	last_motion = Vector2.ZERO
	_is_dazzled = true
	sprite.animation = "triggering"
	print("dazzled")
	
func undazzle():
	_is_dazzled = false
	sprite.animation = "moving"
	print("undazzled")
