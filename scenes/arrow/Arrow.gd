extends Node2D
signal draw_wall

onready var rays = [ get_node("ray_up"), get_node("ray_right"), get_node("ray_down"), get_node("ray_left") ]
onready var sprite = get_node("Sprite")
var direction = null

func _ready():
	set_fixed_process(true)
	set_process_input(true)
 
func _fixed_process(delta):
	set_pos(get_global_mouse_pos())
	direction = find_shortest_ray()
	sprite.set_rotd( 360 - (90 * direction)) # since we want the arrow to point AWAY from the ray, reverse the rotation

func _input(event):
	# if user left clicks
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == 1):
			emit_signal("draw_wall", direction, rays[direction].get_collision_point())

func find_shortest_ray():
	var smallest = 100000.0
	var shortest_ray = 0
	for i in range (0, rays.size()):
		var distance_to_wall = rays[i].get_collision_point().distance_to(get_global_pos())
		if ( distance_to_wall < smallest ):
			smallest = distance_to_wall
			shortest_ray = i
	return shortest_ray