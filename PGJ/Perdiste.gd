extends Control


func set_idioma_escena()-> void:
	TranslationServer.set_locale(Globales.idioma)
	$Panel/VBoxContainer/HBoxContainer5/PerdisteTitulo.text = tr("PerdisteTitulo")
	
	#$Panel/VBoxContainer/PerdisteParrafo.text = tr("PerdisteParrafo")
	$Panel/VBoxContainer/PerdisteParrafo.text = tr("PerdisteP1")
	$Panel/VBoxContainer/PerdisteParrafo2.text = tr("PerdisteP2")
	#$Panel/VBoxContainer/PerdisteParrafo3.text = tr("PerdisteP3")
	
	$botones/BotonVolver2.text = tr("VolverMenu")
	$botones/VolverJugar.text = tr("VolverAIntentar")
func _ready():
	set_idioma_escena()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_boton_volver_pressed():
	var packed = load("res://Scenes/UIInicio.tscn")
	#get_tree().change_scene_to_file("res://Scenes/UIInicio.tscn")
	get_tree().change_scene_to_packed(packed)
	pass # Replace with f



func _on_volver_jugar_pressed():
	var packed = load("res://Scenes/Game.tscn")
	#get_tree().change_scene_to_file("res://Scenes/UIInicio.tscn")
	get_tree().change_scene_to_packed(packed)
	pass # Replace with function body.
