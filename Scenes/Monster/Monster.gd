extends Area2D

class_name Monster

signal click_monster

@onready var timer: Timer = $Timer

var is_dead = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("mouse_left_btn"):
		$AnimatedSprite2D.play("Dead")
		if is_dead == false: click_monster.emit()
		is_dead = true
		timer.timeout.connect(dead)

func dead() -> void:
	queue_free()
