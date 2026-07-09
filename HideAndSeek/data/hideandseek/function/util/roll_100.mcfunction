# ============================================================
# HideAndSeek : util/roll_100
# Produces a uniformly-random integer in range 1-100, stored
# in "#global hs_rng". Minecraft 1.20.1 has no /random command,
# so this uses a well-known workaround: a loot table with 100
# weighted entries (item count 1..100) is spawned at a fixed
# utility coordinate high in the sky, then the resulting item
# stack's count is read into a scoreboard value and the item
# is destroyed. This is 100% vanilla and multiplayer-safe.
# ============================================================

kill @e[type=item,x=8,y=310,z=8,distance=..3]
loot spawn 8 310 8 loot hideandseek:random_100
execute store result score #global hs_rng run data get entity @e[type=item,limit=1,sort=nearest,x=8,y=310,z=8,distance=..3] Item.count
kill @e[type=item,x=8,y=310,z=8,distance=..3]
