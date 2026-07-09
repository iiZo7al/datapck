# ============================================================
# HideAndSeek : game/seeker_wins
# Win condition: all hiders are eliminated before time expires.
# ============================================================

title @a title [{"text":"SEEKER WINS!","color":"red","bold":true}]
execute as @a[tag=hs_seeker] run scoreboard players add @s hs_wins 1
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1
function hideandseek:game/end_game
