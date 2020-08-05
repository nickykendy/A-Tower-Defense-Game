class_name Controller
extends KinematicBody2D

var cardId : String
var deck : Array
var pile : Array
var hands : Array # the data of every card in hands
var handCards: Array # the instance of every card in hands
var handLimit: int = 5
var data = null
var tower : Tower
var _level
var _grid : Vector2

const CARD_WIDTH : float = 45.0
const SPACE : float = 10.0
const CARD : Resource = preload("res://Scenes/Card.tscn")
const TOWER : Resource = preload("res://Scenes/Tower.tscn")
const OFFSET : float = 20.0

signal DeckChange
signal PileChange
signal SelectChange

func _ready():
	randomize()
	data = get_node("/root/Data")
	deck = data.INITDECK
	deck.shuffle()
	_level = get_node("/root/World/Level")
	
func _process(delta):
	# custom cursor
	position = get_global_mouse_position()
	# init some varibles
	var _leftMouse = Input.is_mouse_button_pressed(BUTTON_LEFT)
	var _play = Input.is_action_just_pressed("ui_accept")
	# deal cards on play
	if _play:
		var dealNum = handLimit - hands.size()
		if dealNum > 0:
			deal(dealNum)
			
	if _leftMouse:
		# check build tower
		if check_cast_condition():
			var i = -1
			for _card in handCards:
				i = i + 1
				if _card != null and _card.isSelected:
					_card.queue_free()
					handCards.remove(i)
					fix_pos()
					cardId = ""
			
			if tower.has_method("begin_construct"):
				tower.begin_construct()
				tower = null
			
		# clear what's holding
		if cardId != "":
			cardId = ""
			delete_tower(tower)
			
		# clear select status for every card in hands
		for _card in handCards:
			if _card != null and _card.isSelected:
				_card.change_select(false)
				
		# select the card which is hover
		for _card in handCards:
			if _card != null and _card.state == "hover":
				_card.change_select(true)
				cardId = _card.cardId
				tower = create_tower(cardId)
				emit_signal("SelectChange", cardId)

	# reposition the tower in the base square
	if tower != null:
		if _level.has_method("is_in_base"):
			if _level.is_in_base(position):
				_grid = _level.world_to_grid(position)
				tower.position = _level.grid_to_world(_grid) + Vector2(OFFSET, OFFSET)
			else:
				tower.position = position

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
	var _hud = get_node("/root/World/HUD")
	var _cardId = hands[index]
	_hud.add_child(_card)
	_card.set_meta("id", _cardId)
	_card.sprite.texture = (load(data.get_card_by_id(_cardId)["cardSprite"]))
	_card.cardId = _cardId
	return _card
	
func create_tower(id):
	var _tower = TOWER.instance()
	var _world = get_node("/root/World")
	_world.add_child(_tower)
	_tower.set_meta("id", id)
	_tower.sprite.texture = (load(data.get_card_by_id(id)["towerSprite"]))
	_tower.towerId = id
	return _tower
	
func delete_tower(obj) -> void:
	if obj != null:
		obj.queue_free()

func check_cast_condition() -> bool:
	var result = false
	if tower != null:
		if _level.has_method("is_in_base"):
			if _level.is_in_base(position):
				result = true
	
	return result
