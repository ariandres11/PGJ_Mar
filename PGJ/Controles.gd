extends Control

var timer_1: Timer
var timer_2: Timer
var timer_3: Timer

func set_idioma_escena()-> void:
	TranslationServer.set_locale(Globales.idioma)
	$VolverMenu.text = tr("VolverMenu")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_idioma_escena()
	#Obtener todos los timers
	timer_1 = $Timer1
	timer_2 = $Timer2
	timer_3 = $Timer3
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	$VBoxContainer/TextureRect.texture = load("res://Iconos/teclado2.png")
	timer_2.start()
	pass # Replace with function body.


func _on_timer_2_timeout():
	$VBoxContainer/TextureRect.texture = load("res://Iconos/teclado3.png")
	timer_1.queue_free()
	timer_2.queue_free()
	pass # Replace with function body.




func _on_volver_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/UIInicio.tscn")
	pass # Replace with function body.
