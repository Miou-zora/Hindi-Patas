extends RigidBody2D

var SPEED: int = 500

func get_forward_vector():
	var angle_radians = deg_to_rad(rotation_degrees)
	var x = cos(angle_radians)
	var y = sin(angle_radians)
	return Vector2(x, y)

func _ready():
	apply_central_impulse(get_forward_vector() * SPEED)

func _process(delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	queue_free()
