# ============================================================
# HideAndSeek : set_border
# Sets the currently-selected arena's world border size.
# Usage:
#   /scoreboard players set @s hs_input <size>
#   /function hideandseek:set_border
# Supported range: 10-600 blocks.
# ============================================================

scoreboard players operation #global hs_target = @s hs_input
execute as @e[type=armor_stand,tag=hs_center] if score @s hs_arenaid = #global hs_selarena run scoreboard players operation @s hs_border = #global hs_target

tellraw @s [{"text":"[HideAndSeek] ","color":"dark_green"},{"text":"Border size for arena #","color":"green"},{"score":{"name":"#global","objective":"hs_selarena"}},{"text":" set to ","color":"green"},{"score":{"name":"#global","objective":"hs_target"}},{"text":" blocks.","color":"green"}]
