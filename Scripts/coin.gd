extends Area2D


var player = Player.new()

func _on_body_entered(body):
	if body.name == "Player":
		if player.currentHealth < 100 :
			queue_free() 
	

#func _on_body_entered(body):
	#if body.name == "Zombie":
		#queue_free() 
	#
