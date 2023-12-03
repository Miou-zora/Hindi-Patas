extends Node2D


func start():
	$WaveOne.start()
	$WaveTwo.start()
	$WaveThree.start()

func _process(delta):
	if $WaveOne.is_clear() && $WaveTwo.is_clear() && $WaveThree.is_clear():
		# end
