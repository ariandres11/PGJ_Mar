extends Node3D
class_name PiojoPlayer

@onready var ik_df: SkeletonIK3D = $Armature/Skeleton3D/PataDF
@onready var ik_db: SkeletonIK3D = $Armature/Skeleton3D/PataDB
@onready var ik_if: SkeletonIK3D = $Armature/Skeleton3D/PataIF
@onready var ik_ib: SkeletonIK3D = $Armature/Skeleton3D/PataIB

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ik_df.start()
	ik_db.start()
	ik_if.start()
	ik_ib.start()


func get_target(pata: String) -> Node3D:
	return get_node("Target"+pata)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
