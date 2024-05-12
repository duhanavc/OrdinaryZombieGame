extends Area2D
var direction = Vector2.RIGHT
var Velocity = Vector2(0,0)
var speed = 50

func _physics_process(delta):
	
	translate(direction.normalized() * speed * delta) 

#func setDamage(damage):
	#print(damage)
	#dmg = damage
#
#
#func _on_timer_timeout():
	#queue_free()
#
#
#func _on_body_entered(body):
	#if body.is_in_group("Zombie"):
		#body.dealDamage(dmg)
#


#func _on_timer_timeout():
#	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.is_in_group("Zombie"):
		body.dealDamage()
