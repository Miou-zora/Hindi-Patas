extends CharacterBody2D
signal hit
@export_file("*.tscn") var next_scene

var timer_expired
var movement_speed = 40.0

func _physics_process(_delta):
	movement()

func movement():
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var mov = Vector2(x_mov,y_mov)
	velocity = mov.normalized()*movement_speed*5
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.has_method("enemy"):
		get_tree().reload_current_scene()

func _on_timer_timeout():
	SceneTransition.load_scene(load(next_scene))
