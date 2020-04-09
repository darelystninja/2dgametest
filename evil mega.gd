extends KinematicBody2D


var SPEED = 100
var gravity = 10
var jump= -400
var motion = Vector2()
var UP = Vector2(0,-1)
var ongroud = false
var jumping = false
onready var anim = $body/AnimatedSprite # This will hold the sprite node
onready var shoot_timer = $"shoot timer"
onready var body = $body


var lazarFile= preload("res://Lazer.tscn")
# Called when the node enters the scene tree for the first time.
var dir = 1 # 1 is right, -1 is left
var is_shooting=false#true if shoot if shooting animination
func _ready():
	pass # Replace with function body.


func _process(delta):
	
	#Turn around
	body.scale.x=dir
	#If moving then play run
	if motion.x != 0:
		anim.play("run")
	
	
	motion.x =   SPEED * dir
	motion.y = motion.y + gravity
	motion = move_and_slide(motion,UP)
	if is_on_wall()==true:
		if ongroud:
			if dir ==1:
				dir = -1
			else:
				dir = 1

	
	#Raycast will check if enemy is going to fall off
	#and enemy will turn aorund
	if !$RayCast2D.is_colliding():
		if ongroud:
			motion.x = 0
			if dir ==1:
				dir = -1
			else:
				dir = 1
			$RayCast2D.position.x = -$RayCast2D.position.x
	
	
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
