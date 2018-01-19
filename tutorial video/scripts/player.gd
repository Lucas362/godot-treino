extends KinematicBody2D

var speed = 100

var animacao

func _ready():
	set_fixed_process(true)
	animacao = get_node("sprite_animado")

func _fixed_process(delta):
	
	if Input.is_action_pressed("direita"):
		move(Vector2(speed, 0) * delta)
		set_scale(Vector2(1, 1))
		animacao.play("andando")
		
	elif Input.is_action_pressed("esquerda"):
		move(Vector2(-speed, 0) * delta)
		set_scale(Vector2(-1, 1))
		animacao.play("andando")
		
	else:
		animacao.play("parado")