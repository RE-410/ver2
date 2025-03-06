extends Area3D
class_name Door

@export var destination_level: String
@export var destination_door: String
enum direction {N,E,S,W}
@export var spawn_direction: direction = direction.S

@onready var spawn = $SpawnPoint

func _on_body_entered(body: CharacterBody3D) -> void:
	if body is Player:
		Navigator.destination_door = destination_door # Store the exit door...
		Globals.main.change_3d_scene(destination_level) # ... then change to the destination scene.
