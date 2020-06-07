extends Node2D

const SPRITE = "res://Sprites/"
const CARDS = {
	"cardA": {
		"cardSprite": SPRITE + "Cards/Spr_card_A.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card A."
	},
	"cardB": {
		"cardSprite": SPRITE + "Cards/Spr_card_B.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card B."
	},
	"cardC": {
		"cardSprite": SPRITE + "Cards/Spr_card_C.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card C."
	},
	"cardD":{
		"cardSprite": SPRITE + "Cards/Spr_card_D.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card D."
	},
	"cardE":{
		"cardSprite": SPRITE + "Cards/Spr_card_E.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card E."
	},
	"cardF":{
		"cardSprite": SPRITE + "Cards/Spr_card_F.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card F."
	},
	"cardG":{
		"cardSprite": SPRITE + "Cards/Spr_card_G.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card G."
	},
	"cardH":{
		"cardSprite": SPRITE + "Cards/Spr_card_H.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card H."
	},
	"cardI":{
		"cardSprite": SPRITE + "Cards/Spr_card_I.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card I."
	},
	"cardJ":{
		"cardSprite": SPRITE + "Cards/Spr_card_J.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card J."
	},
	"cardK":{
		"cardSprite": SPRITE + "Cards/Spr_card_K.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card K."
	},
	"cardL":{
		"cardSprite": SPRITE + "Cards/Spr_card_L.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card L."
	},
	"cardM":{
		"cardSprite": SPRITE + "Cards/Spr_card_M.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card M."
	},
	"cardN":{
		"cardSprite": SPRITE + "Cards/Spr_card_N.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "This is card N."
	},
	"ERROR":{
		"cardSprite": SPRITE + "Cards/Spr_card_back.png",
		"towerSprite": SPRITE + "Towers/Tower_A.png",
		"name": "Tower A",
		"cost": 10,
		"buildTime": 2.0,
		"attack": 5,
		"rate": 0.5,
		"range": 5,
		"attribute": "fire",
		"desc": "Error."
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
