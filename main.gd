extends Node

onready var circuit = $HBox/VC/Viewport/CircuitMap
onready var room = $HBox/SecondScreen/VC2/Viewport/Room
onready var dust_progress_bar = $HBox/SecondScreen/DustPB

func _ready() -> void:
	for i in circuit.conducted_places.get_children():
		i.connect("emitted", room.rumba, "on_conductor_emmited",[i.direction])
		i.connect("emit_stopped", room.rumba, "on_conductor_emit_stopped")
	CircuitEvents.dust_progress_bar = dust_progress_bar
	var _c = CircuitEvents.connect("win", self, "_on_win_condition")
	
func _on_win_condition() -> void:
	$AnimationPlayer.play("win")
	$HBox/SecondScreen/WinScreen.show()
	$HBox/SecondScreen/VC2/Viewport/Confetti.emitting = true
