@tool
extends Resource
class_name AreaInfo

## Major zone changes will usually pass all of these variables.
## Area changes within a zone will usually only pass "enemyList" and "areaConnections".
# "enemyList" is handled by the area's spawner nodes.
# "areaConnections" is handled by the Navigatior singleton.

var musicOverworld : AudioStreamMP3
var musicBattle : AudioStreamMP3
var enemyList : Array[String] = [] # "enemy_DB" dictionary keys.
var fieldTextureRound : CompressedTexture2D
var fieldTextureRect : CompressedTexture2D

var areaConnections : Array[PackedScene] =[]

func _get_property_list() -> Array:
	var properties: Array = []
	
	properties.append({
		"name": "musicOverworld",
		"type": TYPE_OBJECT,
		"usage": PROPERTY_USAGE_DEFAULT
	})
	properties.append({
		"name": "musicBattle",
		"type": TYPE_OBJECT,
		"usage": PROPERTY_USAGE_DEFAULT
	})
	properties.append({
		"name": "enemyList",
		"type": TYPE_ARRAY,
		"usage": PROPERTY_USAGE_DEFAULT,
		"hint": PROPERTY_HINT_TYPE_STRING,
		"hint_string": "%d:" % [TYPE_STRING]
	})
	properties.append({
		"name": "fieldTextureRound",
		"type": TYPE_OBJECT,
		"usage": PROPERTY_USAGE_DEFAULT
	})
	properties.append({
		"name": "fieldTextureRect",
		"type": TYPE_OBJECT,
		"usage": PROPERTY_USAGE_DEFAULT
	})
	properties.append({
		"name": "areaConnections",
		"type": TYPE_ARRAY,
		"usage": PROPERTY_USAGE_DEFAULT,
		"hint": PROPERTY_HINT_TYPE_STRING,
		"hint_string": "%d:" % [TYPE_OBJECT]
	})
	return properties
