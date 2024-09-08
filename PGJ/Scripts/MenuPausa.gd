extends Control

func set_idioma_escena()-> void:
	TranslationServer.set_locale(Globales.idioma)
	$Panel/BotonesPrincipales/BotonReiniciar.text = tr("BotonReiniciar")
	$Panel/BotonesPrincipales/BotonSalir.text = tr("BotonSalir")
	$Panel/Titulo.text = tr("Pausa")
	$ZonaSeguraTexto.text = tr("SeguroMoverte")
	$Agarre.text = tr("Agarre")
	#Efectos
	$EfectoCayendo/Cayendo3.text = tr("Cayendo")
	$EfectoCayendo/Cayendo2.text = tr("Cayendo")
	$EfectoCayendo/Cayendo.text = tr("Cayendo")
	
	$EfectoSumergiendo/Cayendo3.text = tr("Cayendo")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_idioma_escena()

func _process(delta):
	pass

func _on_boton_pausa_pressed():
	var panel = $Panel
	panel.visible = not panel.visible
	#Mostrar menu pausa
	pass # Replace with function body.

func _on_boton_salir_pressed():
	#Cerrar ventana
	get_tree().change_scene_to_file("res://Scenes/UIInicio.tscn")

func _on_boton_reiniciar_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_boton_perder_pressed():
	get_tree().change_scene_to_file("res://Scenes/Perdiste.tscn")
	pass # Replace with function body.


func _on_boton_ganar_pressed():
	get_tree().change_scene_to_file("res://Scenes/UIFin.tscn")
	pass # Replace with function body.

	
