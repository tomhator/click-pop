extends Area2D

class_name Monster

signal click_monster

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var is_dead = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("mouse_left_btn"):
		if is_dead == false: click_monster.emit()
		is_dead = true
		audio_stream_player_2d.play()
		$AnimatedSprite2D.play("Dead")
		
		var tween = create_tween()
		
		tween.tween_property($AnimatedSprite2D, "scale", Vector2(1.1, 1.1), 1.0)
		tween.tween_property($AnimatedSprite2D, "modulate:a", 0, 0.5)
		tween.tween_callback(queue_free)
		
		#$AnimatedSprite2D.play("Dead")
		#if is_dead == false: click_monster.emit()
		#is_dead = true
		#timer.timeout.connect(dead)

#func dead() -> void:
