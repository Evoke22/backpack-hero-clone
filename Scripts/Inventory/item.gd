extends Node2D
@onready var icon_rect_path = $Icon

var item_id : int
var item_grids := []
var selected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	selected = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = lerp(global_position,get_global_mouse_position(),100* delta)

#MADE FUNCTIONS
func load_items_2d(a_itemid : int) -> void:
	print("print")
	var icon_path = "res://Assets/Inventory/temp_sword_shild/" + DataHandler.item_data[(a_itemid)]["name"] + ".png"
	print(icon_path)
	icon_rect_path.texture = load(icon_path)
	print("print3")
	for i in DataHandler.item_grid_data[str(a_itemid)]:
		var temp_converter_array := []
		for j in i:
			temp_converter_array.push_back(int(j))
		item_grids.push_back(temp_converter_array)

