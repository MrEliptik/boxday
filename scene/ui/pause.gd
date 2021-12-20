extends Control

signal restart()
signal resume()

func _ready() -> void:
	pass

func _on_ResumeBtn_pressed() -> void:
	get_tree().paused = false
	visible = get_tree().paused
	emit_signal("resume")

func _on_RestartBtn_pressed() -> void:
	get_tree().paused = false
	visible = get_tree().paused
	emit_signal("restart")

func _on_RestartBtn2_pressed() -> void:
	get_tree().quit()
