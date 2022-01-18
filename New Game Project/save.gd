extends Node

# !! Code for saving variables to a json file to save across games

const SAVE_PATH = "res://save_game.json"

func save_game():
	# Get all save data
	var save_dict = {}
	var nodes_to_save = get_tree().get_nodes_in_group('persistent')
	for node in nodes_to_save:
		save_dict[node.get_path()] = node.save()
		print(save_dict)
	
	# Create a file
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	
	# Serialize to data dictionary to a JSON
	save_file.store_line(to_json(save_dict))
	
	# Write JSON to the file and save disk
	save_file.close()

func load_game():
	# Try to load a saved file
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		return 
	
	# Parse the data if it exists
	save_file.open(SAVE_PATH, File.READ)
	var data = JSON.parse(save_file.get_as_text()).result
	
	# Load the data in
	print(data.keys())
	for node_path in data.keys():
		## Node is being returned as null !!
		#var node = get_node(node_path)
		
		# If it has another path nested in it 
		for attribute in data[node_path]:
			var area = data[node_path][attribute]
			Global.currentArea = area
			