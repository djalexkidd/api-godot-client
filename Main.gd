extends Control

var username = ""
var score = ""

func _make_post_request(url, data_to_send, use_ssl):
	# Convert data to json string:
	var query = JSON.print(data_to_send)
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, use_ssl, HTTPClient.METHOD_POST, query)

func _on_Button_pressed():
	_make_post_request("http://localhost:3000/sendscore", {"name": $LineEdit.get_text(), "score": $LineEdit2.get_text()}, false)
	

func _on_Button2_pressed():
	get_tree().change_scene("res://Leaderboard.tscn")
