extends KinematicBody2D


var SPEED = 100
var gravity = 10
var jump= -400

var motion = Vector2()
var UP = Vector2(0,-1)

var lazarFile= preload("res://Lazer.tscn")
var dir = 1 #1 equal right, -1 equal left

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true
		dir = -1
	elif Input.is_action_pressed("ui_right"):
		dir = 1
		$Sprite.flip_h = false
		motion.x = SPEED
	else:
		motion.x = 0
		
	if Input.is_action_just_pressed("m"):
		#Make a lazer
		
		var lazar=lazarFile.instance()#Make a new lazer object
		print($Position2D.name)
		$Position2D.position.x *= dir
		print($Position2D.position.x)
		
		lazar.position = $Position2D.global_position
		lazar.setdir(dir)
		
		get_parent().add_child(lazar)
		
		pass
	
	motion.y = motion.y + gravity
	
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor() ==true:
			motion.y = jump
	
	
	
	move_and_slide(motion,UP)
	
func yeet():
	print("oof")
	
	
