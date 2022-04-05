extends KinematicBody2D

export var coli_name=""
export var places=[Vector3.ZERO,Vector3.ZERO]
export var score=0

var new_pos=Vector3.ZERO
func _process(delta):
	if (coli_name!=null&&coli_name.to_lower()=="fox"):
		when_to_act()
		add_score_and_reset()
	pass

func _calculate_new_pos(locs:Array):
	var x =rand_range(locs[0].x,locs[1].x)
	var y=rand_range(locs[0].x,locs[1].y)
	new_pos=Vector2(x,y)
	pass
func when_to_act():
	_calculate_new_pos(places)
	change_position(new_pos)
	pass
func add_score_and_reset():
	score+=1
	coli_name=null
	print(coli_name,score)
	pass

func change_position(loc:Vector2):
	position=loc
	print($Area2D.position)
	pass
