extends CharacterBody2D

class Character:
	var max_hp = 100

	func _input(event):
		if event.is_action_pressed("ui_up"):
			pass
	
	func attack(character, damage):
		character.take_damage(damage)
	
	func take_damage(damage):
		pass
	
	func death():
		pass
		
	
