extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	#queue_free()
	$AnimationPlayer.play("heart_jump")
	body.add_heart_number(1)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
