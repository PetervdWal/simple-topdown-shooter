extends Node3D

var ray_origin = Vector3()
var ray_target = Vector3()


func _physics_process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position();
	print("mouse_position", mouse_position)
	
	ray_origin = $Camera3D.project_ray_origin(mouse_position);
	ray_target = ray_origin + $Camera3D.project_ray_normal(mouse_position) * 100000;
	var space_state = get_world_3d().direct_space_state ;
	var query = PhysicsRayQueryParameters3D.create(ray_origin, ray_target)	#query.collide_with_areas = true;
	var result = space_state.intersect_ray(query);

	if not result.is_empty():
		print('Not empty', result.position)
		$Player.look_at(result.position, Vector3.UP);
		
