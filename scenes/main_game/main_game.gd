extends Node
signal draw_wall

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var mouse_horizontal = preload("res://scenes/main_game/mouse_horizontal.png")
var mouse_vertical = preload("res://scenes/main_game/mouse_vertical.png")


func _ready():
	#Input.set_custom_mouse_cursor(mouse_horizontal)
	find_node("Arrow").connect("draw_wall", self, "_on_draw_wall")
	pass

func _on_draw_wall(direction, wall_origin):
	print("I'm drawing a wall to direction ", direction, " from ", wall_origin)