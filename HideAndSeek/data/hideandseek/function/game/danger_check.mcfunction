# Fires the one-time "danger" escalation when 60 seconds remain.
execute if score #global hs_timer matches ..60 if score #global hs_dangerflag matches 0 run function hideandseek:game/trigger_danger
