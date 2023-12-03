extends CharacterBody2D

@export var movement_speed = 20.0

@onready var player = get_tree().get_first_node_in_group("player")

var movement = 20.0

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed*3
	move_and_slide()

func enemy():
	pass
