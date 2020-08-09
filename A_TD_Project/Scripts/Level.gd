extends TileMap

onready var pathFollower1 = $Path2D/PathFollow2D
onready var pathFollower2 = $Path2D2/PathFollow2D

func _process(delta):
	pathFollower1.unit_offset += 0.002
	pathFollower2.unit_offset += 0.0025


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
