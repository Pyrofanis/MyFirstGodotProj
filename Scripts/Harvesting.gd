extends Node2D



#applesRandomPositioningEdges
export var initialPos:Vector2=Vector2.ZERO
export var finalPos:Vector2=Vector2.ZERO

func _ready(): 
	Rect2 rectangle()
	draw_rect(rectangle,Color.aliceblue,true,finalPos-initialPos,false)

func Harvest():
	var horizontalPos:float=rand_range(initialPos.x,finalPos.x)
	var verticalPos:float=rand_range(initialPos.y,finalPos.y)
	position=Vector2(horizontalPos,verticalPos).clamped((finalPos-initialPos).length())


func _on_PlayerDetector_area_entered(_area):
	Harvest()
