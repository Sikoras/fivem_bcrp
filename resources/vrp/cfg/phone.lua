
local cfg = {}

-- size of the sms history
cfg.sms_history = 15

-- maximum size of an sms
cfg.sms_size = 500

-- duration of a sms position marker (in seconds)
cfg.smspos_duration = 300

-- define phone services
-- blipid, blipcolor (customize alert blip)
-- alert_time (alert blip display duration in seconds)
-- alert_permission (permission required to receive the alert)
-- alert_notify (notification received when an alert is sent)
-- notify (notification when sending an alert)
cfg.services = {
  ["police"] = {
    blipid = 304,
    blipcolor = 38,
    alert_time = 300, -- 5 minutes
    alert_permission = "police.service",
    alert_notify = "~r~911: Police:~n~~s~",
    notify = "~b~You called the police.",
    answer_notify = "~b~The police are coming."
  },
  ["emergency"] = {
    blipid = 153,
    blipcolor = 1,
    alert_time = 300, -- 5 minutes
    alert_permission = "emergency.service",
    alert_notify = "~r~911: EMS:~n~~s~",
    notify = "~b~You called the paramedics.",
    answer_notify = "~b~The paramedics are coming."
  },
  ["taxi"] = {
    blipid = 198,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "taxi.service",
    alert_notify = "~y~Call a Taxi:~n~~s~",
    notify = "~y~You called a taxi.",
    answer_notify = "~y~A taxi is coming."
  }
}

return cfg
