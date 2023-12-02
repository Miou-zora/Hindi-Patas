extends Area2D
var hit_board = [false, false, false, false]
var body_board = [null, null, null, null]
signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	#hide()
	pass

func _process(delta):
	if (Input.is_action_pressed("Key_Z") and hit_board[0]):
		emit_signal("hit", body_board[0])
	if (Input.is_action_pressed("Key_Q") and hit_board[1]):
		emit_signal("hit", body_board[1])
	if (Input.is_action_pressed("Key_S") and hit_board[2]):
		emit_signal("hit", body_board[2])
	if (Input.is_action_pressed("Key_D") and hit_board[3]):
		emit_signal("hit", body_board[3])
	pass

func _on_body_exited(body):
	if body.position.x == 480:
		$FirstBoard.color = Color.WHITE
		hit_board[0] = false
	elif body.position.x == 544:
		$SecondBoard.color = Color.WHITE
		hit_board[1] = false
	elif body.position.x == 608:
		$ThirdBoard.color = Color.WHITE
		hit_board[2] = false
	elif body.position.x == 672:
		$FourthBoard.color = Color.WHITE
		hit_board[3] = false

func _on_body_entered(body):
	if body.position.x == 480:
		$FirstBoard.color = Color.RED
		hit_board[0] = true
		body_board[0] = body
	elif body.position.x == 544:
		$SecondBoard.color = Color.RED
		hit_board[1] = true
		body_board[1] = body
	elif body.position.x == 608:
		$ThirdBoard.color = Color.RED
		hit_board[2] = true
		body_board[2] = body
	elif body.position.x == 672:
		$FourthBoard.color = Color.RED
		hit_board[3] = true
		body_board[3] = body
