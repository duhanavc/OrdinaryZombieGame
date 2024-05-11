extends Node2D

class_name enemySpawn

@onready var main = get_node("/root/World")

var enemyScene := preload("res://Scenes/Zombie.tscn")
var spawn_points := []
var currentZomibeAmount = 0 

# Called when the node enters the scene tree for the first time 
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)


#func _on_timer_timeout():
	## Check how many enemies have already been created
	#var zombies = get_tree().get_nodes_in_group("Zombies")
	#if !get_parent().isWaveCompleted :
	##Pick random spawn points
		#var spawn = spawn_points[(randi() )% spawn_points.size()]
		## Spawn enemy
		#var enemies = enemyScene.instantiate()
		#currentZomibeAmount += 1
		#enemies.position = spawn.position
			## Hit fonksitonlarının connectionları
		#main.add_child(enemies)
		#enemies.add_to_group("Zombies")



func _on_spawn_cool_down_timeout():
	# Check how many enemies have already been created
	var zombies = get_tree().get_nodes_in_group("Zombies")
	if zombies.size() < get_parent().max_enemies :
	#Pick random spawn points
		var spawn = spawn_points[(randi() )% spawn_points.size()]
		# Spawn enemy
		var enemies = enemyScene.instantiate()
		currentZomibeAmount += 1
		enemies.position = spawn.position
			# Hit fonksitonlarının connectionları
		main.add_child(enemies)
		enemies.add_to_group("Zombies")


func _on_total_spawn_timer_timeout():
	main.isWaveCompleted = true
