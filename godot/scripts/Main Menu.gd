extends Node2D

func _ready():
	pass

func _on_QUIT_pressed():
	var popup = get_node("quitPanel")
	popup.show()

func _on_PLAY_pressed():
	get_tree().change_scene("res://cenas/cena_principal.tscn")

func _on_yesButton_pressed():
	get_tree().quit()

func _on_noButton_pressed():
	var popup = get_node("quitPanel")
	popup.hide()
