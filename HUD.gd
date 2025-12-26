extends CanvasLayer

var score_p1 := 0
var score_p2 := 0

func _ready():
    $ScoreLabelP1.text = str(score_p1)
    $ScoreLabelP2.text = str(score_p2)

func add_score(player, points):
    if player == 1:
        score_p1 += points
        $ScoreLabelP1.text = str(score_p1)
    elif player == 2:
        score_p2 += points
        $ScoreLabelP2.text = str(score_p2)
