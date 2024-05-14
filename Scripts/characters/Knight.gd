extends Character

var selected = false

func _ready():
	$AnimatedSprite2D.play("idle")
	max_health = 25
	current_hp = max_health
	shield = 0
	%HealthBar.max_value = max_health
	%HealthBar.value = current_hp
	
func _input(event):
	if event.is_action_pressed("ui_up") and selected:
		take_damage(5)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				selected = !selected
				$Selection_Border.visible = !$Selection_Border.visible
