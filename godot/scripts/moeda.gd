extends "res://scripts/item.gd"



func _ready():
	pass


func _on_moeda_body_enter( body ):
	var pai = get_parent()
	pai.adiciona_pontos(10)
	self.queue_free()
