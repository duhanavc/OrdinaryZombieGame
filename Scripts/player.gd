extends CharacterBody2D

class_name Player

@onready var playerAnimations = $AnimationPlayer
const bulletScene = preload("res://Scenes/bullet.tscn")
const shoutgunBulletScene = preload("res://Scenes/shoutgunBullet.tscn")
var deagle = Deagle.new()

var isFacingRight : bool = true
 
var dmg = 20
var speed = 310

var mousePos 

var canAttack = true
var maxHealth = 100
var currentHealth = 100

func _physics_process(delta):
	var direction : Vector2 = Input.get_vector("walkLeft", "walkRight", "walkUp", "walkDown")
	velocity = direction * speed
	move_and_slide()
	print(canAttack)
	mousePos = get_global_mouse_position()
	
	if mousePos.x > position.x:
		isFacingRight = true
	elif mousePos.x < position.x:
		isFacingRight = false


	if isFacingRight == true:
		playerAnimations.play("walkRight")
		$deagle.scale.y = 3.6 
	if isFacingRight == false:
		playerAnimations.play("walkLeft")
		$deagle.scale.y = -3.6 
	
	
func _process(delta):
	$deagle.look_at(get_global_mouse_position())
	$Shoutgun.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("attack"):
		if canAttack == true:
			$deagle.deagleAnim.play()
			$AudioStreamPlayer2D.play()
			shootShoutgun()
			shoot()
		canAttack = false

func shoot():
	$pistolAttackSpeed.start()
	var bullet = bulletScene.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $deagle/BulletPos.global_position
	bullet.Velocity = get_global_mouse_position() - bullet.position
	bullet.look_at(get_global_mouse_position())
	
func shootShoutgun():
	$ShoutgunAttackSpeed.start()
	var ShoutgunBulletMid = shoutgunBulletScene.instantiate()
	#var ShoutgunBulletTop = bulletScene.instantiate()
	#var ShoutgunBulletBottom = bulletScene.instantiate()
	get_parent().add_child(ShoutgunBulletMid)
	#get_parent().add_child(ShoutgunBulletTop)
	#get_parent().add_child(ShoutgunBulletBottom)
	ShoutgunBulletMid.position = $Shoutgun/ShoutgunPos.global_position
	#ShoutgunBulletTop.position = $ShoutgunPos.global_position
	#ShoutgunBulletBottom.position = $ShoutgunPos.global_position
	#
	ShoutgunBulletMid.Velocity = get_global_mouse_position() - ShoutgunBulletMid.position
	#ShoutgunBulletTop.Velocity = get_global_mouse_position() - ShoutgunBulletMid.position
	#ShoutgunBulletBottom.Velocity = get_global_mouse_position() - ShoutgunBulletMid.position
	
	ShoutgunBulletMid.look_at(get_global_mouse_position())
	
	#func hurtZombie():
	#$AudioStreamPlayer2D.play()
	#$"../HUD/hpBar".value -= 0.5
	#if $"../HUD/hpBar".value == 0:
		#maxhealth - se
		#get_tree().reload_current_scene()
###
	#func healed():
	#if $"../HUD/hpBar".value == 3:
		#return false
	#else:
		#$"../HUD/hpBar".value += 0.5
		#return true
	


func _on_pistol_attack_speed_timeout():
	canAttack = true
	


func _on_shoutgun_attack_speed_timeout():
	canAttack = true
