extends Node2D

onready var rays = [ get_node("ray_left"), get_node("ray_down"), get_node("ray_right"), get_node("ray_up") ]
onready var sprite = get_node("Sprite")
var direction = null

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	set_pos(get_global_mouse_pos())
	direction = find_shortest_ray()
	sprite.set_rotd( 90 * direction)

func find_shortest_ray():
	var smallest = 100000.0
	var dir = 0
	for i in range (0, rays.size()):
		var distance_to_wall = rays[i].get_collision_point().distance_to(get_global_pos())
		if ( distance_to_wall < smallest ):
			smallest = distance_to_wall
			dir = i
	return dir