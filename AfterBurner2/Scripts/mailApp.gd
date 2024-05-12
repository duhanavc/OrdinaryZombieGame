extends TextureButton




func _on_pressed() -> void:
	$"../../../CanvasLayer/mailApp".visible = true
	$"../../../CanvasLayer/mailApp/openAnim".play("open")

func _on_mail_close_pressed() -> void:
	$"../../../CanvasLayer/mailApp".visible= false


func _on_bar_mail_pressed() -> void:
	$"../../../CanvasLayer/mailApp".visible= true
	$"../../../CanvasLayer/mailApp/openAnim".play("open")


func _on_message_button_pressed() -> void:
	$"../../../CanvasLayer/mailApp/messageButton/CanvasLayer/messageBox".visible = true
	


func _on_message_close_pressed() -> void:
	$"../../../CanvasLayer/mailApp/messageButton/CanvasLayer/messageBox".visible = false
