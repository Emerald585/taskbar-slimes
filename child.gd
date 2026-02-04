extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var jumping = false
var directions = [1, 2]
var delay = [0.5, 1, 1.5, 2]

func _ready() -> void:
	pass

func prepjump():
	if is_on_floor() and jumping == true:
		$AnimatedSprite2D.play("Idle")
		velocity.x = 0
		await get_tree().create_timer(0.6).timeout
		jumping = false
	await get_tree().create_timer(0.6).timeout
	prepjump()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	prepjump()
	if is_on_floor() and jumping == false:
		var jumpdirect
		jumping = true
		$AnimatedSprite2D.play("Jump")
		await get_tree().create_timer(0.6).timeout
		velocity.y = JUMP_VELOCITY
		await get_tree().create_timer(0.1).timeout
		jumpdirect = directions.pick_random()
		if jumpdirect == 1:
			velocity.x = SPEED
		elif jumpdirect == 2:
			velocity.x = SPEED - SPEED * 2
		$AnimatedSprite2D.play("Fall")
	
	if $TextureButton.is_pressed():
		position = get_viewport().get_mouse_position()
		position.y += 30
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("Dangle")
	if position.y > 1250.0:
		position.y = -18
		

	move_and_slide()
