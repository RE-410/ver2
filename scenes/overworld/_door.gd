extends Area3D
class_name Door

@export var destination_level: String
@export var destination_door: String #There can be multiple doors per level, thus it is necessary to specify which one.

enum direction {N,E,S,W}
@export var spawn_direction: direction = direction.S

@onready var Spawn = $SpawnPoint

func _on_body_entered(body: Node3D) -> void:
	Navigator.go_to_level(destination_tag, door_tag)
