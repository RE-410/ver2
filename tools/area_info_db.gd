extends Resource
class_name AreaInfoDatabase

## Format is "area_info_name": "scene_UID"
# - Use text_to_id( has_id( "string" )) to test the validity of the UID.
@export var area_info : Dictionary[String, String]
