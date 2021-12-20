extends Control

func _ready() -> void:
	pass

func set_score(score):
	$GridContainer/Label2.text = str(score)

func _on_Timer_timeout() -> void:
	set_score(Globals.score)
