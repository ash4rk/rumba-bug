extends Sprite

onready var conducted_places = $ConductedPlaces
onready var canvas_modulate = $CanvasModulate
onready var anim_player = $AnimationPlayer
onready var glitch_shader = $GlitchShader

func _ready() -> void:
	for i in conducted_places.get_children():
		i.connect("emitted", self, "_on_conducted_place_emitted")
		i.connect("emit_stopped", self, "_on_conducted_place_emit_stopped")

func _on_conducted_place_emitted() -> void:
	anim_player.play("lights_trigger")
	glitch_shader.material.set_shader_param("AMT", 0.4)

func _on_conducted_place_emit_stopped() -> void:
	anim_player.seek(0.0, true)
	anim_player.stop()
	glitch_shader.material.set_shader_param("AMT", 0.0)
