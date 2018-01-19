extends "res://scripts/item.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_queijo_body_enter( body ):
	var pai = get_parent()
	pai.atualiza_saude(1)
	self.queue_free()
