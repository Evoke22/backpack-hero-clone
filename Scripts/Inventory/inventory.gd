extends Control

@onready var slot_scene = preload("res://Scenes/Inventory/slot.tscn")
@onready var grid_container = $"TextureRect/full area(vbox)/Grid area(hbox)/GridContainer"
@onready var item_scene = preload("res://Scenes/Inventory/item.tscn")

var grid_array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(25):
		create_slot()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#ALL MADE FUNCTIONS
func create_slot():
	var new_slot = slot_scene.instantiate()
	new_slot.slot_id = grid_array.size()	
	grid_container.add_child(new_slot)
	new_slot.slot_entered.connect(on_slot_mouse_entered)
	new_slot.slot_exited.connect(on_slot_mouse_exited)
	
func on_slot_mouse_entered(a_slot):
	a_slot.set_color(a_slot.states.TAKEN)
	
func on_slot_mouse_exited(a_slot):
	a_slot.set_color(a_slot.states.DEFAULT)
	


func _on_button_spawn_pressed():
	var new_item = item_scene.instantiate()
	add_child(new_item)
	new_item.load_items_2d(0)
