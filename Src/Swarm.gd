extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed := 100.0
export var downtime := 1.0
export var direction := 1.0
export var elapsed := 0.0
export var down := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if down:
		position.y += speed * delta
		elapsed += delta
		if elapsed >= downtime:
			down = false
			elapsed = 0
	else:
		position.x += speed * direction * delta
	if get_child_count() <= 2:
		get_tree().change_scene("res://Src/Win.tscn")


func _on_LeftNotifier_screen_exited():
	direction = 1.0
	down = true


func _on_RightNotifier_screen_exited():
	direction = -1.0
	down = true
