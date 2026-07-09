# Detects hiders whose death count increased since kit-time
# (i.e. the Seeker killed them) and converts them to spectators.
execute as @a[tag=hs_hider,tag=hs_alive] if score @s hs_deaths matches 1.. run function hideandseek:game/mark_dead
