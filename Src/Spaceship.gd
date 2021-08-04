extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed := 800.0
onready var Laser = load("res://Src/Laser.tscn")
export var good := true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var viewport_rect = get_viewport_rect()
	var width = $Sprite.get_rect().size.x * scale.x
	var parent = get_parent()
	if Input.is_action_pressed("move_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
	position.x = clamp(position.x, width * 0.5, viewport_rect.size.x - width * 0.5)
	if Input.is_action_just_pressed("attack"):
		var laser = Laser.instance()
		laser.position = position
		parent.add_child(laser)
