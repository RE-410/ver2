extends Node3D

var tempo: float = 0.1 # PLACEHOLDER.
var anim_speed: float = tempo # todo - Establish a formula that increases animation speed with the tempo.

## Tracks player's grid coordinates.
#- Left/Right, Forward/Back; or ClockWise/CounterClockWise, In/Out (relative to rotation point)
var LR_pos: int
var FB_pos: int

## Player's facing direction. Only changes from specific boss signals.
# todo - Connect to enemy signal, and write code to change facing direction.
enum {N,E,S,W} # Cardinal directions.
var facing := N

var inner_bound: int
var outer_bound: int
var L_bound: int
var R_bound: int
var control_state: String #Use "set_controls()" instead.

func _input(event: InputEvent) -> void:
	match facing:
		N:
			#if event
			pass
			
		E: # !!! When you get around to writing the code for this part, remember to "rotate" the player inputs.
			pass
		S:
			pass
		W:
			pass
