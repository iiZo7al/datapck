# ============================================================
# HideAndSeek : game/match_tick
# Runs every tick while state == 2 (seeking phase). Only does
# real work once every 20 ticks (once per second): counts down
# the timer, checks for deaths, refreshes the HUD, checks the
# danger threshold, and evaluates win conditions.
# ============================================================

scoreboard players add #global hs_ticks 1
execute unless score #global hs_ticks matches 20 run return 0
scoreboard players set #global hs_ticks 0

scoreboard players remove #global hs_timer 1
execute store result bossbar hideandseek:timer value run scoreboard players get #global hs_timer

function hideandseek:game/hider_died_check
function hideandseek:game/count_alive
function hideandseek:game/update_hud
function hideandseek:game/danger_check

execute if score #global hs_alivecnt matches ..0 run function hideandseek:game/seeker_wins
execute if score #global hs_timer matches ..0 unless score #global hs_alivecnt matches ..0 run function hideandseek:game/hiders_win
