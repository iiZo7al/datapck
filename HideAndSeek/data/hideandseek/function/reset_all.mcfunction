# ============================================================
# HideAndSeek : reset_all
# Fully resets the game to a clean lobby state. Called on
# datapack load and at the end of every match. Safe to call
# at any time - never errors regardless of current state.
# ============================================================

scoreboard players set #global hs_state 0
scoreboard players set #global hs_timer 0
scoreboard players set #global hs_hide 0
scoreboard players set #global hs_ticks 0
scoreboard players set #global hs_dangerflag 0

bossbar set hideandseek:timer visible false
bossbar set hideandseek:timer color blue

worldborder set 60000000 0
worldborder center 0 0
worldborder warning distance 5
worldborder warning time 15

effect clear @a
clear @a
gamemode adventure @a

team leave hs_seeker @a
team leave hs_hider @a

tag @a remove hs_ingame
tag @a remove hs_seeker
tag @a remove hs_hider
tag @a remove hs_alive
tag @a remove hs_tp_target
tag @a remove hs_edit_ref

scoreboard players set @a hs_role 0
scoreboard players set @a hs_alive 0
scoreboard players set @a hs_deaths 0
scoreboard players set @a hs_tempidx 0
scoreboard players set @a hs_target 0

tp @a -52.42 91 -28.33
