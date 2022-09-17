extends Control


var currencySprite = preload("res://Scenes/CurrencySprite.tscn")

func spawnCurrency():
	randomize()
	var currency = currencySprite.instance()
	currency.set_position(rect_position)
#	currency.set_position($".".get_rect().position)
	add_child(currency)
	

func _on_ManualClick_pressed():
	spawnCurrency()
