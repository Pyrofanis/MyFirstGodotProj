extends Area2D

export var places=Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


func _on_Area2D_area_entered(area:Area2D):
	get_parent().coli_name=area.get_parent().get_parent().name
	pass # Replace with function body.
