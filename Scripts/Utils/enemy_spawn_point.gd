extends Node2D

func _input(event):
	if event.is_action_pressed("ui_down"):
		spawn_enemy("knight")

func spawn_enemy(enemy):
	if enemy == "archer":
		enemy = preload("res://Scenes/Characters/Archer.tscn")
	elif enemy == "king":
		enemy = preload("res://Scenes/Characters/King.tscn")
	elif enemy == "knight":
		enemy = preload("res://Scenes/Characters/Knight.tscn")
	else:
		pass
	
	var new_enemy = enemy.instantiate()
	new_enemy.global_position = global_position
	get_parent().add_child(new_enemy)
	
