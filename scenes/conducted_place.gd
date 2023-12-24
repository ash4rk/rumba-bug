extends Sprite

signal emitted
signal emit_stopped

onready var sparkles = $CPUParticles2D

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("bug"):
		body.dazzle()
		emit_signal("emitted")
		sparkles.emitting = true

func _on_Area2D_body_exited(body: Node) -> void:
	if body.is_in_group("bug"):
		body.undazzle()
		emit_signal("emit_stopped")
		sparkles.emitting = false

