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

func init(pos, anim):
	if randf() > 0.5:
		$AnimationPlayer.play("big")
	else:
		$AnimationPlayer.play("small")

	position.x = pos.x
	position.y = pos.y
	velocity.x = (118 / 180.0) * 60 * 10 * -1

func stop():
	velocity.x = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
