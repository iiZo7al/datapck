# ============================================================
# HideAndSeek : game/choose_arena
# Randomly selects one arena for this match, counts + re-indexes
# its hider spawns (so removed spawns never leave numbering gaps).
# ============================================================

function hideandseek:util/roll_100
scoreboard players operation #global hs_selarena = #global hs_rng
scoreboard players operation #global hs_selarena %= #global hs_arenacnt
scoreboard players add #global hs_selarena 1

scoreboard players set #global hs_spawncnt 0
execute as @e[type=armor_stand,tag=hs_hiderspawn] if score @s hs_arenaid = #global hs_selarena run scoreboard players add #global hs_spawncnt 1

scoreboard players set #global hs_idx 0
execute as @e[type=armor_stand,tag=hs_hiderspawn] if score @s hs_arenaid = #global hs_selarena run function hideandseek:util/index_spawn

execute if score #global hs_spawncnt matches ..0 run tellraw @a [{"text":"[HideAndSeek] ","color":"red"},{"text":"WARNING: selected arena has no hider spawns!","color":"red"}]
