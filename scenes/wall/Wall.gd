extends KinematicBody2D

onready var tween = get_node("Tween")

func _ready():
	tween.interpolate_property(self, "transform/scale", self.get_scale(), Vector2(1.0, 60.0), 3.2, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()

func _on_Tween_tween_complete( object, key ):
	print(is_colliding())
