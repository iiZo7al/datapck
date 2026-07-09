# Executed "as" a hider who was just found/killed.
tag @s remove hs_alive
gamemode spectator @s
tellraw @s [{"text":"[HideAndSeek] ","color":"red"},{"text":"You were found! Spectating the rest of the match.","color":"red"}]
