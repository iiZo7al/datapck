# ============================================================
# HideAndSeek : list_arenas
# Bonus helper - lists every arena that currently exists,
# with its id, border size, and coordinates.
# ============================================================

tellraw @s [{"text":"[HideAndSeek] ","color":"dark_green"},{"text":"Existing arenas:","color":"gold"}]

tag @s add hs_edit_ref
execute as @e[type=armor_stand,tag=hs_center] run tellraw @a[tag=hs_edit_ref] [{"text":"  - Arena #","color":"yellow"},{"score":{"name":"@s","objective":"hs_arenaid"}},{"text":"  border=","color":"yellow"},{"score":{"name":"@s","objective":"hs_border"}},{"text":"  @ ","color":"white"},{"nbt":"Pos","entity":"@s","color":"white"}]
tag @s remove hs_edit_ref
