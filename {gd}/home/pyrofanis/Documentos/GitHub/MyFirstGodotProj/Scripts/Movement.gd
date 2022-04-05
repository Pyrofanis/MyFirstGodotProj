extends KinematicBody2D 


export  var speed =200
var initialspeed=0
export var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	initialspeed=speed
    monitorable=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_getVelcoty()
	_run()
	move_and_collide(velocity*speed*delta)
	set_global_rotation(velocity.angle())
	pass
	
func _getVelcoty():
	velocity.x=Input.get_axis("Left","Right")
	velocity.y=Input.get_axis("Up","Down")

func _run():
    if (Input.get("Sprint")):
        speed=initialspeed+0.2*initialspeed
    else :
        speed=initialspeed