extends CanvasLayer
signal replay

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_replay_pressed():
	replay.emit()
	pass # Replace with function body.

func _on_quit_pressed():
	pass # Replace with function body.
