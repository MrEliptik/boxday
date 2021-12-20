extends Area

signal box_state(value)

export var color: Color

func _ready() -> void:
	pass

func _on_BoxValidation_body_entered(body: Node) -> void:
	if !body.is_in_group("Boxes"): return
	var body_parent = body.get_parent()
	if color != body_parent.color:
		emit_signal("box_state", false)
		body_parent.destroy()
		$AudioStreamPlayer3D2.play()
		return
	$AudioStreamPlayer3D.play()
	emit_signal("box_state", true)
	body_parent.gift()
