# ============================================================
# HideAndSeek : game/hide_tick
# Runs every tick while state == 1 (hiding phase). Only does
# real work once every 20 ticks (once per second).
# ============================================================

scoreboard players add #global hs_ticks 1
execute unless score #global hs_ticks matches 20 run return 0
scoreboard players set #global hs_ticks 0

scoreboard players remove #global hs_hide 1
execute store result bossbar hideandseek:timer value run scoreboard players get #global hs_hide

execute if score #global hs_hide matches ..0 run function hideandseek:game/start_match
execute unless score #global hs_hide matches ..0 run function hideandseek:game/hide_display
