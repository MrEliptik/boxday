extends Spatial

export var color_1: Color
export var color_2: Color
export var color_3: Color
export var color_4: Color
export var random_color: bool = false

var color: Color

onready var colors = [color_1, color_2, color_3, color_4]

var garbage := false
var can_be_garbage := false

func _ready() -> void:
	randomize()
	
	if randf() < 0.1 && can_be_garbage:
		$OQClass_GrabbableRigidBody/ColorLabel.set_garbage()
		garbage = true
		return
	
	if random_color:
		var idx = randi() % colors.size()
		color = colors[idx]
		$OQClass_GrabbableRigidBody/ColorLabel.set_color(color)
		
func set_color(c: Color):
	if garbage: return
	color = c
	$OQClass_GrabbableRigidBody/ColorLabel.set_color(color)
	
func gift():
	$OQClass_GrabbableRigidBody/Gift.emitting = true
	$OQClass_GrabbableRigidBody/box.visible = false
	$OQClass_GrabbableRigidBody/gift.visible = true
	$Timer.start()
	
func destroy():
	$OQClass_GrabbableRigidBody/box.visible = false
	$OQClass_GrabbableRigidBody/Particles.emitting = true
	$FreeTimer.wait_time = $OQClass_GrabbableRigidBody/Particles.lifetime
	$FreeTimer.start()

func _on_OQClass_GrabbableRigidBody_body_entered(body: Node) -> void:
	$OQClass_GrabbableRigidBody/AudioStreamPlayer3D.play()

func _on_Timer_timeout() -> void:
	destroy()

func _on_FreeTimer_timeout() -> void:
	call_deferred("queue_free")

func _on_Timer2_timeout() -> void:
	destroy()
