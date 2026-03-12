extends Node2D

class_name Game

const CROOSHAIR = preload("uid://dv7h1x5l86hhi")
const MONSTER = preload("uid://b4kyu7u60fa2j")

const MARGIN = 50

@onready var enemy_spawner: Node2D = $EnemySpawner
@onready var spawn_timer: Timer = $EnemySpawner/SpawnTimer
@onready var game_over_label: Label = $GameOverLabel
@onready var enemy_count: Label = $EnemyCount

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_close_dialog"):
		get_tree().reload_current_scene()

func spawn_monster() -> void:
	var new_monster = MONSTER.instantiate()
	var screen_size = get_viewport_rect()
	var rand_x = randf_range(MARGIN, screen_size.size.x - MARGIN)
	var rand_y = randf_range(MARGIN + 30, screen_size.size.y - MARGIN)
	new_monster.position = Vector2(rand_x, rand_y)
	enemy_spawner.add_child(new_monster)
	new_monster.click_monster.connect(_on_click_monster)
	
	
	Global.current_enemy += 1
	enemy_count.text = "%04d" % Global.current_enemy

func _on_click_monster() -> void:
	Global.current_enemy -= 1
	if Global.current_enemy <= 0:
		Global.current_enemy = 0
	enemy_count.text = "%04d" % Global.current_enemy
	

func game_over() -> void:
	if Global.current_enemy >= Global.MAX_EMEMY:
		get_tree().paused = true
		game_over_label.show()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(CROOSHAIR)
	enemy_count.text = '0000'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_timer_timeout() -> void:
	spawn_monster()
	game_over()
