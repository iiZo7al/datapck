# ============================================================
# HideAndSeek : game/request_start
# Fired by the lobby's Start button. Ignored if a game is
# already in progress (so spamming the button is harmless).
# ============================================================

execute unless score #global hs_state matches 0 run return 0
function hideandseek:game/start
