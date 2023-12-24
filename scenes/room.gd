extends Node2D

onready var rumba = $Rumba

func _ready() -> void:
	CircuitEvents.dust_overall = $Dusts.get_child_count()
