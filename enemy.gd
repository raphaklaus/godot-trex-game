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
	Global.game_speed = 0

func _ready():
	$AnimationPlayer.play("flying")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += Global.game_speed * -1 * delta
