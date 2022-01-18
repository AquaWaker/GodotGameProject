extends Camera2D

# Gets the total amount of  tilemap pieces, and then gets the 
# cell size of each tilemap piece to figure out the whole area 
# they take up so that the camera can be limited to that space
# in any world area in the game
func _ready():
	var tilemap_rect = get_node("/root/World/TileMap").get_used_rect()
	var tilemap_cell_size = get_node("/root/World/TileMap").cell_size
	limit_left = tilemap_rect.position.x * 192
	limit_right = tilemap_rect.end.x * 192
	limit_top = tilemap_rect.position.y * 192
	limit_bottom = tilemap_rect.end.y * 192