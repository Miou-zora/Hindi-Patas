extends Area2D
signal tile_enter

# Called when the node enters the scene tree for the first time.
func _ready():
	#hide()
	var screen_size = get_viewport().size
	$FirstBoard.position = Vector2(screen_size.x / 2 - 128 + 75 * 0, 565)
	$SecondBoard.position = Vector2(screen_size.x / 2 - 128 + 75 * 1, 565)
	$ThirdBoard.position = Vector2(screen_size.x / 2 - 128 + 75 * 2, 565)
	$FourthBoard.position = Vector2(screen_size.x / 2 - 128 + 75 * 3, 565)

func _process(delta):
	pass

func _on_body_exited(body):
	$FirstBoard.color = Color.WHITE
	pass # Replace with function body.

func _on_body_entered(body):
	print(body.position)
	$FirstBoard.color = Color.RED
	pass # Replace with function body.
