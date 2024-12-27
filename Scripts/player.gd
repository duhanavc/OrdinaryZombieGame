extends CharacterBody2D

class_name Player

@onready var playerAnimations = $AnimationPlayer
const bulletScene = preload("res://Scenes/bullet.tscn")
#const shoutgunBulletScene = preload("res://Scenes/shoutgunBullet.tscn")
#const shoutgunBulletScene = preload("res://Scenes/shoutgunBullet.tscn")

@export var node: Node2D

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
		$Shoutgun.scale.y = 3.34
	if isFacingRight == false:
		playerAnimations.play("walkLeft")
		$deagle.scale.y = -3.6 
		$Shoutgun.scale.y = -3.34
	
	
func _process(delta):
	$deagle.look_at(get_global_mouse_position())
	$Shoutgun.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("attack"):
		#if canAttack == true:
			$deagle.deagleAnim.play()
			$AudioStreamPlayer2D.play()
			#canAttack = false
			shootShoutgun()
			#shoot()

#func shoot():
	#$pistolAttackSpeed.start()
	#var bullet = bulletScene.instantiate()
	#get_parent().add_child(bullet)
	#bullet.position = $deagle/BulletPos.global_position
	#bullet.Velocity = get_global_mouse_position() - bullet.position
	#bullet.look_at(get_global_mouse_position())
	#
func shootShoutgun():
	#var shotgunPos = get_tree().get_root().find_node("ShoutgunPos")
	
	$ShoutgunAttackSpeed.start()
	var ShoutgunBulletMid = bulletScene.instantiate()
	var ShoutgunBulletTop = bulletScene.instantiate()
	var ShoutgunBulletBottom = bulletScene.instantiate()
	
	var bullet = bulletScene.instantiate()
	
	ShoutgunBulletMid.direction = get_global_mouse_position() - node.get_node("ShoutgunPos").global_position  ## direction al
	ShoutgunBulletTop.direction = node.get_node("ShoutgunPosUp").global_position - node.get_node("ShoutgunPos").global_position ## direction al
	ShoutgunBulletBottom.direction =  node.get_node("ShoutgunPosDown").global_position -node.get_node("ShoutgunPos").global_position
	
	
	
	
	bullet.global_position = node.get_node("ShoutgunPos").global_position
	get_tree().get_root().add_child(bullet)
	
	
	ShoutgunBulletBottom.global_position = node.get_node("ShoutgunPos").global_position
	get_tree().get_root().add_child(ShoutgunBulletBottom)

	#ShoutgunBulletTop.direction = node.get_node("ShoutgunPosUp").global_position - global_position
	ShoutgunBulletTop.global_position = node.get_node("ShoutgunPos").global_position
	get_tree().get_root().add_child(ShoutgunBulletTop)
	
