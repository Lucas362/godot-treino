extends Area2D

var speed
var velocidade_max = 200
var velocidade_min = 100

var limite_esquerda
var limite_direita

var largura_tela = Globals.get("display/width")
var altura_tela = Globals.get("display/height")

var altura_frame

func _ready():
	randomize()
	speed = rand_range(velocidade_min, velocidade_max)
	set_fixed_process(true)
	
	limite_esquerda = get_largura_frame()/2
	limite_direita = largura_tela - get_largura_frame()/2
	
	var x_aleatorio = rand_range(limite_esquerda, limite_direita)
	set_pos(Vector2(x_aleatorio, -32))
	
	altura_frame = get_altura_frame()

func _fixed_process(delta):
	translate(Vector2(0, speed) * delta)
	if (get_pos().y - altura_frame/2 > altura_tela):
		self.queue_free()

func get_largura_frame():
	var anim = get_node("sprite_animado").get_sprite_frames()
	var frame = anim.get_frame("padrao", 0)
	return frame.get_width()
	
func get_altura_frame():
	var anim = get_node("sprite_animado").get_sprite_frames()
	var frame = anim.get_frame("padrao", 0)
	return frame.get_height()