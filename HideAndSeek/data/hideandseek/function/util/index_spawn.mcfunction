# ============================================================
# HideAndSeek : util/index_spawn
# Executed "as" each hider-spawn marker of the selected arena
# in turn. Re-numbers hs_localid to a contiguous 0-based
# sequence every match, so removed spawns never leave gaps
# that would break random selection.
# ============================================================

scoreboard players operation @s hs_localid = #global hs_idx
scoreboard players add #global hs_idx 1
