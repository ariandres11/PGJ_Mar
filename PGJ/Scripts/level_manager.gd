extends Node

@export var piojo: Piojo

var corriente: Vector3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Condiciones de perder
	# Soltaste las 4 patitas
	if piojo.grab_power == 0:
		game_over()
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
	# print("GAME OVER!")
	pass
	
func win(body: Node3D):
	print("YOU WIN!")
	pass
	
