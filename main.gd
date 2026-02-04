extends Node

const CHILD = preload("res://slime1.tscn")
const CHILD2 = preload("res://slime2.tscn")
const CHILD3 = preload("res://slime3.tscn")
const OPTIONS = [CHILD,CHILD2,CHILD3]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$StaticBody2D/CollisionShape2D2.shape.size.y = DisplayServer.screen_get_size().y
	$StaticBody2D/CollisionShape2D2.position.y = DisplayServer.screen_get_size().y / 2
	$StaticBody2D/CollisionShape2D3.shape.size.y = DisplayServer.screen_get_size().y
	$StaticBody2D/CollisionShape2D3.position.y = DisplayServer.screen_get_size().y / 2
	$StaticBody2D/CollisionShape2D.shape.size.x = DisplayServer.screen_get_size().x
	if OS.get_name() == "Windows":
		$StaticBody2D/CollisionShape2D.position.y = DisplayServer.screen_get_size().y - 50
		$Label.position = DisplayServer.screen_get_size() - Vector2i(100,100)
	else:
		$StaticBody2D/CollisionShape2D.position.y = DisplayServer.screen_get_size().y
		$Label.position = DisplayServer.screen_get_size() - Vector2i(100,30)



#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#add_child(OPTIONS.pick_random().instantiate())
