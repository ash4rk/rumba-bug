extends Sprite


func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("bug"):
		body.dazzle()


func _on_Area2D_body_exited(body: Node) -> void:
	if body.is_in_group("bug"):
		body.undazzle()
