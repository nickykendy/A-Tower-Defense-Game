extends Node2D

const SPRITE = "res://Sprites/"
const CARDS = {
	"cardA": {
		"sprite": SPRITE + "Cards/Spr_card_A.png",
		"slot": "NONE"
	},
	"cardB": {
		"sprite": SPRITE + "Cards/Spr_card_B.png",
		"slot": "NONE"
	},
	"cardC": {
		"sprite": SPRITE + "Cards/Spr_card_C.png",
		"slot": "NONE"
	},
	"cardD":{
		"sprite": SPRITE + "Cards/Spr_card_D.png",
		"slot": "NONE"
	},
	"cardE":{
		"sprite": SPRITE + "Cards/Spr_card_E.png",
		"slot": "NONE"
	},
	"cardF":{
		"sprite": SPRITE + "Cards/Spr_card_F.png",
		"slot": "NONE"
	},
	"cardG":{
		"sprite": SPRITE + "Cards/Spr_card_G.png",
		"slot": "NONE"
	},
	"cardH":{
		"sprite": SPRITE + "Cards/Spr_card_H.png",
		"slot": "NONE"
	},
	"cardI":{
		"sprite": SPRITE + "Cards/Spr_card_I.png",
		"slot": "NONE"
	},
	"cardJ":{
		"sprite": SPRITE + "Cards/Spr_card_J.png",
		"slot": "NONE"
	},
	"cardK":{
		"sprite": SPRITE + "Cards/Spr_card_K.png",
		"slot": "NONE"
	},
	"cardL":{
		"sprite": SPRITE + "Cards/Spr_card_L.png",
		"slot": "NONE"
	},
	"cardM":{
		"sprite": SPRITE + "Cards/Spr_card_M.png",
		"slot": "NONE"
	},
	"cardN":{
		"sprite": SPRITE + "Cards/Spr_card_N.png",
		"slot": "NONE"
	},
	"ERROR":{
		"sprite": SPRITE + "Cards/Spr_card_back.png",
		"slot": "NONE"
	}
}

const TOWERS = {
	"TowerA":{
		"sprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire"
	},
	"ERROR":{
		"sprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire"
	}
}

const INITDECK = [
	"cardA","cardA","cardA","cardA","cardA",
	"cardB","cardB","cardB",
	"cardC","cardC","cardC","cardC","cardC",
	"cardD","cardD","cardD","cardD",
	"cardE","cardE",
	"cardF","cardF","cardF",
	"cardG",
	"cardH","cardH",
	"cardI","cardI","cardI","cardI","cardI"
]

func get_card_by_id(card_id: String) -> Array:
	if card_id in CARDS:
		return CARDS[card_id]
	else:
		return CARDS["ERROR"]

func get_tower_by_id(tower_id: String) -> Array:
	if tower_id in TOWERS:
		return TOWERS[tower_id]
	else:
		return TOWERS["ERROR"]
