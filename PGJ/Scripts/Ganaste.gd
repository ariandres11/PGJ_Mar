extends Control


func set_idioma_escena()-> void:
	TranslationServer.set_locale(Globales.idioma)
	$VolverMenu.text = tr("VolverMenu")
	$Panel/VBoxContainer/HBoxContainer5/GanasteTitulo.text = tr("GanasteTitulo")
	#$Panel/VBoxContainer/GanasteTexto.text = tr("GanasteParrafo")
	$Panel/VBoxContainer/GanasteTexto.text = tr("GanasteP1")
	$Panel/VBoxContainer/GanasteTexto2.text = tr("GanasteP2")
	$Panel/VBoxContainer/GanasteTexto3.text = tr("GanasteP3")
	
	
func _ready():
	set_idioma_escena()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_volver_menu_pressed():
	var packed = load("res://Scenes/UIInicio.tscn")
	#get_tree().change_scene_to_file("res://Scenes/UIInicio.tscn")
	get_tree().change_scene_to_packed(packed)
	pass # Replace with function body.
