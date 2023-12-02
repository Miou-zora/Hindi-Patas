extends Node2D

func start():
	$Timer.start()

var spawned: bool = false

func _on_timer_timeout():
	for enemySetup in $EnemiesSetup.get_children():
		if "enemy_prefab" in enemySetup:
			var enemy_prefab: PackedScene = enemySetup.enemy_prefab
			var enemy_pos: Vector2 = enemySetup.get_child(0).position
			var enemy_rot: float = enemySetup.get_child(0).rotation
			var enemy = enemy_prefab.instantiate()
			
			enemy.position = enemy_pos
			enemy.rotation = enemy_rot
			
			add_child(enemy)
	spawned = true

func is_clear():
	return spawned && get_child_count() <= 2
