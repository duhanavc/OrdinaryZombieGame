extends Node

const spawnRad = 320
var wantedSpawnAmount
@export var zombie: PackedScene

@onready var timer = $spawnCoolDown

var enemyTable = weightedTable.new()
var baseSpawnTime = 0

func _ready():
	enemyTable.add_item(zombie,1)
	timer.timeout.connect(on_Timer_timeout)

func getSpawnPos():
	var player = get_tree().get_first_node_in_group("Player") as Node2D
	if player == null:
		return Vector2.ZERO
	
	var spawnPosition = Vector2.ZERO
	var randomDirection = Vector2.RIGHT.rotated(randf_range(0, TAU))
	
	for i in 4:
		spawnPosition = player.global_position + (randomDirection * spawnRad)
		var additionalCheckkOffSet = randomDirection * 20
		
		var queryParameters = PhysicsRayQueryParameters2D.create(player.global_position, spawnPosition + additionalCheckkOffSet, 1)
		var result = get_tree().root.world_2d.direct_space_state.intersect_ray(queryParameters)
		
		if result.is_empty():
			break
		else:
			randomDirection = randomDirection.rotated(deg_to_rad(90))
	
	return spawnPosition

func on_Timer_timeout():
	timer.start()
	
	var player = get_tree().get_first_node_in_group("Player")
	if player == null:
		return
		
	var enemyScene = enemyTable.pick_item()
	var enemy = enemyScene.instantiate() as Node2D
	
	var enemiesLayer = get_tree().get_first_node_in_group("EntitiesLayer")
	enemiesLayer.add_child(enemy)
	enemy.global_position = getSpawnPos()


