extends CharacterBody2D

class_name Zombie

@onready var visual = $aniSprite
@onready var velocityComp = $VelocityComponent
@onready var healthComponent : HealthComponent = $HealthComponent

var player = Player.new()

func _ready():
	set_process_input(true)

func _process(delta):
	velocityComp.accelerateToPlayer()
	velocityComp.move(self)
	
	var moveSign = sign(velocity.x)
	if moveSign != 0:
		visual.scale = Vector2(moveSign, 1)
		
	var direction : Vector2 = position.direction_to(player.global_position)
	var x = snappedi(direction.x, 1)
	var y = snappedi(direction.y, 1)
	
	var Axis = Vector2(x,y)

	if Axis == Vector2(1,0):
		visual.play("ZombieWalkLeft")
	elif Axis == Vector2(-1,0):
		visual.play("ZombieWalkRight")
	elif Axis == Vector2(0,-1):		
		visual.play("ZombieWalkDown")
	elif Axis == Vector2(0,1):		
		visual.play("ZombieWalkUp")
		
func get_direction_to_player():
	var playerNodes = get_tree().get_first_node_in_group("Player") as Node2D
	if playerNodes != null:
		return (playerNodes.global_position - global_position).normalized()
	return Vector2.ZERO

func dealDamage():
	$aniSprite.modulate = Color.RED
	await get_tree().create_timer(0.1).timeout## Bu şekilde zaman blokları ekleyebiliyoruz.
	$aniSprite.modulate = Color.WHITE
	$AudioStreamPlayer2D.play()
	healthComponent.damage(30)
