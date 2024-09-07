extends Control


func set_idioma_escena()-> void:
	TranslationServer.set_locale(Globales.idioma)
	$VolverMenu.text = tr("VolverMenu")
	if(Globales.idioma) == "eng":
		$VBoxContainer/TextureRect.texture = 	load("res://Iconos/teclado_ingles.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_idioma_escena()
	#Obtener todos los timers
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_volver_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/UIInicio.tscn")
	pass # Replace with function body.
