extends Node2D

signal emitted
signal emit_stopped

export var direction: String = "right"

onready var sparkles = $CPUParticles2D
onready var sprite = $Sprite

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("bug"):
		sprite.hide()
		body.zap()
		body.global_position = global_position
		emit_signal("emitted")
		sparkles.emitting = true

func _on_Area2D_body_exited(body: Node) -> void:
	if body.is_in_group("bug"):
		body.unzap()
		emit_signal("emit_stopped")
		sparkles.emitting = false

