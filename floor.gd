extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("floor")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	

func _on_player_game_over():
	$AnimationPlayer.stop()
