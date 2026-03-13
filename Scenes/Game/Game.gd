extends Node2D

class_name Game

const CROOSHAIR = preload("uid://dv7h1x5l86hhi")
const MONSTER = preload("uid://b4kyu7u60fa2j")

const MARGIN = 50

@onready var enemy_spawner: Node2D = $EnemySpawner
@onready var spawn_timer: Timer = $EnemySpawner/SpawnTimer

var SPAWNIG_TIME: float = 1.5

@onready var enemy_count: Label = $CanvasLayer/EnemyCount
@onready var game_over_label: Label = $CanvasLayer/GameOverLabel
@onready var restart_button: Button = $CanvasLayer/RestartButton

func reset_global() -> void:
	SPAWNIG_TIME = 1.5
	Global.current_enemy = 0
	Global.enemy_killed = 0
	

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
	Global.enemy_killed += 1
	if Global.enemy_killed % 5 == 0:
		SPAWNIG_TIME -= 0.5
		if SPAWNIG_TIME < 0.5:
			SPAWNIG_TIME = 0.3
		spawn_timer.wait_time = SPAWNIG_TIME
		print(spawn_timer.wait_time)

func game_over() -> void:
	if Global.current_enemy >= Global.MAX_EMEMY:
		get_tree().paused = true
		game_over_label.show()
		restart_button.show()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_global()
	get_tree().paused = false
	spawn_timer.wait_time = SPAWNIG_TIME
	Input.set_custom_mouse_cursor(CROOSHAIR)
	enemy_count.text = '0000'



func _on_spawn_timer_timeout() -> void:
	spawn_monster()
	game_over()


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
