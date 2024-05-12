extends CharacterBody2D

var speed = 50


func movement():
	var moveDir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = moveDir * speed

func _physics_process(delta: float) -> void:
	movement()
	move_and_slide()
