extends KinematicBody2D 


export  var speed =200
export var velocity = Vector2()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_getVelcoty()
	move_and_collide(velocity*speed)
	set_global_rotation(velocity.angle())
	pass
func _getVelcoty():
	velocity.x=Input.get_axis("Left","Right")
	velocity.y=Input.get_axis("Up","Down")

