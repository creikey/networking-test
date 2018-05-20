extends Node2D

export var max_players = 8

var server_port

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")

func _player_connected(in_id):
	$UI/Log.append_to_log("Player connected with id " + str(in_id))

func _player_disconnected(in_id):
	$UI/Log.append_to_log("Player disconnected with id " + str(in_id))

func start_serve(in_port, in_max_players):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(in_port, in_max_players)
	get_tree().set_network_peer(peer)
	get_tree().set_meta("network_peer", peer)

func _on_LineEdit_text_entered(text_entered):
	$UI/LineEdit.text = ""
	var port = int(text_entered)
	if(port == 0):
		$UI/Log.append_to_log("Invalid port. Must be only numbers")
	elif(not port > 1000):
		$UI/Log.append_to_log("Invalid port. Must be greater than 1000")
	else:
		$UI/Log.append_to_log("Beginning to serve on IP " + str(IP.get_local_addresses()[1]))
		$UI/Log.append_to_log("Maximum players: " + str(max_players))
		$UI/Log.append_to_log("Port: " + str(port))
		server_port = port
		start_serve(server_port, max_players)