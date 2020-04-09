extends KinematicBody2D


var SPEED = 100
var gravity = 10
var jump= -400
var motion = Vector2()
var UP = Vector2(0,-1)
var ongroud = false
var jumping = false
onready var anim = $Sprite # This will hold the sprite node
onready var shoot_timer = $"shoot timer"



var lazarFile= preload("res://Lazer.tscn")
# Called when the node enters the scene tree for the first time.
var dir = 1 # 1 is right, -1 is left
var is_shooting=false#true if shoot if shooting animination
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("a"):
		motion.x = -SPEED
		$Sprite.flip_h = true
		dir = -1
		if jumping == false:
			if is_shooting == true:
				anim.play("run shot")
			else:
				anim.play("run")#to play a anim
	elif Input.is_action_pressed("d"):
		dir = 1
		if jumping == false:
			if is_shooting == true:
				anim.play("run shot")
			else:
				anim.play("run")#to play a anim
		$Sprite.flip_h = false
		motion.x = SPEED
		
				
	else:
		#Not moving
		if is_shooting == false:
			if ongroud == true:
				anim.play("idle")
		motion.x = 0

	
	

	if Input.is_action_just_pressed("w"): 
		#when press it jump
		anim.play("jump")
		jumping = true
		if is_on_floor() ==true:
			motion.y = jump
			
	if Input.is_action_just_pressed("r"):
		var lazar=lazarFile.instance()#Make a new lazer object
		if jumping == false:
			anim.play("shoot")
		else:
			anim.play("JUMP SHOOT")
		is_shooting = true
		shoot_timer.start()
		lazar.position = $Position2D.global_position
		lazar.setdir(dir)
		get_parent().add_child(lazar)
		
		pass
	
	motion.y = motion.y + gravity
	move_and_slide(motion,UP)
	
	if is_on_floor()==true:
		#game know his on floo
		#On Floor
		ongroud = true
		#Not on floor
		jumping = false
	else:
		ongroud = false
		
	

	
		
	
	


func _on_Sprite_animation_finished():
	#will run if sprite finshes animation
	
	pass # Replace with function body.


func _on_shoot_timer_timeout():
	#when the timer it will call the function 
	is_shooting = false
	pass # Replace with function body.
