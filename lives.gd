extends HBoxContainer


func lose_lives (live_number):
	get_node(".").get_child(live_number).hide()
