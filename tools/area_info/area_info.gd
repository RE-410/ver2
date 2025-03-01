extends Node3D

## This script should be attached to each level scene.

## Passes info on the current area:
## - Music track (Overworld & Battle, if applicable)
## - Array of enemy scenes (ie. what enemies spawn in the area)
## - Current Roundfield & Rectfield textures
# - todo - Potentially add a PackedScene for decorative elements.

# 1. Check if the music has changed; if it has, transition to the new track.
# - Have 2 audio buses: current track and upcoming track. Use to transition between zones or in/out of battle.
# 2. Check list of spawnable enemies; load new models to memory and remove any that are no longer being used.
# 3. Check if the textures have changed; if they have, update them.
# - If a "decorative elements" scene is added, group it with this function.
# 4. Check list of "adjacent" areas; preload new scenes and remove any that are no longer being used.

@export var area_info : AreaInfo

func set_global_area_info(new_info : AreaInfo):
	## If the parameters have changed, update them.
	# todo - These should handle null cases and be parsed into seperate functions.
	if Globals.musicOverworld != new_info.musicOverworld or Globals.musicBattle != new_info.musicBattle:
		Globals.musicOverworld = new_info.musicOverworld
		Globals.musicBattle = new_info.musicBattle
		
	if Globals.enemyList != new_info.enemyList:
		Globals.enemyList = new_info.enemyList
		
	if Globals.fieldTextureRound != new_info.fieldTextureRound:
		Globals.fieldTextureRound = new_info.fieldTextureRound
	if Globals.fieldTextureRect != new_info.fieldTextureRect:
		Globals.fieldTextureRect = new_info.fieldTextureRect
		
	if Globals.areaConnections != new_info.areaConnections:
		Globals.areaConnections = new_info.areaConnections


func _ready() -> void:
	set_global_area_info(area_info)
