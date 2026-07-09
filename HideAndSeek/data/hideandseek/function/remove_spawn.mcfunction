# ============================================================
# HideAndSeek : remove_spawn
# Removes a hider spawn by its GLOBAL id (shown by list_spawns).
# Usage:
#   /scoreboard players set @s hs_input <spawnId>
#   /function hideandseek:remove_spawn
# ============================================================

scoreboard players operation #global hs_target = @s hs_input
execute as @e[type=armor_stand,tag=hs_hiderspawn] if score @s hs_spawnid = #global hs_target run kill @s

tellraw @s [{"text":"[HideAndSeek] ","color":"dark_green"},{"text":"Removed spawn with id ","color":"green"},{"score":{"name":"#global","objective":"hs_target"}},{"text":" (if it existed).","color":"green"}]
