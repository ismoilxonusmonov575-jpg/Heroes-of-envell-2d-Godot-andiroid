extends CharacterBody2D

@export var player_id := 1
var speed := 300
var jump_force := -450
var gravity := 900
var max_hp := 100
var hp := max_hp
var ability_cooldown := 2.0
var ability_timer := 0.0

func _physics_process(delta):
    var velocity = Vector2.ZERO
    if player_id == 1:
        if Input.is_action_pressed("ui_right"): velocity.x += 1
        if Input.is_action_pressed("ui_left"): velocity.x -= 1
        if Input.is_action_just_pressed("ui_up") and is_on_floor(): velocity.y = jump_force
        if Input.is_action_just_pressed("ui_accept") and ability_timer <= 0:
            use_ability()
            ability_timer = ability_cooldown
    velocity = velocity.normalized() * speed
    if not is_on_floor(): velocity.y += gravity * delta
    move_and_slide(velocity, Vector2.UP)
    if ability_timer > 0: ability_timer -= delta

func use_ability():
    print("Kira ability ishladi!")
    var bullet = preload("res://Bullets/KiraBullet.tscn").instantiate()
    bullet.position = position + Vector2(50,0)
    get_parent().add_child(bullet)
