extends Control


export var count = 0

var data = {
	count = count,
	auto_clickers = [
		0,0,0,0,0
	]
}

var saveFile = OS.get_environment("HOME") + "/Documents/save.txt"
#var saveFile = "res://save.txt"

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	if file.file_exists(saveFile):
		file.open(saveFile, File.READ)
		data = parse_json(file.get_line())
		count = data.count
		
		var index = 0
		for dac in data.auto_clickers:
			$AutoClickerContainer.get_children()[index].update_value(dac)
			index += 1
		
		file.close()


func _on_Button_pressed():
	count += 1


func _process(delta):
	$ManualClick/Label.text = str(count)
	
	# Checks every autoclicker and takes the amount of units
	var index = 0
	var total_ups = 0
	for ac in $AutoClickerContainer.get_children():
		 total_ups += ac.ups * ac.amount
		 index += 1
	# Displays total units/s to the screen
	$ClicksPerSecondValue.text = str(total_ups)


func _on_SavingTimer_timeout():
	data.count = count
	
	var index = 0
	for ac in $AutoClickerContainer.get_children():
		data.auto_clickers[index] = ac.amount
		index += 1
	
	var file = File.new()
	file.open(saveFile, File.WRITE)
	file.store_line(to_json(data))
	file.close()
