extends CharacterBody2D

class_name Character

enum State {
	IDLE,
	ATTACK,
	WALK,
	DEATH
}

var current_state = State.IDLE
var target_position

func _process(delta):
	match current_state:
		State.WALK:
			$AnimatedSprite2D.play("walk")
			var direction = target_position - self.position
			self.velocity = direction * 1
			move_and_slide()
			
		State.IDLE:
			$AnimatedSprite2D.play("idle")
		
		State.DEATH:
			death()

func move_to_position(location):
	target_position = location
	current_state = State.WALK

func set_idle():
	current_state = State.IDLE


var max_health
var current_hp
var shield

func take_damage(damage):
	current_hp -= damage
	%HealthBar.value = current_hp
	
	if current_hp <= 0:
		current_state = State.DEATH

func death():
	$AnimatedSprite2D.play("death")
	await get_tree().create_timer(1.5).timeout
	queue_free()


