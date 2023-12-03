extends CharacterBody2D

var ROTATION_SPEED: float = 1.5
var SPEED: int = 100
@export var projectile_prefab: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func look_at_character(delta):
	var player = get_node("/root/Game/Player")
	if not player:
		return
	var player_pos = player.global_position
	var player_dir = player_pos - global_position
	var player_angle = player_dir.angle()
	var player_angle_deg = player_angle * 180 / PI
	var angle = get_global_rotation()
	var angle_deg = angle * 180 / PI
	var angle_diff = player_angle_deg - angle_deg
	if angle_diff > 180:
		angle_diff -= 360
	if angle_diff < -180:
		angle_diff += 360
	if angle_diff > 0:
		angle += ROTATION_SPEED * delta
	if angle_diff < 0:
		angle -= ROTATION_SPEED * delta
	set_global_rotation(angle)

func get_forward_vector():
	var angle_radians = deg_to_rad(rotation_degrees)
	var x = cos(angle_radians)
	var y = sin(angle_radians)
	return Vector2(x, y)

func _process(delta):
	pass

func _physics_process(delta):
	look_at_character(delta)
	velocity = get_forward_vector().normalized() * SPEED
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().collision_layer != 0b10 && collision.get_collider().collision_layer != 0b10000:
			queue_free()
			return

func _on_projectile_timer_timeout():
	var projectile = projectile_prefab.instantiate()
	projectile.set_global_position(position + get_forward_vector() * 40)
	projectile.rotation = rotation
	get_parent().add_child(projectile)

func _on_body_entered(body):
	if body.collision_layer != 0b10000:
		queue_free()

