extends Node3D

## This script should be attached to ALL level scenes.

@export var area_info : AreaInfo

## Passes info on the current area:
## - Music track (Overworld & Battle, if applicable)
## - List of enemies that spawn in the area
## - Current Roundfield & Rectfield textures
# - todo - Potentially add a PackedScene for decorative elements.
## - List of connected/adjacent areas

# 1. Check if the music has changed; if it has, transition to the new track.
# 2. Check list of spawnable enemies.
# 3. Check if the textures have changed; if they have, update them.
# - If a "decorative elements" scene is added, group it with this function.
# 4. Check list of "adjacent" areas; preload new scenes and remove any that are no longer being used.

func _ready() -> void:
	pass
	#set_Global_area_info(area_info)


func set_Global_area_info(new_info : AreaInfo):
	## If the parameters have changed, update them.
	# todo - These should handle null cases and be parsed into seperate functions.
	if Globals.musicOverworld != new_info.musicOverworld and new_info.musicOverworld: # Assumes that the battle music changes with the overworld music
		Globals.change_music(new_info.musicOverworld, new_info.musicBattle)
	
	if Globals.enemyList != new_info.enemyList: # todo - Not used yet.
		Globals.enemyList = new_info.enemyList
		
	if Globals.fieldTextureRound != new_info.fieldTextureRound: # todo - Not used yet.
		Globals.fieldTextureRound = new_info.fieldTextureRound
	if Globals.fieldTextureRect != new_info.fieldTextureRect:
		Globals.fieldTextureRect = new_info.fieldTextureRect


func spawn_player(destination_door: String):
	var door_path = "Doors/" + destination_door
	var door = get_node(door_path) as Door
