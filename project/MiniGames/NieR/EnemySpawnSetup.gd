class_name EnemySpawnSetup

var position: Vector2
var enemyPrefab: PackedScene

func _init(p: Vector2, eP: PackedScene):
	position = p
	enemyPrefab = eP	
