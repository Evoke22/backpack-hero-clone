extends Node2D

enum State {
	SETUP,
	BATTLE,
	LOOT
}

var current_state = State.SETUP

var position1
var pos1_is_empty = true
var pos1_flag = false

var position2
var position3



#func spawn_enemies():
	#match current_state:
		#State.SETUP:
			#$Enemy_Spawn_Point.spawn_enemy("knight")
			#position1 = get_node("Knight")
			#
			#await get_tree().create_timer(1.5).timeout
			#
			#$Enemy_Spawn_Point.spawn_enemy("knight")
			#position2 = get_node("@CharacterBody2D@2")



func _on_position_position_empty():
	if current_state == State.SETUP and not pos1_flag:
		$Enemy_Spawn_Point.spawn_enemy("knight")
		position1 = get_node("Knight")
		position1.move_to_position($Position.global_position)
		pos1_flag = true

func _on_position_2_position_empty():
	if current_state == State.SETUP and not pos1_is_empty:
		$Enemy_Spawn_Point.spawn_enemy("knight")
		position2 = get_node("@CharacterBody2D@2")
		position2.move_to_position($Position2.global_position)
		current_state = State.BATTLE


func _on_position_3_position_empty():
	pass


func _on_position_body_entered(body):
	body.set_idle()
	await get_tree().create_timer(2.0).timeout
	pos1_is_empty = false
