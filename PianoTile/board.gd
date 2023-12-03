extends Area2D
var hit_board = [false, false, false, false]
var body_board = [null, null, null, null]
var key_pressed = [false, false, false, false]

signal hit
signal lose

# Called when the node enters the scene tree for the first time.
func _ready():
	$FirstBoard.color = Color.GREEN
	$SecondBoard.color = Color.YELLOW
	$ThirdBoard.color = Color.BLUE
	$FourthBoard.color = Color.RED
	pass

func _process(delta):
	if Input.is_action_pressed("Key_1") and not key_pressed[0]:
		if hit_board[0]:
			emit_signal("hit", body_board[0])
			hit_board[0] = false
		else:
			emit_signal("lose")
		key_pressed[0] = true
	elif not Input.is_action_pressed("Key_1"):
		key_pressed[0] = false
	if Input.is_action_pressed("Key_2") and not key_pressed[1]:
		if hit_board[1]:
			emit_signal("hit", body_board[1])
			hit_board[1] = false
		else:
			emit_signal("lose")
		key_pressed[1] = true
	elif not Input.is_action_pressed("Key_2"):
		key_pressed[1] = false
	if Input.is_action_pressed("Key_3") and not key_pressed[2]:
		if hit_board[2]:
			emit_signal("hit", body_board[2])
			hit_board[2] = false
		else:
			emit_signal("lose")
		key_pressed[2] = true
	elif not Input.is_action_pressed("Key_3"):
		key_pressed[2] = false
	if Input.is_action_pressed("Key_4") and not key_pressed[3]:
		if hit_board[3]:
			emit_signal("hit", body_board[3])
			hit_board[3] = false
		else:
			emit_signal("lose")
		key_pressed[3] = true
	elif not Input.is_action_pressed("Key_4"):
		key_pressed[3] = false

func _on_body_exited(body):
	if body.position.x == 480:
		$FirstBoard.color = Color.GREEN
		hit_board[0] = false
	elif body.position.x == 544:
		$SecondBoard.color = Color.YELLOW
		hit_board[1] = false
	elif body.position.x == 608:
		$ThirdBoard.color = Color.BLUE
		hit_board[2] = false
	elif body.position.x == 672:
		$FourthBoard.color = Color.RED
		hit_board[3] = false

func _on_body_entered(body):
	if body.position.x == 480:
		$FirstBoard.color = Color.WHITE
		hit_board[0] = true
		body_board[0] = body
	elif body.position.x == 544:
		$SecondBoard.color = Color.WHITE
		hit_board[1] = true
		body_board[1] = body
	elif body.position.x == 608:
		$ThirdBoard.color = Color.WHITE
		hit_board[2] = true
		body_board[2] = body
	elif body.position.x == 672:
		$FourthBoard.color = Color.WHITE
		hit_board[3] = true
		body_board[3] = body
