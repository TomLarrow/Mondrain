extends RigidBody2D

func _ready():
	apply_impulse(Vector2(1,1),Vector2(1,1))