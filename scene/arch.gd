extends Spatial

export var color: Color

func _ready() -> void:
	randomize()
	$CSGBox.material_override.albedo_color = color
