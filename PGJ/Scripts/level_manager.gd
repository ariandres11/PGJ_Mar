extends Node

@export var piojo: Piojo
@export var control:Control

var corriente: Vector3 = Vector3.ZERO
var agarre = 0
var progress_bar = null
var tiempo = 0
var podes_perder = false
var style_box_verde = StyleBoxFlat.new()
var style_box_rojo = StyleBoxFlat.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar = control.get_node("ProgressBar") as ProgressBar
	$PoderPerderTimer.start()
	
		
	#Style verde
	style_box_verde.bg_color = Color(0.2, 1, 0.2)  # Verde suave
	style_box_verde.corner_radius_top_left = 30
	style_box_verde.corner_radius_top_right = 30
	style_box_verde.corner_radius_bottom_left = 30
	style_box_verde.corner_radius_bottom_right = 30
	style_box_verde.border_color = Color(0.2, 0.588, 0.604)
	
	style_box_verde.border_width_left = 10
	style_box_verde.border_width_bottom = 10
	style_box_verde.border_width_top = 10
	style_box_verde.border_width_right = 10
	
	#Style rojo
	style_box_rojo.bg_color = Color(1, 0.2, 0.2)  # Rojo suave
	style_box_rojo.corner_radius_top_left = 30
	style_box_rojo.corner_radius_top_right = 30
	style_box_rojo.corner_radius_bottom_left = 30
	style_box_rojo.corner_radius_bottom_right = 30
	style_box_rojo.border_color = Color(0.2, 0.588, 0.604)
	
	style_box_rojo.border_width_left = 10
	style_box_rojo.border_width_bottom = 10
	style_box_rojo.border_width_top = 10
	style_box_rojo.border_width_right = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	
	progress_bar.modulate = Color(1,1,1)
	tiempo += delta
	if tiempo >= 1.0:
		tiempo = 0.0
		if piojo.grab_power > 0:
			agarre += pow(piojo.grab_power, 2) * 0.6
		else:
			agarre -= pow(4 + piojo.grab_power, 2) * 1 # Disminuye el agarre si no estás agarrado
		agarre = clamp(agarre, 0, 100)  
		progress_bar.update_agarre(agarre)
	if(progress_bar.value >= 70):
		progress_bar.add_theme_stylebox_override("fill", style_box_verde)
		#progress_bar.modulate = Color(0,1,0)
	else:
		progress_bar.add_theme_stylebox_override("fill", style_box_rojo)
			

	
	# Condiciones de perder
	# Soltaste las 4 patitas
	if (progress_bar.value == 0 && podes_perder):
		game_over()
	#if piojo.grab_power == 0:
	#game_over()
	# Se consumió la barra de stamina
	
	var f = corriente * (5.0 - piojo.grab_power)
	f = f.rotated(Vector3.FORWARD, randf() * 0.3)
	
	piojo.move(f * delta)


func sumergirse() -> void:
	corriente = (Vector3.LEFT * 0.5).rotated(Vector3.FORWARD, randf() * TAU)
	print("DIVE!")
	Input.start_joy_vibration(0, 1, 1)
	
	$EmergerTimer.start()

func emerger() -> void:
	print("Emerger!")
	corriente = Vector3.ZERO
	
	Input.stop_joy_vibration(0)
	
	$SumergirseTimer.start()


func game_over():
	print("GAME OVER!")
	Input.stop_joy_vibration(0)
	call_deferred("game_over_scene")
	pass
	
func win(body: Node3D):
	print("YOU WIN!")
	Input.stop_joy_vibration(0)
	call_deferred("win_scene") 
	pass
	
func win_scene():
	get_tree().change_scene_to_file("res://Scenes/UIFin.tscn")
	
func game_over_scene():
	get_tree().change_scene_to_file("res://Scenes/Perdiste.tscn")
	
func _on_poder_perder_timer_timeout():
	podes_perder = true
	pass # Replace with function body.
	
