extends CharacterBody3D

var speed := 5;


func _process(delta: float) -> void:
	velocity = Vector3();
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1;
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1;
	if Input.is_action_pressed("ui_down"):
		velocity.z += 1;
	if Input.is_action_pressed("ui_up"):
		velocity.z -= 1;
		
	velocity = velocity.normalized() * speed
	move_and_slide();


 
