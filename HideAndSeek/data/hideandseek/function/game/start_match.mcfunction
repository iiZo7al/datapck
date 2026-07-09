# ============================================================
# HideAndSeek : game/start_match
# Ends the hiding phase and begins the 10-minute seeking phase:
# centers + snaps the world border to the arena's configured
# size, then starts it shrinking to 20 blocks over 600 seconds.
# ============================================================

scoreboard players set #global hs_state 2
scoreboard players set #global hs_timer 600
scoreboard players set #global hs_ticks 0
scoreboard players set #global hs_dangerflag 0

execute as @e[type=armor_stand,tag=hs_center] if score @s hs_arenaid = #global hs_selarena at @s run worldborder center ~ ~
execute as @e[type=armor_stand,tag=hs_center] if score @s hs_arenaid = #global hs_selarena run scoreboard players operation #global hs_border = @s hs_border

function hideandseek:util/apply_border
worldborder set 20 600
worldborder warning distance 10
worldborder warning time 20

bossbar set hideandseek:timer max 600
bossbar set hideandseek:timer value 600
bossbar set hideandseek:timer color green
bossbar set hideandseek:timer name [{"text":"Hide and Seek - match in progress","color":"green"}]

function hideandseek:game/update_hud

tellraw @a [{"text":"[HideAndSeek] ","color":"gold"},{"text":"The Seeker is released! Good luck!","color":"gold","bold":true}]
title @a title [{"text":"GO!","color":"red","bold":true}]
title @a subtitle [{"text":"The Seeker has been released","color":"yellow"}]
