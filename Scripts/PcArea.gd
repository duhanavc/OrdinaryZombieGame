extends Area2D

class_name pcArea
var attackInput
@export var hud:PackedScene
@onready var pcScreen=  $"../new"
@onready var PcC = pcController 
func disable_attack():
	set_process_unhandled_input(false)
	
func renable_attack():
	set_process_unhandled_input(true)




func openPc():
	if Input.is_action_just_pressed("interact"):
		if $"../new".visible==true:
			if PcC.isSleepClosed == false:
				pcScreen.rotation_degrees = 180
				pcScreen.position = Vector2(1902,1110)
			elif PcC.isSleepClosed ==true:
				pcScreen.rotation_degrees = 0
				pcScreen.position = Vector2(0,0)
				PcC.isSleepClosed=false
			
			$"../new".visible= false
		else:
			
			$"../new".visible=true
			
		
		
func _physics_process(delta: float) -> void:
	openPc()

