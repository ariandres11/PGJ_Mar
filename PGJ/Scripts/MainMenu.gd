extends Control

func _ready():
	TranslationServer.set_locale(Globales.idioma)
	set_idioma_escena()
	
func set_idioma_escena()-> void:
	$BotonesPrincipales/BotonJugar.text = tr("BotonJugar")
	$BotonesPrincipales/BotonCreditos.text = tr("BotonCreditos")
	$BotonesPrincipales/BotonSalir.text = tr("BotonSalir")
	$BotonControles.text = tr("Controles")
	
#Español
func _on_boton_español_pressed():

	Globales.set_idioma("esp")
	TranslationServer.set_locale(Globales.idioma)
	set_idioma_escena()
	pass # Replace with function body.


#Ingles
func _on_boton_ingles_pressed():
	#Setear ingles
	Globales.set_idioma("eng")
	TranslationServer.set_locale(Globales.idioma)
	set_idioma_escena()
	pass # Replace with function body.

func _on_boton_jugar_pressed():
	var packed_scene = preload("res://Scenes/Intro.tscn")
	get_tree().change_scene_to_packed(packed_scene)
	
func _on_boton_salir_pressed():
	#Cerrar ventana
	get_tree().quit()

func _on_boton_creditos_pressed():
	var packed_scene = preload("res://Scenes/Creditos.tscn")
	get_tree().change_scene_to_packed(packed_scene)
	pass # Replace with function body.


func _on_boton_controles_pressed():
	var packed_scene = load("res://Scenes/Controles.tscn")
	get_tree().change_scene_to_packed(packed_scene)
	pass # Replace with function body.
