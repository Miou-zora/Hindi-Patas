extends Node2D

#@export var next_scene: PackedScene

func start():
	$WaveOne.start()
	$WaveTwo.start()
	$WaveThree.start()

func _process(delta):
	if $WaveOne.is_clear() && $WaveTwo.is_clear() && $WaveThree.is_clear():
		#SceneTransition.load_scene(next_scene)
		pass
