# Executed "as" each participating player - gives them a
# stable, contiguous 0-based index for the random seeker roll.
scoreboard players operation @s hs_tempidx = #global hs_idx
scoreboard players add #global hs_idx 1
