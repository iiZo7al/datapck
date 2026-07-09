# ============================================================
# HideAndSeek : util/tp_to_seeker_spawn
# Teleports the executing player (@s) to the seeker-spawn
# marker entity belonging to the currently selected arena.
# ============================================================

tag @s add hs_tp_target
execute as @e[type=armor_stand,tag=hs_seekerspawn] if score @s hs_arenaid = #global hs_selarena at @s run tp @a[tag=hs_tp_target,limit=1] ~ ~ ~
tag @s remove hs_tp_target
