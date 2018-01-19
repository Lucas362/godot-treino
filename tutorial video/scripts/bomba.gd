extends "res://scripts/item.gd"



func _ready():
	pass


func _on_bomba_body_enter( body ):
	var pai = get_parent()
	pai.atualiza_saude(-1)
	self.queue_free()
