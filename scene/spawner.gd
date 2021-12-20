extends Spatial

export var box_scene: PackedScene = preload("res://scene/box.tscn")
export var auto_spawn: bool = false
export var color: Color
export var random_color: bool = false
export var spawn_garbage: bool = false

func _ready() -> void:
	if auto_spawn:
		$Chute/Chute2/MeshInstance/Timer.start()

func spawn_box() -> void:
	var instance = box_scene.instance()
	instance.random_color = random_color
	instance.can_be_garbage = spawn_garbage
	if !random_color:
		instance.set_color(color)
	$Chute/Chute2/MeshInstance/Position3D.call_deferred("add_child", instance)
	$AudioStreamPlayer3D.play()

func _on_Timer_timeout() -> void:
	spawn_box()
