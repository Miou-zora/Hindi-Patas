extends CharacterBody2D

@export var down_key: Key = KEY_DOWN
@export var up_key: Key = KEY_UP
@export var right_key: Key = KEY_RIGHT
@export var left_key: Key = KEY_LEFT
@export var shoot_key: MouseButton = MOUSE_BUTTON_LEFT

@export var speed: int = 400

@export var projectile: PackedScene

var can_shoot: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	look_at(get_global_mouse_position())

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
	
	velocity = deltaMove.normalized() * speed
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	move(delta)
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().collision_layer != 0b10000:
			get_tree().reload_current_scene()
			return
	if Input.is_mouse_button_pressed(shoot_key) && can_shoot:
		var new_projectile = projectile.instantiate()
		
		new_projectile.set_global_position(position + get_forward_vector() * 40)
		new_projectile.rotation = rotation
		
		get_parent().add_child(new_projectile)
		
		can_shoot = false
		
		$ShootTimer.start()
	
func get_forward_vector():
	var angle_radians = deg_to_rad(rotation_degrees)
	var x = cos(angle_radians)
	var y = sin(angle_radians)
	return Vector2(x, y)

func _on_shoot_timer_timeout():
	can_shoot = true


func _on_area_2d_area_entered(_area):
	if _area.collision_layer != 0b10000:
		get_tree().reload_current_scene()
