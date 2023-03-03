extends Control

func _ready():
	$HTTPRequest.request("http://localhost:3000/api/test")

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	
	var rank = 1
	
	for i in json.result:
		var dataRank = Label.new()
		dataRank.text = str(rank)
		$GridContainer.add_child(dataRank)
		rank += 1
		var dataName = Label.new()
		dataName.text = i.name
		$GridContainer.add_child(dataName)
		var dataScore = Label.new()
		dataScore.text = str(i.score)
		$GridContainer.add_child(dataScore)

func _on_Button_pressed():
	get_tree().change_scene("res://Main.tscn")
