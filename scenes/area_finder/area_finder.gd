extends Node2D

onready var area2d = find_node("Area2D")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	print("Run Once", get_pos())
	
	var space_state = get_world_2d().get_direct_space_state()
	var top_ray = space_state.intersect_ray( get_global_pos(), Vector2(get_global_pos().x, -5000), [ self ] )
	var bottom_ray = space_state.intersect_ray( get_global_pos(), Vector2(get_global_pos().x, 5000), [ self ] )
	var left_ray = space_state.intersect_ray( get_global_pos(), Vector2(-5000, get_global_pos().y), [ self ] )
	var right_ray = space_state.intersect_ray( get_global_pos(), Vector2(5000, get_global_pos().y), [ self ] )
	
	var y_midpoint = (bottom_ray.position.y + top_ray.position.y)/2
	var x_midpoint = (right_ray.position.x + left_ray.position.x)/2
	set_global_pos( Vector2(x_midpoint,y_midpoint))

	var y_extents = (bottom_ray.position.y - top_ray.position.y)/2
	var x_extents = (right_ray.position.x - left_ray.position.x)/2
	
	
	
	set_fixed_process(false)