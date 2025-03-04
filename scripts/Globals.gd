extends Node

## Stores the current overworld location in memory; should reduce hangtime when exiting battle.
## Stores the generic battlefields in memory; should allow for smooth transitions entering battle.
var Overworld : PackedScene = preload("res://scenes/overworld/testzone/testlevel_0.tscn") # On new game start, load into this scene.
var RoundField : PackedScene = preload("res://scenes/battle/round_field.tscn")
var RectField : PackedScene = preload("res://scenes/battle/rect_field.tscn")

## AreaInfo parameter storage.
var musicOverworld : AudioStreamMP3
var musicBattle : AudioStreamMP3
var enemyList : Array[String]
var fieldTextureRound : CompressedTexture2D
var fieldTextureRect : CompressedTexture2D
var areaConnections : Array[String]

var enemyScenes : Dictionary[String, PackedScene] 
var areaScenes : Dictionary[String, PackedScene]
var in_cutscene : bool = false

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)


func _on_dialogic_signal(argument: String):
	if argument == "enter_cutscene":
		in_cutscene = true
		print("'in_cutscene' = true")
	elif argument == "exit_cutscene":
		in_cutscene = false	
		print("'in_cutscene' = false")


func change_music(new_overworld : AudioStreamMP3, new_battle : AudioStreamMP3):
	## todo - Create code for transitioning between overworld music tracks.
	# Use 3 AudioStreamPlayers; "CurrentMusicPlayer", "NewMusicPlayer", and "BattleMusicPlayer".
	# (NewMusicPlayer and BattleMusicPlayer should start at -inf volume.)
	# On func call, assign the new music tracks to NewMusicPlayer and BattleMusicPlayer.
	# X-fade CurrentMusicPlayer with NewMusicPlayer, then rename the nodes.
	
	# Sets the new music tracks as the current tracks.
	musicOverworld = new_overworld
	musicBattle = new_battle
	pass

func change_enemyList(new_list : Array[String]):
	pass
