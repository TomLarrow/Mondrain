extends KinematicBody2D
signal wall_complete

onready var tween = get_node("Tween")
onready var collision_shape = get_node("wall_collision_shape")
onready var ball_detect = get_node("ball_detect")
onready var area_finder_1 = get_node("area_finder_1")
onready var area_finder_2 = get_node("area_finder_2")
onready var tweening = true

var distance

func init(passed_in_instance):
	distance = passed_in_instance

func _ready():
	self.set_meta("type", "wall")
	tween.interpolate_property(self, "transform/scale", Vector2(1,0) , Vector2(1, distance/23.5), distance/200, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()

func _on_Tween_tween_complete( object, key ):
	emit_signal("wall_complete", true, area_finder_1.get_pos(), area_finder_2.get_pos())
	collision_shape.set_trigger(false)
	tweening = false
	print("done")

func _on_ball_detect_body_enter( body ):
	if (body.get_meta("type")=="ball"):
		if tweening:
			print("Hey ", body.get_name(), " hit me!")
			emit_signal("wall_complete", false, area_finder_1.get_pos(), area_finder_2.get_pos())
			queue_free()

