# ============================================================
# HideAndSeek : game/hiders_win
# Win condition: the 10-minute timer reaches zero with at
# least one hider still alive.
# ============================================================

title @a title [{"text":"HIDERS WIN!","color":"blue","bold":true}]
execute as @a[tag=hs_hider,tag=hs_alive] run scoreboard players add @s hs_wins 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
function hideandseek:game/end_game
