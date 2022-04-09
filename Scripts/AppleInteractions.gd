extends Area2D

var coli_name=""

var initial_Pos=Vector2.ZERO
var current_pos=Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	initial_Pos=global_position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_area_entered(area:Area2D):
	on_item_detection(area)
	pass # Replace with function body.

func on_item_detection(body:Area2D):
	_detect_item(body)
	if coli_name.to_lower()=="fox":
		_calc_new_post()

func _detect_item(body:Area2D):
	coli_name=body.get_parent().get_parent().name
func _calc_new_post():
	
	var new_Pos=Vector2.ZERO
	var new_pos_x
	var new_pos_y

	new_pos_x=rand_range(-initial_Pos.x,initial_Pos.x)
	new_pos_y=rand_range(-initial_Pos.y,initial_Pos.y)
	new_Pos=Vector2(new_pos_x,new_pos_y)

	_set_new_pos(new_Pos)

func _set_new_pos(new_Pos:Vector2):
	global_position=new_Pos
