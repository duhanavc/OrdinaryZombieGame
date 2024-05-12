extends Area2D


func openPc():
	if Input.is_action_just_pressed("interact"):
		var openPcAnim=$"../desktop/Panel/openPcAnim"
		openPcAnim.play("open")
		if  $"../desktop/Panel".visible== true:
			$"../desktop/Panel".visible= false
			openPcAnim.play("close")
		else:
			$"../desktop/Panel".visible= true




func _on_body_entered(body: Node2D) -> void:
	if body.name =="player":
		var label = get_parent().get_node("actionLabel")
		var labelAnim = get_parent().get_node("actionLabel/AnimationPlayer")
		label.visible = true
		labelAnim.play("idle")
		openPc()
		

	



func _on_body_exited(body: Node2D) -> void:
	if body.name =="player":
		var label= get_parent().get_node("actionLabel")
		var labelAnim = get_parent().get_node("actionLabel/AnimationPlayer")
		label.visible = false
		labelAnim.play("lost")
		$"../desktop/Panel".visible = false

func _physics_process(delta: float) -> void:
	openPc()

