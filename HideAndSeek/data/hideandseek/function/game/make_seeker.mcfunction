# ============================================================
# HideAndSeek : game/make_seeker
# Executed "as" the chosen player. Assigns the seeker role,
# team, spawn position, kit, and the opening handicap effects.
# ============================================================

team join hs_seeker @s
tag @s add hs_seeker
scoreboard players set @s hs_role 1
scoreboard players set @s hs_deaths 0

function hideandseek:util/tp_to_seeker_spawn

item replace entity @s armor.head with minecraft:leather_helmet{display:{color:16711680}}
item replace entity @s armor.chest with minecraft:leather_chestplate{display:{color:16711680}}
item replace entity @s armor.legs with minecraft:leather_leggings{display:{color:16711680}}
item replace entity @s armor.feet with minecraft:leather_boots{display:{color:16711680}}
item replace entity @s weapon.mainhand with minecraft:iron_sword
item replace entity @s hotbar.8 with minecraft:cooked_beef 8

effect give @s minecraft:blindness 30 1 true
effect give @s minecraft:slowness 30 1 true
effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:saturation 1 20 true

tellraw @s [{"text":"You are the SEEKER! ","color":"red","bold":true},{"text":"Find and eliminate every hider before time runs out.","color":"red"}]
