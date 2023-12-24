extends Node

var is_increasing = false

onready var circuit = $HBox/VC/Viewport/CircuitMap
onready var room = $HBox/SecondScreen/VC2/Viewport/Room
onready var dust_progress_bar = $HBox/SecondScreen/DustPB
onready var second_screen = $HBox/SecondScreen
onready var collect_player = $CollectPlayer

func _ready() -> void:
	for i in circuit.conducted_places.get_children():
		i.connect("emitted", room.rumba, "on_conductor_emmited",[i.direction])
		i.connect("emitted", self, "on_conductor_emmited",[i.direction])
		i.connect("emit_stopped", room.rumba, "on_conductor_emit_stopped")
		i.connect("emit_stopped", self, "on_conductor_emit_stopped")
	CircuitEvents.dust_progress_bar = dust_progress_bar
	CircuitEvents.connect("collected", self, "_on_collected")
	var _c = CircuitEvents.connect("win", self, "_on_win_condition")
	
func _on_win_condition() -> void:
	$AnimationPlayer.play("win")
	$HBox/SecondScreen/WinScreen.show()
	$HBox/SecondScreen/VC2/Viewport/Confetti.emitting = true

func _process(delta: float) -> void:
	if is_increasing:
		second_screen.size_flags_stretch_ratio += rand_range(0.0008, 0.009)
		second_screen.size_flags_stretch_ratio = min(second_screen.size_flags_stretch_ratio, 1.0)

func on_conductor_emmited(direction: String):
	if direction == "none":
		is_increasing = true

func on_conductor_emit_stopped():
	is_increasing = false

func _on_collected():
	collect_player.play()
