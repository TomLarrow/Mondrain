extends KinematicBody2D

var speed = 200
var vel = Vector2()

func _ready():
	print("ready")
	randomize()
	vel = Vector2(rand_range(-1,1), rand_range(-1,1)).normalized() * speed 
	print(vel)
	set_fixed_process(true)

func _fixed_process(delta):
	var motion = move(vel * delta)  # Move the Body
	if is_colliding():
		var n = get_collision_normal()
		motion = n.reflect(motion)
		vel = n.reflect(vel)
		move(motion)