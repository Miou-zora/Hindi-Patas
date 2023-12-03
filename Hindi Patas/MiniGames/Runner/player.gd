extends CharacterBody2D

# --------- VARIABLES ---------- #

@onready var player_sprite = $AnimatedSprite2D
@onready var particle_trails = $ParticleTrails

# --------- BUILT-IN FUNCTIONS ---------- #

func _process(_delta):
	# Calling functions
	player_animations()
	flip_player()
	
# --------- CUSTOM FUNCTIONS ---------- #

# Handle Player Animations
func player_animations():
	particle_trails.emitting = false
	
	if is_on_floor():
		if abs(velocity.x) > 0:
			particle_trails.emitting = true
			player_sprite.play("Walk", 1.5)
		else:
			player_sprite.play("Idle")
	else:
		player_sprite.play("Jump")

# Flip player sprite based on X velocity
func flip_player():
	if velocity.x < 0: 
		player_sprite.flip_h = true
	elif velocity.x > 0:
		player_sprite.flip_h = false
