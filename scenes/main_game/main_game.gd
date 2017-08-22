extends Node
signal draw_wall
signal wall_complete

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var wall = preload("res://scenes/wall/Wall.tscn")
var can_draw

func _ready():
	#Input.set_custom_mouse_cursor(mouse_horizontal)
	find_node("Arrow").connect("draw_wall", self, "_on_draw_wall")
	can_draw=true

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

func _on_wall_complete():
	can_draw = true
