extends Node
var item_data = {}
var item_grid_data = {}
@onready var Item_data_path = "res://Data/Items/item_data.json"


# Called when the node enters the scene tree for the first time.
func _ready():
	load_data(Item_data_path)
	set_grid_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#MADE FUNCTIONS

func load_data(a_path)-> void:
	print("Entering load_data_Function")
	if not FileAccess.file_exists(a_path):
		print("Item data file not found")
	var item_data_file_loaded = FileAccess.open(a_path,FileAccess.READ)
	item_data = JSON.parse_string(item_data_file_loaded.get_as_text())
	item_data_file_loaded.close()
	print("item_data = ",item_data)

#func set_grid_data() -> void:
#	for i in item_data.keys():
#		var temp_array := []
#		for j in item_data[i]["grid"].split("/"):
#			temp_array.push_back(j.split(","))
#		item_grid_data[i] = temp_array
	
#	print(item_grid_data)	
		
func set_grid_data()-> void:
	for item in item_data:
		var temp_array := []
		for grid_str in item["grid"].split("/"):
			var grid_coords := []
			for coord_str in grid_str.split(","):
				grid_coords.append(coord_str)
				temp_array.append(grid_coords)
		item_grid_data[item["Item_id"]] = temp_array
	
	print(item_grid_data)	

	









