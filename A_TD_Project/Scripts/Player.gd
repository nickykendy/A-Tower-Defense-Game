extends Position2D

onready var deckNum = $Deck/DeckNum
onready var pileNum = $Pile/PileNum
var data = null

func _ready():
	data = get_node("/root/Data")
	deckNum.text = String(data.INITDECK.size())
	pileNum.text = String(0)

func _on_Controller_DeckChange(num):
	deckNum.text = String(num)

func _on_Controller_PileChange():
	pass # Replace with function body.
