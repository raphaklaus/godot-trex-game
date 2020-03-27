extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()


func init(pos, anim):
	if randf() > 0.5:
		$AnimationPlayer.play("big")
	else:
		$AnimationPlayer.play("small")

	position.x = pos.x
	position.y = pos.y

func stop():
	Global.game_speed = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += Global.game_speed * -1 * delta #velocity * delta
