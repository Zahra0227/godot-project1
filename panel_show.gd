extends CanvasLayer


func _ready():
	$heart_show.text= String ( get_node("/root/level_1/player"). player_heart_number )

func _physics_process(delta):
		$heart_show.text= String ( get_node("/root/level_1/player"). player_heart_number )
