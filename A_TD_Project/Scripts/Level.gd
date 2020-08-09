extends TileMap

func _process(delta):
	pass
	
func calculate(pos):
	var _grid = world_to_map(pos)
	var _tile = get_cell(_grid.x, _grid.y)
	print(_tile)

func is_in_base(pos : Vector2) -> bool:
	var _grid = world_to_map(pos)
	var _tile = get_cell(_grid.x, _grid.y)
	var inBase = false
	if _tile == 0:
		inBase = true
	return inBase

func world_to_grid(pos : Vector2) -> Vector2:
	var _grid = world_to_map(pos)
	return _grid

func grid_to_world(grid: Vector2) -> Vector2:
	var _pos = map_to_world(grid)
	return _pos
