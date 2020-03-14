extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
#func _ready():
##	print_debug("ready!!!")
#	if randf() > 0.5:
#		$AnimationPlayer.play("big")
#	else:
#

func init(pos, anim, velx):
	if randf() > 0.5:
		$AnimationPlayer.play("big")
	else:
		$AnimationPlayer.play("small")

	position.x = pos.x
	position.y = pos.y
	velocity.x = -9.783333333333333

func stop():
	velocity.x = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += velocity.x * 60 * delta #velocity * delta
