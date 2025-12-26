extends CharacterBody2D

var speed := 100
var direction := 1
var hp := 50

func _physics_process(delta):
    move_and_slide(Vector2(speed * direction,0))
    if position.x < 0 or position.x > 1024: direction *= -1
