extends Node2D

export var score:int=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function bo
				



func _on_AppleDetector_body_entered(_body):
	score+=1
	print(score)
func _on_AppleDetector_body_exited(body):
	pass # Replace with function body.
