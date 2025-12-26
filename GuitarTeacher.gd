extends CharacterBody2D

var speed := 150
var ability_cooldown := 5.0
var ability_timer := 0.0

func _physics_process(delta):
    position.x += speed * get_process_delta_time()
    if position.x < 0 or position.x > 1024: speed *= -1
    if ability_timer > 0: ability_timer -= get_process_delta_time()
    else:
        use_ability()
        ability_timer = ability_cooldown

func use_ability():
    print("Gitarachi: qahramonlarga buff beradi!")
    for player in get_parent().get_children():
        if player.is_in_group("players") and position.distance_to(player.position) < 300:
            player.speed += 50
            yield(get_tree().create_timer(3.0), "timeout")
            player.speed -= 50
