extends Node
class_name velocityComponent

@export var maxSpeed: int = 40
@export var stunnedSpeed: int = 0
@export var stunnedAcc: float = 0
@export var acceleration: float = 5

var canMove = true
var velocity = Vector2.ZERO

func accelerateToPlayer():
	if canMove == true:
		canMove = true
		var ownerNode = owner as Node2D
		if ownerNode == null:
			return
		
		var player = get_tree().get_first_node_in_group("Player") as Node2D
		if player == null:
			return
		
		var direction = (player.global_position - ownerNode.global_position).normalized()
		accelerateInDirectioon(direction)

func accelerateInDirectioon(direction: Vector2):
	var desiredVelocity = direction * maxSpeed
	velocity = velocity.lerp(desiredVelocity, 1 - exp(-acceleration * get_process_delta_time()))

func move(characterBody: CharacterBody2D):
	characterBody.velocity = velocity
	characterBody.move_and_slide()
	velocity = characterBody.velocity
