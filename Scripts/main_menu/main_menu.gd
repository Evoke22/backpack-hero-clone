class_name Main_Menu
extends Control

@onready var start_button = $"MarginContainer/button hbox container/VBoxContainer/Start button" as Button
@onready var option_button = $"MarginContainer/button hbox container/VBoxContainer/Option button" as Button
@onready var quit_button = $"MarginContainer/button hbox container/VBoxContainer/Quit button" as Button
@onready var option_menu = $option_menu
@onready var margin_container = $MarginContainer

# @onready var start_level = preload() # insert which level to load in the background

func _ready():
	start_button.button_down.connect(on_start_pressed)
	option_button.button_down.connect(on_option_pressed)
	quit_button.button_down.connect(on_quit_pressed)
	option_menu.exit_options_menu.connect(on_exit_options_menu)
func on_start_pressed() -> void:
#	get_tree().change_scene_to_packed(start_level)
	pass
	
func on_option_pressed() -> void:
	option_menu.set_process(true)
	margin_container.visible = false
	option_menu.visible = true
	
	pass
	
func on_quit_pressed() -> void:
	get_tree().quit()


func on_exit_options_menu() -> void:
	margin_container.visible = true
	option_menu.visible = false
	
