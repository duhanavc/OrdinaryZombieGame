extends NinePatchRect



func _on_mail_pressed() -> void:
	$VBoxContainer/mail/mailApp.visible = true
	$mailClose.visible = true
	$VBoxContainer/mail/PanelContainer.visible = true
	$VBoxContainer/mail/mailOpened.visible = true
	$VBoxContainer/mail/mailOpened2.visible = true
	$VBoxContainer/mail/mailOpened3.visible = true
	$VBoxContainer/mail/mailOpened4.visible = true
	$"../duhan".visible = true
	$"../bahadır".visible = true
	$"../kaan".visible = true
	$"../ilkay".visible = true
	$VBoxContainer/mail/mailLabel.visible = true
	
	
func _on_mail_close_pressed() -> void:
	$VBoxContainer/mail/mailApp.visible = false
	$mailClose.visible = false
	$VBoxContainer/mail/PanelContainer.visible = false
	$VBoxContainer/mail/mailOpened.visible = false
	$VBoxContainer/mail/mailOpened2.visible = false
	$VBoxContainer/mail/mailOpened3.visible = false
	$VBoxContainer/mail/mailOpened4.visible = false
	$"../duhan".visible = false
	$"../bahadır".visible = false
	$"../kaan".visible = false
	$"../ilkay".visible = false
	$VBoxContainer/mail/mailLabel.visible = false


func _on_sleep_button_pressed() -> void:
	$sleepScreen.visible = true
	$sleepScreen/sleepAnim.play("sleepCome")
	$openButton.visible = true
	$sleepButton.visible = false
	

func _on_open_button_pressed() -> void:
	$openButton/openPcAnim.play("open")
	$openButton.visible = false
	$sleepButton.visible = true


func _on_youtube_pressed() -> void:
	$VBoxContainer/youtube/youtubeApp.visible = true
	$youtubeClose.visible = true
	$VBoxContainer/youtube/youtubeLabel.visible = true
	
	
	
func _on_youtube_close_pressed() -> void:
	$VBoxContainer/youtube/youtubeApp.visible = false
	$youtubeClose.visible = false
	$VBoxContainer/youtube/youtubeLabel.visible = false

func _on_steam_pressed() -> void:
	$steam/steamApp.visible= true
	$steamClose.visible = true
	$steam/steamLabel.visible=true


func _on_steam_close_pressed() -> void:
	$steam/steamApp.visible = false
	$steamClose.visible = false
	$steam/steamLabel.visible = false



func _on_tinder_pressed() -> void:
	$tinder/tinderApp.visible = true
	$tinderClose.visible = true
	



func _on_tinder_close_pressed() -> void:
	$tinder/tinderApp.visible = false
	$tinderClose.visible = false


func _on_shop_pressed() -> void:
	$shop/PanelContainer.visible = true
	$shop/PanelContainer/panelAnimation.play("open")
	$shop/coffee.visible = true
	$shop/coffee/coffeAnim.play("open")
	$shop/chocolatte.visible = true
	$shop/chocolatte/chocolatteAnim.play("open")
	$shop/closeshop.visible = true
	$shop/closeshop/closeShopAnim.play("open")
	$shop/satgan.visible = true
	$shop/satgan/satganAnim.play("open")

func _on_closeshop_pressed() -> void:
	$shop/PanelContainer.visible = false
	$shop/coffee.visible = false
	$shop/chocolatte.visible = false
	$shop/closeshop.visible = false
	$shop/satgan.visible = false
	



func _on_mail_opened_pressed() -> void:
	$VBoxContainer/mail/mailOpened/ilkPass.visible=true
	$VBoxContainer/mail/mailOpened/pass.visible = true
	$VBoxContainer/mail/mailOpened/mailOpenedClose.visible =true


func _on_mail_opened_2_pressed() -> void:
	$VBoxContainer/mail/mailOpened2/ikinciPass.visible = true
	$VBoxContainer/mail/mailOpened2/pass2.visible = true
	$VBoxContainer/mail/mailOpened2/mailOpenedClose2.visible = true


func _on_mail_opened_3_pressed() -> void:
	$VBoxContainer/mail/mailOpened3/üçüncüPass.visible = true
	$VBoxContainer/mail/mailOpened3/pass3.visible = true
	$VBoxContainer/mail/mailOpened3/mailOpenedClose3.visible = true
	

func _on_mail_opened_4_pressed() -> void:
	$"VBoxContainer/mail/mailOpened4/dördüncüPass".visible = true
	$VBoxContainer/mail/mailOpened4/pass4.visible = true
	$VBoxContainer/mail/mailOpened4/mailOpenedClose4.visible = true
	
	

func _on_mail_opened_close_pressed() -> void:
	$VBoxContainer/mail/mailOpened/ilkPass.visible=false
	$VBoxContainer/mail/mailOpened/pass.visible = false
	$VBoxContainer/mail/mailOpened/mailOpenedClose.visible = false


func _on_mail_opened_close_2_pressed() -> void:
	$VBoxContainer/mail/mailOpened2/ikinciPass.visible = false
	$VBoxContainer/mail/mailOpened2/pass2.visible = false
	$VBoxContainer/mail/mailOpened2/mailOpenedClose2.visible = false



func _on_mail_opened_close_3_pressed() -> void:
	$VBoxContainer/mail/mailOpened3/üçüncüPass.visible = false
	$VBoxContainer/mail/mailOpened3/pass3.visible = false
	$VBoxContainer/mail/mailOpened3/mailOpenedClose3.visible = false


func _on_mail_opened_close_4_pressed() -> void:
	$"VBoxContainer/mail/mailOpened4/dördüncüPass".visible = false
	$VBoxContainer/mail/mailOpened4/pass4.visible = false
	$VBoxContainer/mail/mailOpened4/mailOpenedClose4.visible = false
	
func _on_padlock_app_pressed() -> void:
	$PanelContainer.visible = true
	$TextEdit.visible = true
	$closePadlock.visible = true
	$padlockApp/openPadlockAnim.play("openPadlock")

func _on_close_padlock_pressed() -> void:
	$PanelContainer.visible = false
	$TextEdit.visible = false
	$closePadlock.visible = false
	


func _on_text_edit_text_changed() -> void:
	if $TextEdit.text =="Dostum":
		$sleepScreen.visible=true
	elif $TextEdit.text =="dostum":
		$sleepScreen.visible=true


func _on_bar_mail_pressed() -> void:
	_on_mail_pressed()
		


func _on_windows_pressed() -> void:
	pass
