extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed=	100
var velocity=Vector2()
var playerTransform=Transform2D()

var horizontalDir=0
var verticalDir=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func Movement(delta):

	horizontalDir=0
	verticalDir=0
	
	if Input.is_action_pressed("Left"):
		 horizontalDir= Vector2.LEFT.x
	if Input.is_action_pressed("Right"):
		 horizontalDir=-Vector2.LEFT.x
	if Input.is_action_pressed("Down"):
		 verticalDir=-Vector2.UP.y
	if  Input.is_action_pressed("Up"):
		 verticalDir=Vector2.UP.y
	
	velocity=Vector2(horizontalDir,verticalDir)
		
	position +=velocity.normalized()*speed*delta
	
func Rotation():
	rotation=velocity.angle()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):	
	Movement(delta)
	Rotation()
	velocity=move_and_slide((velocity))
#	print (velocity)
	print(rad2deg( rotation),"Deg")
	print(velocity," velocity")
