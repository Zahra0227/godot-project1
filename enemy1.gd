extends KinematicBody2D

var shetab_enemy = Vector2()
var enemy_speed = 150
export var jahat_harekat = 1 	

func _ready():
	if jahat_harekat == 1:
		$AnimatedSprite.flip_h = true
		

	
func _physics_process (_delta):
	shetab_enemy.y = shetab_enemy.y + 50
	shetab_enemy.x = enemy_speed * jahat_harekat
	shetab_enemy = move_and_slide (shetab_enemy, Vector2.UP)
	
	if is_on_wall():
		jahat_harekat = jahat_harekat * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		


func _on_enemy_die_body_entered(body):
	$AnimatedSprite.play("die")
	enemy_speed = 0
	body.half_jump()
	print ("die!!!")
	$AnimationPlayer.play("enemy_die")
	set_collision_layer_bit(0 , false)
	set_collision_layer_bit(3 , false)
	$enemy_die.set_collision_mask_bit(0 , false)
	$hurt.set_collision_mask_bit(0 , false)
	$enemy_die/Timer.start()
	


func _on_Timer_timeout():
	queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()


func _on_hurt_area_entered(body):
	print("hurt!!!")
	body.hurting(position.x)
