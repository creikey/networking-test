extends Node2D

func start_serve(in_port, in_max_players):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(in_port, in_max_players)
	get_tree().set_network_peer(peer)

func _on_LineEdit_text_entered(text_entered):
	$UI/LineEdit.text = ""
	var port = int(text_entered)
	if(port == 0):
		$UI/Log.append_to_log("Invalid port. Must be only numbers")
	elif(not port > 1000):
		$UI/Log.append_to_log("Invalid port. Must be greater than 1000")
	else:
		$UI/Log.append_to_log("Beginning to serve on IP " + str(IP.get_local_addresses()[1]))
		$UI/Log.append_to_log("Port " + str(port))