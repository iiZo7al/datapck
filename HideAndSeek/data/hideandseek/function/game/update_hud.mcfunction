# ============================================================
# HideAndSeek : game/update_hud
# Refreshes the on-screen stats every second: time remaining,
# hiders alive, the current seeker's name, and the arena in
# play. (Win totals are shown persistently in the tab list via
# the hs_wins objective set to display "list" in load.mcfunction.)
# ============================================================

tellraw @a actionbar [{"text":"Time: ","color":"aqua"},{"score":{"name":"#global","objective":"hs_timer"},"color":"white"},{"text":"s   ","color":"aqua"},{"text":"Hiders: ","color":"green"},{"score":{"name":"#global","objective":"hs_alivecnt"},"color":"white"},{"text":"   Seeker: ","color":"red"},{"selector":"@a[tag=hs_seeker]","color":"gold"},{"text":"   Arena #","color":"light_purple"},{"score":{"name":"#global","objective":"hs_selarena"},"color":"white"}]
