# ============================================================
# HideAndSeek : game/start
# Begins a new match: validates player/arena counts, resets
# temporary state, randomly picks the arena + seeker, teleports
# everyone, gives kits, and begins the 30s hiding phase.
# ============================================================

execute unless score #global hs_state matches 0 run return 0

# --- Count participating players (everyone currently online) ---
scoreboard players set #global hs_playercnt 0
execute as @a run scoreboard players add #global hs_playercnt 1

execute if score #global hs_playercnt matches ..1 run tellraw @a [{"text":"[HideAndSeek] ","color":"red"},{"text":"Need at least 2 players to start!","color":"red"}]
execute if score #global hs_playercnt matches ..1 run return 0

# --- Make sure at least one arena exists ---
scoreboard players set #global hs_arenacnt 0
execute as @e[type=armor_stand,tag=hs_center] run scoreboard players add #global hs_arenacnt 1

execute if score #global hs_arenacnt matches ..0 run tellraw @a [{"text":"[HideAndSeek] ","color":"red"},{"text":"No arenas exist yet! An admin must run /function hideandseek:create_arena","color":"red"}]
execute if score #global hs_arenacnt matches ..0 run return 0

# --- Enter hiding phase ---
scoreboard players set #global hs_state 1
scoreboard players set #global hs_hide 30
scoreboard players set #global hs_ticks 0
scoreboard players set #global hs_dangerflag 0

tag @a add hs_ingame
clear @a
effect clear @a
gamemode survival @a

function hideandseek:game/choose_arena

# --- Give every participant a stable 0-based index for random seeker pick ---
scoreboard players set #global hs_idx 0
execute as @a[tag=hs_ingame] run function hideandseek:game/assign_index

function hideandseek:util/roll_100
scoreboard players operation #global hs_target = #global hs_rng
scoreboard players operation #global hs_target %= #global hs_playercnt

execute as @a[tag=hs_ingame] if score @s hs_tempidx = #global hs_target run function hideandseek:game/make_seeker
execute as @a[tag=hs_ingame,tag=!hs_seeker] run function hideandseek:game/make_hider

# --- Bossbar for the hiding countdown ---
bossbar set hideandseek:timer visible true
bossbar set hideandseek:timer color yellow
bossbar set hideandseek:timer max 30
bossbar set hideandseek:timer value 30
bossbar set hideandseek:timer name [{"text":"Hide! The Seeker is blinded...","color":"yellow"}]

tellraw @a [{"text":"[HideAndSeek] ","color":"gold"},{"text":"Match starting! Hiders have 30 seconds to hide.","color":"gold"}]
