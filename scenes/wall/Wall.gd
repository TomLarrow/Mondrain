extends KinematicBody2D

onready var tween = get_node("Tween")

func _ready():
	tween.interpolate_property(self, "transform/scale", self.get_scale(), Vector2(1.0, 60.0), 3.2, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()

func _on_Tween_tween_complete( object, key ):
	print(is_colliding())


func _on_Area2D_body_enter_shape( body_id, body, body_shape, area_shape ):
	print (body_id, body, body_shape, area_shape)
	pass # replace with function body
