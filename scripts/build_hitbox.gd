extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var playerCoins = body.Coins
		var cost = get_meta("cost")
		if cost == null:
			cost = 1 # default fallback
		
		if (playerCoins - cost) >= 0:
			body.AddCoin((0 - cost))
			var itemName = get_meta("ItemName")
			if not itemName == null:
				var item = get_tree().get_current_scene().get_node(itemName)
				print(item)
				item.OnBuild()
