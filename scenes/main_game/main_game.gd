extends Node
signal draw_wall
signal wall_complete

onready var wall = preload("res://scenes/wall/Wall.tscn")
onready var area_finder = preload("res://scenes/area_finder/area_finder.tscn")
onready var can_draw = true

func _ready():
	#set metadata for all the walls
	find_node("left_wall").set_meta("type","wall")
	find_node("right_wall").set_meta("type","wall")
	find_node("top_wall").set_meta("type","wall")
	find_node("bottom_wall").set_meta("type","wall")
	
	#Input.set_custom_mouse_cursor(mouse_horizontal)
	find_node("Arrow").connect("draw_wall", self, "_on_draw_wall")

func _on_draw_wall(direction, wall_origin, distance):
	if can_draw:
		print("I'm drawing a wall to direction ", direction, " from ", wall_origin, " size ", distance)
		var w = wall.instance()
		w.set_global_pos(wall_origin)
		w.set_rotd(360 - (90 * direction))
		w.init(distance)
		w.connect("wall_complete", self, "_on_wall_complete")
		add_child(w)
		can_draw = false

func _on_wall_complete(successful, position_1, position_2):
	can_draw = true
	if successful:
		attach_area_finder(position_1)
		attach_area_finder(position_2)
	else:
		#TODO The scoring and lives go here
		pass

func attach_area_finder(area):
	var a = area_finder.instance()
	a.set_global_pos(area)
	add_child(a)
	pass
