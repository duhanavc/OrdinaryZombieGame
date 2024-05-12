extends Node2D


class_name GameOver

@onready var player = Player.new()

func _physics_process(delta):
	if player.currentHealth <= 0 :
		gameOverMethod()

		

func gameOverMethod():
	get_tree().change_scene_to_file("res://Scenes/game_over_default.tscn")

