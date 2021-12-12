extends Node2D

export var score:int=0

export var initialPos:Vector2=Vector2.ZERO
export var finalPos:Vector2=Vector2.ZERO


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2DColisionDetection_area_entered(area):
	score+=1
	print(score)
