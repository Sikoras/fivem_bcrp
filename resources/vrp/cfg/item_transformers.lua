
local cfg = {}

-- define static item transformers
-- see https://github.com/ImagicTheCat/vRP to understand the item transformer concept/definition

cfg.item_transformers = {
  -- example of harvest item transformer
  {
    name="Water bottles tree", -- menu name
    -- permission = "harvest.water_bottle", -- you can add a permission
    r=0,g=125,b=255, -- color
    max_units=10,
    units_per_minute=5,
    x=1861,y=3680.5,z=33.26, -- pos
    radius=5, height=1.5, -- area
    action="Harvest", -- action name
    description="Harvest some water bottles.", -- action description
    in_money=0, -- money taken per unit
    out_money=0, -- money earned per unit
    reagents={}, -- items taken per unit
    products={ -- items given per unit
      ["water"] = 1
    }
  }
}

-- define transformers randomly placed on the map
cfg.hidden_transformers = {
  ["weed field"] = {
    def = {
      name="Weed field", -- menu name
      -- permission = "harvest.water_bottle", -- you can add a permission
      r=0,g=200,b=0, -- color
      max_units=30,
      units_per_minute=1,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      action="Harvest", -- action name
      description="Harvest some weed.", -- action description
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={ -- items given per unit
        ["weed"] = 1
      }
    },
    positions = {
      {2226.32397460938,5578.3203125,53.7372283935547}
    }
  },
  ["cocaine import"] = {
  	  def = {
	  	  name="Cocaine Import",
		  -- permission = "harvest.water_bottle",
		  r=0,g=200,b=0,
		  max_units = 30,
		  units_per_minute=1m
		  x=0,y=0,z=0,
		  radius=5, height = 1.5,
		  action="Harvest",
		  description="Harvest some cocaine",
		  in_money=0,
		  out_money=0,
		  reagents={},
		  products=={
		  	  ["cocaine"] = 1
		  }
	  },
	  positions = {
	  	  {3372.4970703125,5183.51953125,1.46024107933044}
	  }
  }
}

-- time in minutes before hidden transformers are relocated (min is 5 minutes)
cfg.hidden_transformer_duration = 5*24*60 -- 5 days

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
  infos = {
    ["weed field"] = 20000,
	["cocaine import"] = 20000
  },
  positions = {
    {1821.12390136719,3685.9736328125,34.2769317626953},
    {1804.2958984375,3684.12280273438,34.217945098877}
  },
  interval = 60, -- interval in minutes for the reseller respawn
  duration = 10, -- duration in minutes of the spawned reseller
  blipid = 133,
  blipcolor = 2
}

return cfg
