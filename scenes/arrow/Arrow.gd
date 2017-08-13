extends Node2D

onready var rays = [ get_node("ray_down"), get_node("ray_up"), get_node("ray_left"), get_node("ray_right") ]

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	set_pos(get_global_mouse_pos())
	for i in range(0, rays.size()):
		print(rays[i].get_collision_point())
