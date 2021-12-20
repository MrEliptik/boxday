extends Spatial

export var color: Color

func _ready() -> void:
	$MeshInstance.get_surface_material(0).emission = color
