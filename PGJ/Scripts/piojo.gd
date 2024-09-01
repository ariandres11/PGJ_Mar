extends Node3D
class_name Piojo

@export var speed: float = 2.0

var grab_power: float = 0.0
var centroide := Vector3.ZERO

var patas

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	patas = $Patas.get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	grab_power = 0.0
	
	centroide = Vector3.ZERO
	
	for p in patas:
		if p.is_grabbed:
			grab_power += 1.0
			centroide += p.grab_position()
	
	if grab_power == 0: return
	
	centroide /= grab_power
	
	var move: Vector3 = centroide - global_position
	move(move * delta * speed)

func move(force: Vector3):
	global_position += force
	
	for p in patas:
		p.keep_anchored()
