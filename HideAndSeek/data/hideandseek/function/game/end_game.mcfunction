# ============================================================
# HideAndSeek : game/end_game
# Common cleanup after either win condition: hands off to the
# shared reset_all routine (clears inventories/effects, resets
# world border, teams, tags, teleports everyone to the lobby).
# ============================================================

function hideandseek:reset_all
tellraw @a [{"text":"[HideAndSeek] ","color":"gold"},{"text":"Back in the lobby. Press the button to start a new match!","color":"yellow"}]
