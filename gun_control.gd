extends Node

@export var StartingWeapon: PackedScene;
var hand : Node3D;
var equiped_weapon: Node3D


func _ready() -> void:
	hand = get_parent().find_child("Right Hand");
	if(StartingWeapon):
		var weaponInstance = StartingWeapon.instantiate();
		equip_weapon(weaponInstance)
		
		


func equip_weapon(weapon_to_equip: Node):
	if equiped_weapon:
		print("Deleting current weapon");
		equiped_weapon.queue_free()
	else:
		print("No equipped weapon detected")
		print(weapon_to_equip);
		equiped_weapon = weapon_to_equip
		print(equiped_weapon);
		hand.add_child(equiped_weapon); 
		print(hand.get_child_count());
