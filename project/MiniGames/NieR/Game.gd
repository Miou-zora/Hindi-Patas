extends Node2D

@export var playerScene: PackedScene
@export var playerSpawn: Marker2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if playerScene:
		var player = playerScene.instantiate()
		if playerSpawn:
			player.position = playerSpawn.position
		add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
