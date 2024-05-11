extends CharacterBody2D

var Velocity = Vector2(0,0)
var speed = 1400
func _physics_process(delta):
	var collision_info =  move_and_collide(Velocity.normalized() * delta * speed)


#
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
