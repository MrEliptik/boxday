extends Spatial

func _ready() -> void:
	pass

func set_garbage():
	$Viewport/Control/TextureRect.visible = true

func set_color(color: Color) -> void:
	$Viewport/Control/Panel.get_stylebox("panel").bg_color = color
