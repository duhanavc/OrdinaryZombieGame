extends Node
class_name Drop
@export_range(0,1) var healtDropPercent :   float = 1
@export_range(0,1) var CoinDropPercent :   float = 1
@export_range(0,1) var KahveDropPercent :   float = 1

@export var healthComponent: Node
@export var heartScene : PackedScene
@export var coinScene : PackedScene
@export var kahveScene : PackedScene

static var zombies_Killed = 0 

func _ready():
	(healthComponent as HealthComponent).died.connect(onDied)

func onDied():
	zombies_Killed = zombies_Killed + 1
	if (randf() > healtDropPercent and randf() > CoinDropPercent) and randf() > KahveDropPercent: #burası başladığın nokta 
		return
	if heartScene == null or coinScene == null or kahveScene == null:
		return
	if not owner is Node2D:
		return
	
	var SpawnPos = (owner as Node2D).global_position
	
	
	if randf() < healtDropPercent:
		var heartInstance = heartScene.instantiate() as Node2D
		var entitiesLayer = get_tree().get_first_node_in_group("EntitiesLayer")
		entitiesLayer.add_child(heartInstance)
		heartInstance.global_position = SpawnPos 
		
	if randf() < CoinDropPercent: 
		var coinInstance = coinScene.instantiate() as Node2D
		var entitiesLayer = get_tree().get_first_node_in_group("EntitiesLayer")
		entitiesLayer.add_child(coinInstance)
		coinInstance.global_position = SpawnPos
	
	if randf() < KahveDropPercent: 
		var kahveInstance = kahveScene.instantiate() as Node2D
		var entitiesLayer = get_tree().get_first_node_in_group("EntitiesLayer")
		entitiesLayer.add_child(kahveInstance)
		kahveInstance.global_position = SpawnPos
