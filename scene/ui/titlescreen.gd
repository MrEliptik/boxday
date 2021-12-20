extends Control

signal play(difficulty)

enum difficulty {
	EASY,
	MEDIUM,
	HARD
}

func _ready() -> void:
	$MarginContainer/Screen1.visible = true
	$MarginContainer/Screen2.visible = false

func _on_PlayBtn_pressed() -> void:
	$MarginContainer/Screen1.visible = false
	$MarginContainer/Screen2.visible = true

func _on_ExitBtn_pressed() -> void:
	get_tree().quit()

func _on_EasyBtn_pressed() -> void:
	emit_signal("play", difficulty.EASY)

func _on_MediumBtn_pressed() -> void:
	emit_signal("play", difficulty.MEDIUM)

func _on_HardBtn_pressed() -> void:
	emit_signal("play", difficulty.HARD)

func _on_BackBtn_pressed() -> void:
	$MarginContainer/Screen1.visible = true
	$MarginContainer/Screen2.visible = false
