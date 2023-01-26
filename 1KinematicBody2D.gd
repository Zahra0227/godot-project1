extends KinematicBody2D

var player_heart_number=0
var shetab= Vector2(0,0)
var playerspeed= 210
var jump= 900
var lives = 4

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
	   shetab.x= playerspeed
	   $Sprite.play("walk")
	   $Sprite.flip_h= false

	   
	elif Input.is_action_pressed("ui_left"):
		shetab.x= -playerspeed
		$Sprite.play("walk")
		$Sprite.flip_h= true

	else:
		$Sprite.play("default")
		
	if not	is_on_floor():
		$Sprite.play("jump")
	
	if Input.is_action_pressed("jump") and is_on_floor():
		shetab.y= -jump
		$Sprite.play("jump")

	
	
	shetab.y= shetab.y + 30
	
	move_and_slide(shetab, Vector2.UP)	
	shetab.x= lerp(shetab.x, 0, 0.5)
	
	
func half_jump():
	shetab.y = -jump * 0.8
	
func hurting(var enemy_position):
	set_modulate(Color(1, 0.5, 0.5, 0.8))
	if position.x < enemy_position:
		shetab.x = -3000
	elif position.x > enemy_position:
		shetab.x = 3000
	$recolor.start()
	if lives == 0:
		get_tree().reload_current_scene()
	elif lives <= 4:
		lives -= 1
	print(lives)
	get_node("/root/level_1/panel_show/lives").lose_lives(lives)



func add_heart_number(number):
	player_heart_number = player_heart_number + number
	print(player_heart_number)
	
func _on_gameover_zone_body_entered(_body):
	get_tree().reload_current_scene()


func _on_recolor_timeout():
	set_modulate(Color(1,1,1,1))
