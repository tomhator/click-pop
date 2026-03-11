extends Area2D

@onready var timer: Timer = $Timer

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("mouse_left_btn"):
		$AnimatedSprite2D.play("Dead")
		timer.timeout.connect(dead)

func dead() -> void:
	queue_free()
