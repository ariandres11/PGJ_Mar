extends Node3D
class_name PataController

@export var move_input: String = "button"
@export var grab_input: String = "button"

@export var max_length: float = 0.5
@export var max_move: float = 0.5

@export var axis: Vector2 = Vector2.ONE

@onready var target: Node3D
@onready var pinza: Node3D

var is_grabbed: bool = true
var anchor_point: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#anchor_point = pinza.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Restingir longitud de las patas
	var l = pinza.global_position - global_position
	if l.length() > max_length:
		# print("Longitus de pata: ", l.length(), "(",name,")")
		pinza.global_position = global_position + l.limit_length(max_length)
	# 
	
	is_grabbed = Input.is_action_pressed(grab_input)
	
	# Patita agarrada, fija en el espacio
	if is_grabbed:
		anchor_point = pinza.global_position
		# pinza.scale = Vector3.ONE * 0.8
		return
	
	# Patita suelta, se puede mover
	# pinza.scale = Vector3.ONE
	
	var move = Vector3(
		Input.get_axis(move_input + "left",move_input + "right"),
		Input.get_axis(move_input + "down",move_input + "up"),
		0
	)
	
	target.position = ((Vector3(axis.x,axis.y,0) + move) * 0.5 * max_length).limit_length(max_length)
	
	
	# TODO: Hace animación de tween entre el target y la pata

func grab_position() -> Vector3:
	return anchor_point

func keep_anchored() -> void:
	if is_grabbed:
		pinza.global_position = anchor_point
