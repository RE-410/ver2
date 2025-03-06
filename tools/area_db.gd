extends Resource
class_name AreaDatabase

## Format is "area_name": "scene_UID"
# - Use text_to_id( has_id( "string" )) to test the validity of the UID.
@export var area : Dictionary[String, String]
