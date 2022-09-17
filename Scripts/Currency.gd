extends Node2D


func _ready():
	deleteCurrency()
	
	
#func _process(_delta):
#	deleteCurrency()

func deleteCurrency():
	# Add a timer to this node
	var timer = Timer.new()
	self.add_child(timer)
	
	# Connect the timer to make it call "queue_free" after two seconds
	timer.connect("timeout", self, "queue_free")
	timer.set_wait_time(2)
	timer.start()
	
#	queue_free()
