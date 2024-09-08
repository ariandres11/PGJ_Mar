extends Control

func set_idioma_escena()-> void:
	TranslationServer.set_locale(Globales.idioma)
	$BotonVolver.text = tr("BotonVolverAMenu")
	$Panel/VBoxContainer/HBoxContainer5/Creditos.text = tr("BotonCreditos")
	$Panel/VBoxContainer/HBoxContainer/Diseñador.text = tr("DiseñadorUI")
	$Panel/VBoxContainer/HBoxContainer2/Programador.text = tr("Programador")
	$Panel/VBoxContainer/HBoxContainer3/Modelado.text = tr("Modelado3D")
	

# Called when the node enters the scene tree for the first time.
func _ready():
	set_idioma_escena()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_boton_volver_pressed():
	#Volver al menu principal
	var packed = load("res://Scenes/UIInicio.tscn")
	#get_tree().change_scene_to_file("res://Scenes/UIInicio.tscn")
	get_tree().change_scene_to_packed(packed)
	pass # Replace with function body.

#
