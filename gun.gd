extends Node3D

@export var Bullet: PackedScene

@export var muzzle_speed = 30;
@export var millis_between_shots = 100;
@export var rate_of_fire_timer: Timer;
var can_shoot = true;

func _ready() -> void:
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
