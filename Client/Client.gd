extends Node2D

var server_ip = ""
var server_port = 0

var got_ip = false

func _ready():
	pass

func _on_CommandInput_text_entered(new_text):
	$UI/CommandInput.text = ""
	if(!got_ip):
		server_ip = new_text
		got_ip = true
		$UI/Log.append_to_log("Set server ip to " + server_ip)
	else:
		server_port = int(new_text)
		$UI/Log.append_to_log("Set server port to " + str(server_port))
		connect_to_server()

func connect_to_server():
	$UI/Log.append_to_log("Connecting to ip " + server_ip + " on port " + str(server_port))
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(server_ip, server_port)
	get_tree().set_network_peer(peer)
	get_tree().set_meta("network_peer", peer)