extends Area2D

var coli_name
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	if (coli_name!=null && coli_name.to_lower()=="playerArea2d"):
		print("test")
	pass

func _on_Area2D_body_entered(body):
	print("piani")
	# coli_name=body.get_node_name()
	pass # Replace with function body.
