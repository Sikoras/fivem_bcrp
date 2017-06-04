
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permission (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
  ["Ammunation"] = {
    _config = {blipid=156,blipcolor=1},
    ["WEAPON_PISTOL"] = {"Pistol",800,15,""},
    ["WEAPON_COMBATPISTOL"] = {"Combat Pistol",1500,15,""},
    ["WEAPON_PUMPSHOTGUN"] = {"Pump Shotgun",500,70,""},
    ["WEAPON_KNIFE"] = {"Knife",50,0,""}
  },
  ["Police"] = {
    _config = {blipid=156,blipcolor=1,permission="police.cloakroom"},
    ["WEAPON_PISTOL"] = {"Pistol",0,15,""},
    ["WEAPON_COMBATPISTOL"] = {"Combat Pistol",0,15,""},
    ["WEAPON_PUMPSHOTGUN"] = {"Pump Shotgun",0,70,""},
    ["WEAPON_CARBINERIFLE"] = {"Carbine Rifle",0,50,""},
    ["WEAPON_SMG"] = {"SWAT SMG",0,25,""},
    ["WEAPON_BZGAS"] = {"Tear Gas",0,0,""},
    ["WEAPON_NIGHTSTICK"] = {"Nighstick",0,0,""}
  }
}

-- list of gunshops positions

cfg.gunshops = {
  {"Ammunation", 1692.41, 3758.22, 34.7053},
  {"Ammunation", 252.696, -48.2487, 69.941},
  {"Ammunation", 844.299, -1033.26, 28.1949},
  {"Ammunation", -331.624, 6082.46, 31.4548},
  {"Ammunation", -664.147, -935.119, 21.8292},
  {"Ammunation", -1320.983, -389.260, 36.483},
  {"Ammunation", -1119.48803710938,2697.08666992188,18.5541591644287},
  {"Ammunation", 2569.62, 294.453, 108.735},
  {"Ammunation", -3172.60375976563,1085.74816894531,20.8387603759766},
  {"Ammunation", 21.70, -1107.41, 29.79},
  {"Ammunation", 810.15, -2156.88, 29.61},
  {"Police", 452.353393554688,-980.096984863281,30.6896095275879}
  
}

return cfg
