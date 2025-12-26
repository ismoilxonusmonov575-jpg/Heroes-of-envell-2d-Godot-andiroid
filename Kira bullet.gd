extends Area2D
var speed := 500
var direction := Vector2.RIGHT

func _physics_process(delta):
    position += direction * speed * delta
    if position.x > 2000: queue_free()

func _on_body_entered(body):
    if body.is_in_group("enemies"):
        body.hp -= 20
        queue_free()
