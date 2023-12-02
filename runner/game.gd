extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_node("player").position
	var enemy = get_node("enemy").position
	player.x = 4500
	player.y = 4000
	enemy.x = 0
	enemy.y = 4500

func move_player(player, game_over, delta, gravity):
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity.y += gravity * delta * 1.5
	# Handle jump.
	if Input.is_action_just_pressed("spacebar") and player.is_on_floor() and not game_over:
		player.velocity.y = -1100
	if Input.is_action_pressed("left") and not game_over:
		player.velocity.x = -2100
	elif Input.is_action_pressed("right") and not game_over:
		player.velocity.x = 2100
	else:
		player.velocity.x = 0
	player.move_and_slide()

func move_enemy(enemy, game_over, delta, gravity):
	# Add the gravity.
	if not enemy.is_on_floor():
		enemy.velocity.y += gravity * delta
	if not game_over:
		enemy.velocity.x = 2400
	var temp = enemy.position.x
	enemy.move_and_slide()
	for i in enemy.get_slide_collision_count():
		var collision = enemy.get_slide_collision(i)
		if collision.get_collider() == enemy.get_node("../player"):
			return 1
	if temp == position.x and not game_over:
		enemy.velocity.y = -1100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_node("player")
	var enemy = get_node("enemy")
	var game_over = 0
	var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")	

	game_over = move_enemy(enemy, game_over, delta, gravity)
	move_player(player, game_over, delta, gravity)
	if game_over:
		player.set
