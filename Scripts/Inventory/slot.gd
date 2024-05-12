extends TextureRect

signal slot_entered(slot)
signal slot_exited(slot)
@onready var filter_color = $"filter(color)"

var slot_id
var is_mouse_hovering = false
enum states {DEFAULT,TAKEN,FREE}
var slot_state = states.DEFAULT
var item_stored = null

func set_color(a_state = states.DEFAULT) -> void:
	match a_state:
		states.DEFAULT:
			filter_color.color = Color(Color.WHITE,0.0)
		states.TAKEN:
			filter_color.color = Color(Color.RED,0.2)
		states.FREE:
			filter_color.color = Color(Color.GREEN,0.2)
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_global_rect().has_point(get_global_mouse_position()):
		if not is_mouse_hovering:
			is_mouse_hovering = true
			emit_signal("slot_entered",self)
	else:
		if is_mouse_hovering:
			is_mouse_hovering = false
			emit_signal("slot_exited",self)
