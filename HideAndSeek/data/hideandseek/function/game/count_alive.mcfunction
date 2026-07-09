# Counts remaining alive hiders into #global hs_alivecnt.
scoreboard players set #global hs_alivecnt 0
execute as @a[tag=hs_hider,tag=hs_alive] run scoreboard players add #global hs_alivecnt 1
