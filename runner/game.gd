extends Node2D

var game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	game_over = 0

func move_player(player, game_over, delta, gravity):
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity.y += gravity * delta * 1.5
	# Handle jump.
	if Input.is_action_just_pressed("spacebar") and player.is_on_floor():
		player.velocity.y = -1100
	if Input.is_action_pressed("left"):
		player.velocity.x = -2100
	elif Input.is_action_pressed("right"):
		player.velocity.x = 2100
	else:
		player.velocity.x = 0
	player.move_and_slide()

func move_enemy(enemy, game_over, delta, gravity, win):
	var target = ($player.position - enemy.position).normalized()

	# Add the gravity.
	if not enemy.is_on_floor():
		enemy.velocity.y += gravity * delta
	if target.y < 0:
		enemy.velocity.y = target.y * 2000
	enemy.velocity.x = target.x * 2200
	var temp = enemy.position.x
	enemy.move_and_slide()
	if enemy.position.x > 74000:
		enemy.position.x = 74000
	if temp == enemy.position.x and not win:
		enemy.velocity.y -= 1100
		enemy.move_and_slide()
	for i in enemy.get_slide_collision_count():
		var collision = enemy.get_slide_collision(i)
		if collision.get_collider() == enemy.get_node("../player"):
			return 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")	
	var win = 0

	if $you_win.text != "":
		win = 1
	if $game_over.text == "":
		game_over = move_enemy($enemy, game_over, delta, gravity, win)
		move_player($player, game_over, delta, gravity)
	var pos = $player.position
	if game_over:
		pos.x -= 3000
		pos.y -= 2000
		$game_over.text = "GAME OVER"
		$game_over.set_position(pos)
		pos.x += 2000
		pos.y += 3000
		$press_r.text = "PRESS R TO RESTART"
		$press_r.set_position(pos)
	if Input.is_action_pressed("restart") and game_over:
		$player.position.x = 4500
		$player.position.y = 4900
		$enemy.position.x = 100
		$enemy.position.y = 4800
		$game_over.text = ""
		$press_r.text = ""		
		game_over = 0
	if $player.position.x > 74400:
		pos.x -= 2200
		pos.y += 500
		$you_win.text = "YOU WIN"
		$you_win.set_position(pos)
