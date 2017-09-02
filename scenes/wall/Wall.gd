extends KinematicBody2D
signal wall_complete

onready var tween = get_node("Tween")
onready var collision_shape = get_node("CollisionShape2D")

var distance

func init(passed_in_instance):
	distance = passed_in_instance

func _ready():
	tween.interpolate_property(self, "transform/scale", Vector2(1,0) , Vector2(1, distance/23.5), distance/200, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()

func _on_Tween_tween_complete( object, key ):
	emit_signal("wall_complete")
	collision_shape.set_trigger(false)
	print("done")


