extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var stop = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func init(pos):
	position = pos
	
func stop():
	stop = true	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not stop:
		position.x -= 100 * delta
