extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()


func init(pos, anim, velx):
	if randf() > 0.5:
		$AnimationPlayer.play("big")
	else:
		$AnimationPlayer.play("small")

	position.x = pos.x
	position.y = pos.y
	velocity.x = velx

func stop():
	velocity.x = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += velocity.x * delta #velocity * delta
