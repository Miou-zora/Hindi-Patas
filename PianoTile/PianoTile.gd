extends Node

@export var tile_scene: PackedScene
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	$SpawnTimer.start()

func _on_spawn_timer_timeout():
	var tile = tile_scene.instantiate()
	var rand = randi_range(0, 3)
	tile.position = Vector2(screen_size.x / 2 - 143 + 74 * rand + 32, -20)
	tile.linear_velocity = Vector2(0.0, 250.0)
	add_child(tile)

