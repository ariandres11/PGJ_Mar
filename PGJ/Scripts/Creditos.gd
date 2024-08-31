extends Control

func set_idioma_escena()-> void:
	TranslationServer.set_locale(Globales.idioma)
	$BotonVolver.text = tr("BotonVolver")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_idioma_escena()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_boton_volver_pressed():
	#Volver al menu principal
	get_tree().change_scene_to_file("res://Scenes/UIInicio.tscn")
	pass # Replace with function body.
