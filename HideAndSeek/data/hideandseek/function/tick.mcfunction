# ============================================================
# HideAndSeek : tick
# Runs every game tick. Exits IMMEDIATELY when nothing is
# happening (state 0 = lobby) so idle cost is a single
# scoreboard check - no wasted work when no game is running.
# ============================================================

execute if score #global hs_state matches 0 run return 0
execute if score #global hs_state matches 1 run function hideandseek:game/hide_tick
execute if score #global hs_state matches 2 run function hideandseek:game/match_tick
