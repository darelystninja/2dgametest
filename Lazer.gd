extends Area2D

var speed = 50
var motion = Vector2()
var UP = Vector2(0,-1)
var dir = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setdir(dir3):
	dir = dir3
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#	pass
	position.x = position.x + speed*dir

func _on_Lazer_body_entered(body):
	if "mememan" in body.name:
		#i hit the player
		#body.yeet()
		pass
	queue_free()#delete object
		
