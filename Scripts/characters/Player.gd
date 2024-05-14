extends CharacterBody2D

enum State {
	ATTACK,
	IDLE,
	DEATH,
	LOOT,
	WALK
}

signal health_depleted

var current_state = State.IDLE
@onready var animation_sprite = $AnimatedSprite2D

func _process(delta):
	match current_state:
		State.IDLE:
			state_idle()
		State.ATTACK:
			state_attack()
		State.LOOT:
			state_loot()
		State.DEATH:
			state_death()
	pass

func state_idle():
	animation_sprite.play("idle")
	$PortalSprite.visible = false
	animation_sprite.scale.x = 1

func state_attack():
	animation_sprite.play("attack")

func state_loot():
	animation_sprite.play("loot")
	$PortalSprite.visible = true
	animation_sprite.scale.x = -1

func state_death():
	animation_sprite.play("death")

func _input(event):
	if current_state == State.IDLE:
		if event.is_action_pressed("ui_up"):
			current_state = State.ATTACK
		elif event.is_action_pressed("ui_left"):
			current_state = State.LOOT
	elif current_state == State.LOOT:
		if event.is_action_pressed("ui_left"):
			current_state = State.IDLE

func _on_animated_sprite_2d_animation_finished():
	if current_state != State.DEATH:
		current_state = State.IDLE
	else:
		health_depleted.emit()

func _on_health_bar_value_changed(value):
	if value <= 0:
		current_state = State.DEATH
