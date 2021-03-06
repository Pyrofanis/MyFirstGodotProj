extends KinematicBody2D 


export  var speed :=200
var initialspeed :=0
var velocity := Vector2()
export var timer:=0
var timerCountDown=0
export var duriation:=0
var duriationCountdown=0
var speedTriggered:=false

var is_dead:=false
var in_leaves=false

# Called when the node enters the scene tree for the first time.
func _ready():
	initialspeed=speed
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_dead:
		_general_Process(delta)
	pass

func _general_Process(delta):
	_getVelcoty()
	_run_Countdown(delta)
	movement(delta)

func movement(delta):
	move_and_collide(velocity*speed*delta)
	if velocity!=Vector2.ZERO:
		set_global_rotation(velocity.angle())
	pass

func _getVelcoty():
	velocity.x=Input.get_axis("Left","Right")
	velocity.y=Input.get_axis("Up","Down")

func _run_Countdown(delta):
	timerCountDown+=delta
	if timerCountDown>=timer:
		_run_With_Timer(delta)

func _run_With_Timer(delta):
	if duriation>=duriationCountdown:
		_run(delta)

func _run(delta):
	if Input.is_action_pressed("Sprint")||speedTriggered:
		
		speedTriggered=true
		speed=4*initialspeed
		duriationCountdown+=delta
		
	if duriation<=duriationCountdown:
		_reset_CountDowns()
		_reset_Speed()

func _reset_CountDowns():
	duriationCountdown=0
	timerCountDown=0
	pass
func _reset_Speed():
	speed=initialspeed
	speedTriggered=false

func _die():
	is_dead=true
	pass
func _immortal():
	in_leaves=true
func _mortal():
	in_leaves=false
	
func _on_foxs_Area_area_entered(area):
	if "Death" in area.name &&! in_leaves:
		_die()
	if "Leaves" in area.name || "Bush" in area.name:
		_immortal()
	pass # Replace with function body.


func _on_foxs_Area_area_exited(area):
	if "Leaves" in area.name || "Bush" in area.name:
		_mortal()
	pass # Replace with function body.
