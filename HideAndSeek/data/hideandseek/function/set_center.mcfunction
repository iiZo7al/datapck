# ============================================================
# HideAndSeek : set_center
# Moves the currently-selected arena's center marker to the
# executing player's current position.
# ============================================================

tag @s add hs_edit_ref
execute as @e[type=armor_stand,tag=hs_center] if score @s hs_arenaid = #global hs_selarena run tp @s @a[tag=hs_edit_ref,limit=1]
tag @s remove hs_edit_ref

tellraw @s [{"text":"[HideAndSeek] ","color":"dark_green"},{"text":"Center of arena #","color":"green"},{"score":{"name":"#global","objective":"hs_selarena"}},{"text":" moved to your position.","color":"green"}]
