# ============================================================
# HideAndSeek : list_spawns
# Lists every hider spawn belonging to the currently-selected
# arena, with its global id and coordinates.
# ============================================================

tellraw @s [{"text":"[HideAndSeek] ","color":"dark_green"},{"text":"Hider spawns for arena #","color":"gold"},{"score":{"name":"#global","objective":"hs_selarena"}},{"text":":","color":"gold"}]

tag @s add hs_edit_ref
execute as @e[type=armor_stand,tag=hs_hiderspawn] if score @s hs_arenaid = #global hs_selarena run tellraw @a[tag=hs_edit_ref] [{"text":"  - id ","color":"yellow"},{"score":{"name":"@s","objective":"hs_spawnid"}},{"text":" @ ","color":"yellow"},{"nbt":"Pos","entity":"@s","color":"white"}]
tag @s remove hs_edit_ref
