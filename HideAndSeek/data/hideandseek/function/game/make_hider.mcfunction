# ============================================================
# HideAndSeek : game/make_hider
# Executed "as" each remaining player. Assigns the hider role,
# team, a random spawn, and kit.
# ============================================================

team join hs_hider @s
tag @s add hs_hider
tag @s add hs_alive
scoreboard players set @s hs_role 2
scoreboard players set @s hs_alive 1
scoreboard players set @s hs_deaths 0

function hideandseek:util/tp_random_hider_spawn

item replace entity @s armor.head with minecraft:leather_helmet{display:{color:255}}
item replace entity @s armor.chest with minecraft:leather_chestplate{display:{color:255}}
item replace entity @s armor.legs with minecraft:leather_leggings{display:{color:255}}
item replace entity @s armor.feet with minecraft:leather_boots{display:{color:255}}
item replace entity @s weapon.mainhand with minecraft:wooden_sword
item replace entity @s hotbar.8 with minecraft:cooked_beef 8

effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:saturation 1 20 true

tellraw @s [{"text":"You are a HIDER! ","color":"blue","bold":true},{"text":"Find a hiding spot before the Seeker is released.","color":"blue"}]
