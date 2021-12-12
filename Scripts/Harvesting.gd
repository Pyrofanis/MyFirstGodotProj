extends Node2D



#applesRandomPositioningEdges
export var initialPos:Vector2=Vector2.ZERO
export var finalPos:Vector2=Vector2.ZERO

func Harvest():
	var horizontalPos:float=rand_range(initialPos.x,finalPos.x)
	var verticalPos:float=rand_range(initialPos.y,finalPos.y)
	position=Vector2(horizontalPos,verticalPos).clamped((finalPos-initialPos).length())

func _draw():
	var rect:Rect2 
	draw_rect(rect,Color.aqua,true,finalPos.x-initialPos.x,true)
