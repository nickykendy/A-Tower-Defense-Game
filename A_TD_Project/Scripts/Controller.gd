class_name Controller
extends KinematicBody2D

var card: Card = null
var state: String = "free"
var deck: Array
var pile: Array
var hands: Array
var handCards: Array
var handLimit = 5
var data = null

const CARD_WIDTH: float = 45.0
const SPACE: float = 10.0
const CARD: Resource = preload("res://Scenes/Card.tscn")
const TOWER: Resource = preload("res://Scenes/Tower.tscn")

signal DeckChange
signal PileChange

func _ready():
	randomize()
	data = get_node("/root/Data")
	deck = data.INITDECK
	deck.shuffle()
	
	
func _process(delta):
	# custom cursor
	position = get_global_mouse_position()
	# init some varibles
	var _leftMouse = Input.is_mouse_button_pressed(BUTTON_LEFT)
	var _play = Input.is_action_just_pressed("ui_accept")
	
	if _play:
		var dealNum = handLimit - hands.size()
		if dealNum > 0:
			deal(dealNum)

	# state: selected, held, free
	if state == "selected" and card != null:
		if _leftMouse:
			if card.has_method("change_state"):
				card.change_state("held")
			state = "held"
	elif state == "held" and card != null:
		if !_leftMouse:
			if card.has_method("change_state"):
				card.change_state("free")
			card = null
			state = "free"

# deal cards by num into hands
func deal(num: int) -> void:
	var left = transport(num, deck, hands)
	if left > 0:
		recycle()
		transport(left, deck, hands)
	var length = hands.size()
	for i in length:
		var _card = draw(i)
		handCards.append(_card)
	fix_pos()
	emit_signal("DeckChange", deck.size())

# recycle the pile into the deck
func recycle() -> void:
	transport(-1, pile, deck)
	deck.shuffle()

# transport an array of deck into another one: -1 all
func transport(cardNum: int, oldDeck: Array, newDeck: Array) -> int:
	var length = oldDeck.size()
	var num = cardNum
	var left = 0
	
	if cardNum == -1:
		num = length
	elif cardNum > length:
		num = length
		left = cardNum - length
	
	for i in num:
		newDeck.append(oldDeck[i])
		oldDeck.remove(i)
	
	return left

# recalculate the position of every card in hand
func fix_pos():
	var newPos = 0
	var index = 0
	var length = handCards.size()
	
	if length == 0:
		index = 0
	else:
		index = length - 1
	
	for i in length:
		newPos = -CARD_WIDTH*index/2-SPACE*index/2+(CARD_WIDTH+SPACE)*i
		handCards[i].position.x = newPos
		handCards[i].save_pos(handCards[i].position)

# draw a single card and create its instance
func draw(index: int) -> Card:
	var _card = CARD.instance()
	var player = get_node("/root/World/Player")
	player.add_child(_card)
	_card.set_meta("id", deck[index])
	_card.sprite.texture = (load(data.get_card_by_id(deck[index])["sprite"]))
	return _card
