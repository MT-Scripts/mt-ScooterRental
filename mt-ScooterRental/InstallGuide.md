Add the following code to qb-core/shared/items.lua
```
	["eletric_scooter"] = {["name"] = "eletric_scooter", 					["label"] = "Eletric Scooter", 				["weight"] = 800, 		["type"] = "item", 			["image"] = "eletric_scooter.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
```


If using ox_inventory add the following code to ox_inventory/data/items.lua
```
	-- mt-ScooterRental
	["eletric_scooter"] = {
		label = "Eletric Scooter",
		weight = 800,
		stack = false,
		close = true,
		usable = true,
		description = "",
	},
```

Add the image to qb-inventory/html/images or if using ox_inventory to ox_inventory/web/images

Install the scooter model from https://pt.gta5-mods.com/vehicles/portuguese-electric-sharing-scooter-addon-livery-map-editor-xml