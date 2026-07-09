# ============================================================
# HideAndSeek : game/trigger_danger
# One-time escalation at the 60-second mark: reddens the
# bossbar, widens the border warning, and alerts everyone that
# the final minute is dangerous.
# ============================================================

scoreboard players set #global hs_dangerflag 1
bossbar set hideandseek:timer color red
bossbar set hideandseek:timer name [{"text":"DANGER! Border closing fast!","color":"red","bold":true}]
worldborder warning distance 20
worldborder warning time 30

title @a title [{"text":"FINAL MINUTE","color":"red","bold":true}]
title @a subtitle [{"text":"The border is closing in!","color":"gold"}]
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0.5
