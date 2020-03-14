extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func init(pos):
	position.y = pos

func stop():
	$AnimationPlayer.stop()
	velocity.x = 0

func _ready():
#	print_debug(pos)
	velocity.x = -650
	$AnimationPlayer.play("flying")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
