extends Resource
class_name EnemyDatabase

## Format is "enemy_name": "scene_UID"
# - Use text_to_id( has_id( "string" )) to test the validity of the UID.
@export var enemy: Dictionary[String, String]
