extends Control


var amount = 0
export var increment = 1.15
export var price = 15
export var ups = 1
var start_price = price

var main_node


# Called when the node enters the scene tree for the first time.
func _ready():
	main_node = get_tree().get_root().get_node("Main")
	start_price = price
	update_value(amount)


func update_value(new_value):
	amount = new_value
	if new_value == 0:
		price = start_price
	else:
		# price = (new_value * increment) * start_price
		price = round(start_price * pow(increment, amount))
	$Label.text = str(amount)
	$Price.text = "Price: " + str(price)
	$HBoxContainer/Value.text = str(ups)


# Runs every second
func _process(_delta):
	if main_node.count >= price:
		$Button.disabled = false
	else:
		$Button.disabled = true


func _on_Button_pressed():
	if main_node.count >= price:
		main_node.count -= price
		update_value(amount + 1)


func _on_Timer_timeout():
	main_node.count += amount * ups
