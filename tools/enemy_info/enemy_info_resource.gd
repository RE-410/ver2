extends Resource
class_name EnemyInfo

enum shape {ROUND, RECT}

## Initial field parameters to be passed.
@export var fieldShape : shape
@export var fieldWidth : int # Max 12 on round fields.
@export var fieldDepth : int 
@export var fieldInnerBounds: int # For round fields, refers to distance from center point; for rect fields, refers to distance from rear.

## The actual "enemy info" part.
@export var enemyModel
