extends KinematicBody2D

export var speed:float=10000

var initialSpeed:float=0

var direction:Vector2=Vector2.ZERO

func _ready():
	Initializer()
func _process(delta):
	Sprint()
	RotationApplier()
	Movement(delta)	
func Initializer():
	initialSpeed=speed
func RotationApplier():
	rotation=direction.angle()
func Movement(delta):
	direction.x=Input.get_axis("Left","Right")
	direction.y=Input.get_axis("Up","Down")
	direction=move_and_slide(direction*speed*delta)
func Sprint():
	if Input.is_action_pressed(("Sprint")):
		speed=2*initialSpeed
	else :
		speed=initialSpeed
