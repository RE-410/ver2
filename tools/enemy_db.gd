extends Resource
class_name EnemyDatabase

## Assigns each "Enemy" their models and overworld behaviors.

var database := {
	"Rock Lobster" : {
		"model_path" : "res://assets/enemies/Lobster/rock_lobster_model.tscn",
		"behavior" : "res://assets/enemies/_behaviors/basic_chase_behavior.tscn"
	}
}
