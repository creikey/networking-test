extends Node2D

export var server_port

func _ready():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(