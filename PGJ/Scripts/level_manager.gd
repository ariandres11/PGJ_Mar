extends Node

@export var piojo: Piojo
@export var control:Control

var corriente: Vector3 = Vector3.ZERO
var agarre = 0
var progress_bar = null
var tiempo = 0
var podes_perder = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar = control.get_node("ProgressBar") as ProgressBar
	$PoderPerderTimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	tiempo += delta
	if tiempo >= 2.0:
		tiempo = 0.0
		if piojo.grab_power > 0:
			agarre += pow(piojo.grab_power, 2) * 0.4
		else:
			agarre -= pow(4 - piojo.grab_power, 2) * 0.4 # Disminuye el agarre si no estás agarrado
		agarre = clamp(agarre, 0, 100)  
		progress_bar.update_agarre(agarre)
	
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
	
