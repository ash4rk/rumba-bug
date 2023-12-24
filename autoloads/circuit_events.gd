extends Node

signal win
signal collected

var dust_overall: int = 100 setget _set_dust_overall
var dust_cleaned: int = 0 setget _set_dust_cleaned
var dust_progress_bar: ProgressBar = null

func _set_dust_overall(new_value):
	dust_overall = new_value
	_update_dust_pb()

func _set_dust_cleaned(new_value):
	dust_cleaned = new_value
	emit_signal("collected")
	_update_dust_pb()
	_check_win_condition()

func _update_dust_pb():
	if dust_progress_bar:
		dust_progress_bar.value = (float(dust_cleaned)/float(dust_overall))*100.0

func _check_win_condition():
	if dust_cleaned == dust_overall:
		emit_signal("win")
