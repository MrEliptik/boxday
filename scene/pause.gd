extends Spatial

func _ready() -> void:
	pass

func _on_OQ_LeftController_button_pressed(button: int) -> void:
	if button == vr.BUTTON.A:
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused

func _on_OQ_RightController_button_pressed(button: int) -> void:
	if button == vr.BUTTON.X:
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused
