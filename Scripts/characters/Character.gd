extends CharacterBody2D

class_name Character

var max_health
var current_hp
var shield

func take_damage(damage):
	current_hp -= damage
	%HealthBar.value = current_hp
	
	if current_hp <= 0:
		death()

func death():
	$AnimatedSprite2D.play("death")
	await get_tree().create_timer(2.0).timeout
	queue_free()


