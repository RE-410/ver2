extends Node


var area_info : AreaInfo

var current_level : PackedScene
var destination_level : PackedScene

var spawn_door_tag




func go_to_level(destination_level, destination_door):
	if scene
