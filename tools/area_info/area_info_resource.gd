extends Resource
class_name AreaInfo

## Major zone changes will usually pass all of these variables.
## Area changes within a zone will usually only pass "enemyList" and "areaConnections".
# "enemyList" is handled by the area's spawner nodes.
# "areaConnections" is handled by the Navigatior singleton.

@export var musicOverworld : AudioStreamMP3
@export var musicBattle : AudioStreamMP3
@export var enemyList : Array[String]
@export var fieldTextureRound : CompressedTexture2D
@export var fieldTextureRect : CompressedTexture2D
@export var areaConnections : Array[String]
