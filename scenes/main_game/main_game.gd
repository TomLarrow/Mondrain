extends Node
signal draw_wall

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var wall = preload("res://scenes/wall/Wall.tscn")

func _ready():
	#Input.set_custom_mouse_cursor(mouse_horizontal)
	find_node("Arrow").connect("draw_wall", self, "_on_draw_wall")
	pass

func _on_draw_wall(direction, wall_origin):
	print("I'm drawing a wall to direction ", direction, " from ", wall_origin)
	var w = wall.instance()
	w.set_global_pos(wall_origin)
	w.set_rotd(360 - (90 * direction))
	add_child(w)