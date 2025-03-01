extends Node
var overworld
var roundfield
var rectfield

func _ready() -> void:
	overworld = Globals.Overworld.instantiate()
	roundfield = Globals.RoundField.instantiate()
	rectfield = Globals.RectField.instantiate()
	
	add_child(overworld)
	Dialogic.start("cut_placeholder")
