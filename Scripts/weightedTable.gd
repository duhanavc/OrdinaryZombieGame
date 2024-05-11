class_name weightedTable

var items: Array[Dictionary] = []
var weightSum = 0

func add_item(item, weight: int):
	items.append({"item": item, "weight": weight })
	weightSum += weight

func removeItem(item_to_remove):
	items = items.filter(func (item): return item["item"] != item_to_remove)
	weightSum = 0
	for item in items:
		weightSum += item["weight"]

func pick_item(exclude: Array = []):
	var adjustItems: Array[Dictionary] = items
	var adjustedWeightSum = weightSum
	if exclude.size() > 0:
		adjustItems = []
		adjustedWeightSum = 0
		for item in items:
			if item["item"] in exclude:
				continue
			adjustItems.append(item)
			adjustedWeightSum += item["weight"]

	var chosenWeight = randi_range(1, adjustedWeightSum)
	var iterationSum = 0
	for item in adjustItems:
		iterationSum += item["weight"]
		if chosenWeight <= iterationSum:
			return item["item"]
