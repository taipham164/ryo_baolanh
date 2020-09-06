Config = {}
Config.Locale = 'en'

Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 2.0, y = 2.0, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}

Config.BlipHospital = {
	Sprite = 458,
	Color = 2,
	Display = 3,
	Scale = 0.5
}

Config.PriceJail = 8500 -- Edit this to your liking.
Config.PriceWanted = 2500 -- Edit this to your liking.
Config.PriceComm = 5000 -- Edit this to your liking.

Config.EnableUnemployedOnly = false -- If true it will only show Blips to Unemployed Players | false shows it to Everyone.
Config.EnableBlips = true -- If true then it will show blips | false does the Opposite.
Config.EnablePeds = true -- If true then it will add Peds on Markers | false does the Opposite.

Config.Locations = {
	{ x = 170.76, y = -993.61, z = 29.1, heading = 152.51 },
	{ x = 435.21, y = -974.8, z = 29.72, heading = 90.69 },
	{ x = 1800.95, y = 2479.83, z = -123.69, heading = 41.15 },
	{ x = 1852.65, y = 3688.94, z = 33.27, heading = 209.99 },
	{ x = -448.45, y = 6012.71, z = 30.72, heading = 306.25 },
	
}

Config.Zones = {}

for i=1, #Config.Locations, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Locations[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
