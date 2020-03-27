extends KinematicBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const GRAVITY = 40
const JUMP_FORCE = 1000

signal game_over

var has_game_over = false
var velocity = Vector2()
var is_jumping = false
var is_squatting = false
var local_gravity = GRAVITY
var stomping = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("running")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not has_game_over:
		if Input.is_action_pressed("ui_down") or is_squatting:
			$AnimationPlayer.play("squatting")
			stomping = true
		elif Input.is_action_pressed("ui_accept") and not is_jumping:
			Global.play_jump_sound()
			is_jumping = true
			velocity.y -= JUMP_FORCE
			print_debug("ui_accept")
		else:
			$AnimationPlayer.play("running")
		
	
		if velocity.y > -500:
			if stomping:
				local_gravity = 80
			else:
				local_gravity = GRAVITY

			velocity.y += local_gravity * 1.5
		else:
			velocity.y += local_gravity
			
		velocity = move_and_slide(velocity, Vector2(0,-1))

		if is_on_floor():
			is_jumping = false
			stomping = false

func _on_up_button_down():
	if not is_jumping:
		Global.play_jump_sound()
		is_jumping = true
		velocity.y -= JUMP_FORCE

func _on_down_button_down():
	is_squatting = true

func _on_down_button_up():
	is_squatting = false

var played_sound_once = false

func _on_Area2D_area_entered(area):
	var body = area.get_parent()
	if body.is_in_group("enemies"):
		$AnimationPlayer.play("dying")
		emit_signal("game_over")
		has_game_over = true
		if not played_sound_once:
			played_sound_once = true
			Global.play_died_sound()
