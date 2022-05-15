extends KinematicBody2D

enum states{idle,walk,run }
var currentState=states.idle

export var speed:=400.0
var actualSpeed:=0.0

var timerRange:=0.0
var timer:=0.0

export var timerMin:=10.0 
export var timerMax:=20.0

var velocity:=Vector2.ONE
var velX:=0.0
var velY:=0.0

var initialPos:=Vector2.ZERO



# Called when the node enters the scene tree for the first time.
func _ready():
	initialPos=global_position
	_ReconsiderMove()
	print(velocity)
	print(speed)
	print(timerRange)
	print(currentState)
	pass # Replace with function body.

func _CountTimer(delta):
	timer+=delta
	pass

func _ResetTimer():
	timer=0
	pass	
func _ResetTimerRange():
	timerRange=rand_range(timerMin,timerMax)
	pass
func _ResetVelocity():
	velX=rand_range(-1,1)
	velY=rand_range(-1,1)
	velocity=Vector2(velX,velY)
	pass
func _ResetState(var maxRange):
	currentState=randi()%3
	pass
func _ResetRotation():
	set_global_rotation(velocity.angle())
	pass

func _MoveHunter(delta):
	move_and_slide(velocity*actualSpeed*delta)
	pass
func _ReconsiderMove():
		_ResetState(2)
		_ResetVelocity()
		_ResetRotation()
		_ResetTimer()
		_ResetTimerRange()

func _Patrol(delta):
	if timer >=timerRange: 
		_ReconsiderMove()
		timer=0.0
	else:
	 _CountTimer(delta)
	 _AdjustSpeeds()
	 _MoveHunter(delta)
	pass	


func _ChangeStatess():
	## if true run an exei switch kltra me switch
	#else currentState=rand_range(0,1) _ResetVelocity()
	#		_NormalActions()

	pass

func _AdjustSpeeds():
	if currentState ==states.run :
		actualSpeed=speed*2
		pass
	elif currentState==states.walk:
		actualSpeed=speed
		pass
	else : 
		actualSpeed=0	
	pass
func _process(delta):
	_Patrol(delta)
	#print(timer)
	#print(get_node(".").name)
	pass
