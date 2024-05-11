extends CharacterBody2D

@onready var visual = $AnimatedSprite2D
@onready var velocityComp = $VelocityComponent

@onready var healthComponent : HealthComponent = $HealthComponent

func _ready():
	set_process_input(true)

func _process(delta):
	velocityComp.accelerateToPlayer()
	velocityComp.move(self)
	
	var moveSign = sign(velocity.x)
	if moveSign != 0:
		visual.scale = Vector2(moveSign, 1)

func get_direction_to_player():
	var playerNodes = get_tree().get_first_node_in_group("Player") as Node2D
	if playerNodes != null:
		return (playerNodes.global_position - global_position).normalized()
	return Vector2.ZERO

func dealDamage():
	healthComponent.damage(10)



