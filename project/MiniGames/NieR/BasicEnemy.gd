extends Area2D

var ROTATION_SPEED: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func lookAtCharacter(delta):
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lookAtCharacter(delta)
	
