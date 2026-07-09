# ============================================================
# HideAndSeek : util/tp_random_hider_spawn
# Teleports the executing player (@s) to a RANDOM hider-spawn
# marker belonging to the currently selected arena. Relies on
# game/choose_arena having already re-indexed every spawn's
# hs_localid to a contiguous 0..(count-1) range this match.
# ============================================================

function hideandseek:util/roll_100
scoreboard players operation #global hs_target = #global hs_rng
scoreboard players operation #global hs_target %= #global hs_spawncnt

tag @s add hs_tp_target
execute as @e[type=armor_stand,tag=hs_hiderspawn] if score @s hs_arenaid = #global hs_selarena if score @s hs_localid = #global hs_target at @s run tp @a[tag=hs_tp_target,limit=1] ~ ~ ~
tag @s remove hs_tp_target
