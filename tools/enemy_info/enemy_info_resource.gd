@tool
extends Resource
class_name EnemyInfo

enum shape {ROUND, RECT}

## Initial field parameters to be passed.
var fieldShape : shape
var fieldWidth : int # Max 12 on round fields.
var fieldDepth : int 
var fieldInnerBounds: int # For round fields, refers to distance from center point; for rect fields, refers to distance from rear.

## The actual "enemy info" part.
var enemyModelPath : String

func _get_property_list() -> Array:
	var properties: Array = []
	
	properties.append({
		"name": "fieldShape",
		"type": TYPE_INT,
		"usage": PROPERTY_USAGE_DEFAULT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": "Round,Rect"
	})
	properties.append({
		"name": "fieldWidth",
		"type": TYPE_INT,
		"usage": PROPERTY_USAGE_DEFAULT,
		"hint": PROPERTY_HINT_RANGE,
		"hint_string": "1,12,1,or greater" # range 1-12, increment 1; manual input can be greater.
	})
	properties.append({
		"name": "fieldDepth",
		"type": TYPE_INT,
		"usage": PROPERTY_USAGE_DEFAULT,
		"hint": PROPERTY_HINT_RANGE,
		"hint_string": "1,5,1,or greater" # range 1-5, increment 1; manual input can be greater.
	})
	properties.append({
		"name": "fieldInnerBounds",
		"type": TYPE_INT,
		"usage": PROPERTY_USAGE_DEFAULT
	})
	properties.append({
		"name": "enemyModelPath",
		"type": TYPE_STRING,
		"usage": PROPERTY_USAGE_DEFAULT
	})
	return properties
