extends Node
class_name Main

@export var world_3d : Node3D
@export var world_2d : Node2D
@export var world_gui : Control

var current_3d_scene
var current_2d_scene
var current_gui_scene

## Using "names" as keys, provides easy access to each 3D scene's UID path.
var area_db : AreaDatabase = preload("res://tools/area_db.tres")
var area_info_db : AreaInfoDatabase = preload("res://tools/area_info_db.tres")
var enemy_db : EnemyDatabase = preload("res://tools/enemy_db.tres")

func _ready() -> void:
	Globals.main = self # Allows this node to be referenced from anywhere.
	
	current_3d_scene = Globals.DEFAULT_OVERWORLD.instantiate() # Load the default scene and start the cutscene.
	$World3D.add_child(current_3d_scene)
	Dialogic.start("cut_placeholder")

###### Dunno if this actually helps with load times; revisit this later.
### Whenever a new level enters the tree, read from the "areaConnections" list to search the area_db and find UIDs.
### Use the UIDs to preemptively load the adjacent areas, then store them as "area_name":PackedScene pairs.
#func preload_connections(area_info : AreaInfo):
	#loaded_areas.clear()
	#for area in area_info.areaConnections:
		#loaded_areas[area] = load(area_db.area[area])
	#print("areaConnections preloaded.")


func change_3d_scene(new_scene: String, to_delete: bool = true, to_keep_running: bool = false):
	## Logic for storing the "old" scene.
	if current_3d_scene != null:
		if to_delete:
			current_3d_scene.queue_free() # Completely frees the node from memory.
		elif to_keep_running:
			current_3d_scene.visible = false # Keeps the scene in memory and running.
		else:
			current_3d_scene.remove_child(current_3d_scene) # Keeps in memory, but removes the node.
	
	var new_scene_path = area_db.area[new_scene] # Grabs the new_scene's UID path from the area_db.
	var area_info = load(area_info_db.area_info[new_scene]) # Loads the new_scene's area_info resource.
	
	## Loads & instantiates the 3D scene from the UID/file path...
	var new = load(new_scene_path).instantiate()
	new.area_info = area_info # ... passes the resource info to the instance...
	world_3d.add_child(new) # ... before finally adding the node to the tree.
	current_3d_scene = new


func change_2d_scene(new_scene: String, to_delete: bool = true, to_keep_running: bool = false):
	## Logic for storing the "old" scene.
	if current_2d_scene != null:
		if to_delete:
			current_2d_scene.queue_free() # Completely frees the node from memory.
		elif to_keep_running:
			current_2d_scene.visible = false # Keeps the scene in memory and running.
		else:
			current_2d_scene.remove_child(current_2d_scene) # Keeps in memory, but removes the node.
	
	## Loads & instantiates a scene from a UID/file path, then adds it to the tree as a child of the Main/World2D node.
	var new = load(new_scene).instantiate()
	world_2d.add_child(new)
	current_2d_scene = new


func change_gui_scene(new_scene: String, to_delete: bool = true, to_keep_running: bool = false):
	## Logic for storing the "old" scene.
	if current_gui_scene != null:
		if to_delete:
			current_gui_scene.queue_free() # Completely frees the node from memory.
		elif to_keep_running:
			current_gui_scene.visible = false # Keeps the scene in memory and running.
		else:
			current_gui_scene.remove_child(current_gui_scene) # Keeps in memory, but removes the node.
	
	## Loads & instantiates a scene from a UID/file path, then adds it to the tree as a child of the Main/WorldGUI node.
	var new = load(new_scene).instantiate()
	world_gui.add_child(new)
	current_gui_scene = new
