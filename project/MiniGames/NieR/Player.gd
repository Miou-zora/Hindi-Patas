extends CharacterBody2D

@export var down_key: Key = KEY_DOWN
@export var up_key: Key = KEY_UP
@export var right_key: Key = KEY_RIGHT
@export var left_key: Key = KEY_LEFT
@export var shoot_key: Key = KEY_SPACE

@export var speed: int = 400

@export var projectile: PackedScene

var can_shoot: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func move(delta):
	var deltaMove: Vector2 = Vector2.ZERO
	if Input.is_key_pressed(down_key):
		deltaMove.y += 1
	if Input.is_key_pressed(up_key):
		deltaMove.y -= 1
	if Input.is_key_pressed(right_key):
		deltaMove.x += 1
	if Input.is_key_pressed(left_key):
		deltaMove.x -= 1
	
	if deltaMove.length() > 0:
		move_and_collide(deltaMove * speed * delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	look_at(get_global_mouse_position())
	
func get_forward_vector():
	var angle_radians = deg_to_rad(rotation_degrees)
	var x = cos(angle_radians)
	var y = sin(angle_radians)
	return Vector2(x, y)
	
func _input(event):
	if Input.is_key_pressed(shoot_key) && can_shoot:
		var new_projectile = projectile.instantiate()
		
		new_projectile.set_global_position(position + get_forward_vector() * 40)
		new_projectile.rotation = rotation
		
		get_parent().add_child(new_projectile)
		
		can_shoot = false
		
		$ShootTimer.start()

func _on_shoot_timer_timeout():
	can_shoot = true
