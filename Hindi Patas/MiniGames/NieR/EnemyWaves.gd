extends Node2D

@export_file("*.tscn") var next_scene

func start():
	$WaveOne.start()
	$WaveTwo.start()
	$WaveThree.start()

func _process(delta):
	if $WaveOne.is_clear() && $WaveTwo.is_clear() && $WaveThree.is_clear():
		SceneTransition.load_scene(load(next_scene))
