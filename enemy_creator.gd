extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var spawn = true

var enemy = preload("res://enemy.tscn")
var enemy_instance
# Called when the node enters the scene tree for the first time.
#func _ready():
#	enemy.init(-10)
#	add_child(enemy)
#	enemy.init(0)
#	add_child(enemy)
# Called every frame. 'delta' is the elapsed time since the previous frame.

var enemies = []


	# TODO: destroy instances that are out of bounds.
func generate_starting_position():
	if randf() < 0.4:
		return -80
	elif randf() < 0.6:
		return -15
	else:
		return -5

func _on_player_game_over():
	spawn = false
	for enemy in enemies:
		enemy.stop()


func _on_Timer_timeout():
	for enemy in enemies:
		var width = enemy.get_node("Sprite").region_rect.size.x
		if enemy.get_global_position().x < -width:
			enemy.queue_free()
			enemies.erase(enemy)


func _on_spawn_timer_timeout():
	if spawn and randf() > 0.9:
		enemy_instance = enemy.instance()
		enemy_instance.init(generate_starting_position())
		enemies.append(enemy_instance)
		add_child(enemy_instance)
