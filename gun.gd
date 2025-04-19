extends Node3D

@onready var rate_of_fire_timer: Timer= $Timer;

@export var Bullet: PackedScene

@export var muzzle_speed = 30;
@export var millis_between_shots = 100.0;

var can_shoot = true;

func _ready() -> void:
	rate_of_fire_timer.wait_time = float(millis_between_shots / 1000.0);
	print("Updated rate_of_fire_wait_it", rate_of_fire_timer.wait_time)
	pass
	
func _process(delta: float) -> void:
	shoot();
	
func shoot():
	if can_shoot:
		var new_bullet = Bullet.instantiate();
		new_bullet.global_transform = $Muzzle.global_transform;
		new_bullet.speed =muzzle_speed;
		var sceneRoot = get_tree().root.get_child(0);
		sceneRoot.add_child(new_bullet);
		can_shoot = false;
		rate_of_fire_timer.start();


func _on_timer_timeout() -> void:
	can_shoot= true
