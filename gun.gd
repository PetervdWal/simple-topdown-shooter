extends Node3D

@export var Bullet: PackedScene

@export var muzzle_speed = 30;
@export var millis_between_shots = 100;


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	shoot();
	
func shoot():
	var new_bullet = Bullet.instantiate();
	new_bullet.global_transform = $Muzzle.global_transform;
	var sceneRoot = get_tree().root.get_child(0);
	sceneRoot.add_child(new_bullet);
