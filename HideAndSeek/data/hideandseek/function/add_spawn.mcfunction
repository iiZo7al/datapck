# ============================================================
# HideAndSeek : add_spawn
# Adds a new hider spawn point to the currently-selected arena
# at the executing player's position. Unlimited spawns per
# arena are supported - a random one is chosen each match.
# ============================================================

scoreboard players add #global hs_idseq 1

execute at @s run summon armor_stand ~ ~ ~ {Tags:["hs_arena","hs_hiderspawn"],Marker:1b,Invisible:1b,NoGravity:1b,CustomName:'{"text":"Hider Spawn"}',CustomNameVisible:0b}
execute as @e[type=armor_stand,tag=hs_hiderspawn,limit=1,sort=nearest] at @s run scoreboard players operation @s hs_arenaid = #global hs_selarena
execute as @e[type=armor_stand,tag=hs_hiderspawn,limit=1,sort=nearest] at @s run scoreboard players operation @s hs_spawnid = #global hs_idseq

tellraw @s [{"text":"[HideAndSeek] ","color":"dark_green"},{"text":"Hider spawn added to arena #","color":"green"},{"score":{"name":"#global","objective":"hs_selarena"}},{"text":" (id ","color":"green"},{"score":{"name":"#global","objective":"hs_idseq"}},{"text":"). Use /function hideandseek:list_spawns to view all.","color":"green"}]
