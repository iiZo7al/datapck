# ============================================================
# HideAndSeek : select_arena
# Chooses which existing arena the edit commands below act on.
# Usage:
#   /scoreboard players set @s hs_input <arenaId>
#   /function hideandseek:select_arena
# (create_arena auto-selects the arena it just made, so this
#  is only needed when going back to edit an older arena.)
# ============================================================

scoreboard players operation #global hs_selarena = @s hs_input
tellraw @s [{"text":"[HideAndSeek] ","color":"dark_green"},{"text":"Now editing arena #","color":"green"},{"score":{"name":"#global","objective":"hs_selarena"}}]
