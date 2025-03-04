@tool
extends Resource
class_name EnemyDatabase

## Each enemy is a dictionary, with the paths to their model and overworld behavior stored as individual keys.

##Enemy model scenes.
@export var enemy: Dictionary[String, PackedScene]

var parameters: Dictionary = {
	"model": PackedScene
}

var database := {
	"Rock Lobster" : {
		"model" : Rock_Lobster,
		"behavior" : Basic_roaming
	}
}
