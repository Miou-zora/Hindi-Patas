extends Node

@export var tile_scene: PackedScene
@export_file("*.tscn") var next_scene

var screen_size
var score = 0

func _ready():
	screen_size = get_viewport().size

func _process(delta):
	if score == 45:
		$SpawnTimer.stop()
		$ScoreTimer.stop()
		score += 1
		SceneTransition.load_scene(load(next_scene))

func new_game():
	get_tree().call_group("Tiles", "queue_free")
	score = -1
	score_update()
	$EndHUD.hide()
	$SpawnTimer.start()
	$ScoreTimer.start()

func _on_spawn_timer_timeout():
	var tile = tile_scene.instantiate()
	var rand = randi_range(0, 3)
	var color_rect = tile.get_node("ColorRect")
	if rand == 0:
		color_rect.color = Color.GREEN
	elif rand == 1:
		color_rect.color = Color.YELLOW
	elif rand == 2:
		color_rect.color = Color.BLUE
	else:
		color_rect.color = Color.RED
	tile.position = Vector2(screen_size.x / 2 - 128 + 64 * rand + 32, -20)
	tile.linear_velocity = Vector2(0.0, 250.0)
	tile.connect("hit", tile_hit)
	tile.connect("lose", tile_quit)
	add_child(tile)

func tile_hit(tile):
	tile.queue_free()

func tile_quit():
	$SpawnTimer.stop()
	$ScoreTimer.stop()
	$EndHUD.show()

func score_update():
	score += 1
	$Score.text = str(score)
