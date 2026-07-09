# ============================================================
# HideAndSeek : create_arena
# Creates a brand-new arena centered at the executing player's
# current position, and selects it for further editing (used
# by set_center, set_border, set_seeker_spawn, add_spawn...).
# Default border size is 300 blocks. Unlimited arenas supported.
# ============================================================

scoreboard players add #global hs_idseq 1

execute at @s run summon armor_stand ~ ~ ~ {Tags:["hs_arena","hs_center"],Marker:1b,Invisible:1b,NoGravity:1b,CustomName:'{"text":"Arena Center"}',CustomNameVisible:0b}

execute as @e[type=armor_stand,tag=hs_center,limit=1,sort=nearest] at @s run scoreboard players operation @s hs_arenaid = #global hs_idseq
execute as @e[type=armor_stand,tag=hs_center,limit=1,sort=nearest] at @s run scoreboard players set @s hs_border 300

scoreboard players operation #global hs_selarena = #global hs_idseq

tellraw @s [{"text":"[HideAndSeek] ","color":"dark_green"},{"text":"Arena #","color":"green"},{"score":{"name":"#global","objective":"hs_idseq"}},{"text":" created and selected for editing. Default border: 300 blocks.","color":"green"}]
