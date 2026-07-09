# ============================================================
# HideAndSeek : lobby/setup
# Places the single physical Start button near the lobby.
# A hidden command block underneath fires the start-request
# whenever any player presses the button. Re-runs safely on
# every /reload (uses "replace" so it never duplicates).
# ============================================================

setblock -52 90 -33 command_block[facing=up]{Command:"function hideandseek:game/request_start",auto:0b,TrackOutput:0b} replace
setblock -52 91 -33 stone_button[face=floor,facing=north] replace
