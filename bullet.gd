extends Node3D

@export var speed: int = 20;


func _physics_process(delta: float) -> void:
	var forward_direction = global_transform.basis.z.normalized();
	global_translate(forward_direction * speed * delta)
