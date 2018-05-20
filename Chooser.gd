extends Node2D

export var server_scene_path = ""
export var client_scene_path = ""

func _ready():
	if(server_scene_path == "" or client_scene_path == ""):
		printerr("--Must set the server and client scene path")
		get_tree().quit()
		return
	if(OS.get_cmdline_args().size() > 0 and OS.get_cmdline_args()[0] == "--server"):
		get_tree().change_scene(server_scene_path)
	else:
		get_tree().change_scene(client_scene_path)