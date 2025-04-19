extends Node3D

@export var speed: int = 20;

@onready var rate_of_fire_timer = $Timer;
var can_shoot = true;

const KILL_TIME = 2;
var timer = 0;


func _physics_process(delta: float) -> void:
	var forward_direction = global_transform.basis.z.normalized();
	global_translate(forward_direction * speed * delta)
	timer += delta;
	if timer >= KILL_TIME:
		queue_free();	can_shoot = false;
