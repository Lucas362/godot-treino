extends Node

var savegame = File.new() #file
var save_path = "res://savegame.save" #place of the file
var save_data = {"highscore": 0} #variable to store data

var bomba_resource
var moeda_resource
var queijo_resource

var pontuacao = 0
var saude = 3
var high = 0

var high_label

func _ready():
	get_tree().set_pause(false)
	bomba_resource = load("res://cenas/bomba.tscn")
	queijo_resource = load("res://cenas/queijo.tscn")
	moeda_resource = load("res://cenas/moeda.tscn")
	if not savegame.file_exists(save_path):
    	create_save()
	else:
		high = read_savegame()
	high_label = get_node("high")
	high_label.set("custom_colors/font_color", Color(1,0,0))
	high_label.set_text(str(high))

func _on_bomba_timer_timeout():
	var bomba = bomba_resource.instance()
	add_child(bomba)

func _on_moeda_timer_timeout():
	var moeda = moeda_resource.instance()
	add_child(moeda)

func _on_queijo_timer_timeout():
	var queijo = queijo_resource.instance()
	add_child(queijo)

func adiciona_pontos(pontos):
	pontuacao += pontos
	var pontos_label = get_node("pontos_label")
	pontos_label.set_text(str(pontuacao))
	if (high-pontuacao)<0 :
		high_label.set("custom_colors/font_color", Color(0,1,0))
	high_label.set_text(str(abs(high-pontuacao)))
	
func atualiza_saude(valor):
	saude += valor
	if saude > 3:
		saude = 3
	atualiza_life()
	verifica_fim_do_jogo()
	
func verifica_fim_do_jogo():
	if saude <= 0:
		if pontuacao > high :
			save(pontuacao)
		var popup = get_node("game_over_popup")
		popup.show()
		get_tree().set_pause(true)

func _on_reinicio_pressed():
	get_tree().set_pause(false)
	yield(get_tree(), "idle_frame")
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()


func _on_pause_2_pressed():
	var popup = get_node("pause")
	popup.show()
	get_tree().set_pause(true)


func _on_Button_pressed():
	get_tree().change_scene("res://cenas/Main Menu.tscn")


func _on_continue_pressed():
	var popup = get_node("pause")
	popup.hide()
	get_tree().set_pause(false)

func atualiza_life():
	var c1 = get_node("TextureFrame")
	var c2 = get_node("TextureFrame2")
	var c3 = get_node("TextureFrame3")
	if(saude<2):
		c2.set_modulate(Color(0.0, 0.0, 0.0, 0.65))
	else:
		c2.set_modulate(Color(1.0, 1.0, 1.0, 1.0))
	if(saude<3):
		c3.set_modulate(Color(0.0, 0.0, 0.0, 0.65))
	else:
		c3.set_modulate(Color(1.0, 1.0, 1.0, 1.0))


func create_save():
   savegame.open(save_path, File.WRITE)
   savegame.store_var(save_data)
   savegame.close()


func save(high_score):    
   save_data["highscore"] = pontuacao #data to save
   savegame.open(save_path, File.WRITE) #open file to write
   savegame.store_var(save_data) #store the data
   savegame.close() # close the file


func read_savegame():
   savegame.open(save_path, File.READ) #open the file
   save_data = savegame.get_var() #get the value
   savegame.close() #close the file
   return save_data["highscore"] #return the value