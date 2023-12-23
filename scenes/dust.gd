extends Area2D

onready var sprite = $Sprite

func _ready() -> void:
	sprite.frame = randi() % 4

func _on_Dust_body_entered(body: Node) -> void:
	if body.is_in_group("rumba") and sprite.visible:
		$CPUParticles2D.emitting = true
		sprite.hide()
