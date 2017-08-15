extends KinematicBody2D

onready var effect = get_node("Tween")

func _ready():
	effect.interpolate_property(self, "transform/scale", self.get_scale(), Vector2(1.0, 25.0), 1.5, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	effect.start()

func _on_effect_tween_complete( object, key ):
	print(is_colliding())
 