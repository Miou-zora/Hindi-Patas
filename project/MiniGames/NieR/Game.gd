extends Node2D

@export var playerScene: PackedScene

func spawnPlayer():
	var player = playerScene.instantiate()
	player.position = $PlayerSpawn.position
	add_child(player)

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnPlayer()
	$EnemyWaves.start()
