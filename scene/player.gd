extends Spatial

signal restart()

func _ready() -> void:
	pass

func _on_OQ_LeftController_button_pressed(button: int) -> void:
	pass
#	if button == vr.BUTTON.LEFT_GRIP_TRIGGER:
#		$OQ_ARVROrigin/OQ_LeftController/GrapplingHook.hook()

func _on_Pause_restart() -> void:
	emit_signal("restart")
