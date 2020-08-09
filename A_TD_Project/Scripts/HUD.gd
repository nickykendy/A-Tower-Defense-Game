extends Position2D

onready var deckNum = $Deck/DeckNum
onready var pileNum = $Pile/PileNum
onready var SelectedDesc = $Selected/SelectedCardDesc
onready var HoverDesc = $Hover/HoverCardDesc

var data = null


func _ready():
	data = get_node("/root/Data")
	deckNum.text = String(data.INITDECK.size())
	pileNum.text = String(0)


func _on_Controller_DeckChange(num):
	deckNum.text = String(num)


func _on_Controller_DiscardPileChange(num):
	pileNum.text = String(num)


func _on_Controller_SelectChange(cardId: String) -> void:
	if cardId != "":
		var desc = data.get_card_by_id(cardId)["desc"]
		SelectedDesc.text = desc
	else:
		SelectedDesc.text = ""
