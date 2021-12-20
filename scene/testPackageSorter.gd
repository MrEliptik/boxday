extends Spatial

onready var spawners = get_tree().get_nodes_in_group("Spawners")

var points: int = 0

enum DIFFICULTY {
	EASY,
	MEDIUM,
	HARD
}

var min_time_spawn = 2.5
var max_time_spawn = 4.5

var curr_speed_up := 0.0
var speed_up := 0.05
var easy_speed_up := 0.01
var medium_speed_up := 0.05
var hard_speed_up := 0.1

func _ready() -> void:
	vr.initialize()
	randomize()
#	start(DIFFICULTY.MEDIUM)

func start(difficulty):
	match difficulty:
		DIFFICULTY.EASY:
			for spawner in spawners:
				spawner.random_color = false
				spawner.spawn_garbage = true
				speed_up = easy_speed_up
		DIFFICULTY.MEDIUM:
			for spawner in spawners:
				spawner.random_color = true
				spawner.spawn_garbage = true
				speed_up = medium_speed_up
		DIFFICULTY.HARD:
			for spawner in spawners:
				spawner.random_color = false
				spawner.spawn_garbage = true
				speed_up = hard_speed_up
	$Timer.start()
	

func spawn_box():
	var idx = randi() % spawners.size()
	spawners[idx].spawn_box()

func _on_Timer_timeout() -> void:
	spawn_box()
	if min_time_spawn - curr_speed_up > 0.1:
		curr_speed_up += speed_up
	var min_time = min_time_spawn - curr_speed_up
	var max_time = max_time_spawn - curr_speed_up
		
	$Timer.wait_time = rand_range(min_time, max_time)
	$Timer.start()

func _on_BoxValidation_box_state(value) -> void:
	#TODO: count points
	if value:
		points += 50
	else:
		points -= 25
	Globals.score = points
	print(points)

func _on_Area_body_entered(body: Node) -> void:
	if !body.is_in_group("Boxes"): return
	body.get_parent().destroy()

func _on_Titlescreen_play(difficulty) -> void:
	start(difficulty)
	$UItest.visible = false

func _on_Player_restart() -> void:
	get_tree().reload_current_scene()
