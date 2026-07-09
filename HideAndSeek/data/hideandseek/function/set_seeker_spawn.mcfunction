# ============================================================
# HideAndSeek : set_seeker_spawn
# Sets (or replaces) the seeker spawn point for the currently
# selected arena, at the executing player's position.
# ============================================================

execute as @e[type=armor_stand,tag=hs_seekerspawn] if score @s hs_arenaid = #global hs_selarena run kill @s

execute at @s run summon armor_stand ~ ~ ~ {Tags:["hs_arena","hs_seekerspawn"],Marker:1b,Invisible:1b,NoGravity:1b,CustomName:'{"text":"Seeker Spawn"}',CustomNameVisible:0b}
execute as @e[type=armor_stand,tag=hs_seekerspawn,limit=1,sort=nearest] at @s run scoreboard players operation @s hs_arenaid = #global hs_selarena

tellraw @s [{"text":"[HideAndSeek] ","color":"dark_green"},{"text":"Seeker spawn set for arena #","color":"green"},{"score":{"name":"#global","objective":"hs_selarena"}},{"text":".","color":"green"}]
