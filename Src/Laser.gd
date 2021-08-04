extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed := -1200.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta
	var bodies := get_overlapping_bodies()
	for body in bodies:
		if not body.good:
			body.hit = true
			body.queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
