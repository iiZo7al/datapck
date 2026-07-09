# ============================================================
# HideAndSeek : load
# Runs on every /reload and world (re)load.
# Sets up all scoreboard objectives, teams, the bossbar, and
# the display slots, then hands off to a full state reset and
# re-places the physical Start button in the lobby.
# ============================================================

scoreboard objectives add hs_state dummy
scoreboard objectives add hs_timer dummy
scoreboard objectives add hs_hide dummy
scoreboard objectives add hs_ticks dummy
scoreboard objectives add hs_rng dummy
scoreboard objectives add hs_target dummy
scoreboard objectives add hs_selarena dummy
scoreboard objectives add hs_arenacnt dummy
scoreboard objectives add hs_spawncnt dummy
scoreboard objectives add hs_input dummy
scoreboard objectives add hs_role dummy
scoreboard objectives add hs_alive dummy
scoreboard objectives add hs_wins dummy "Wins"
scoreboard objectives add hs_alivecnt dummy
scoreboard objectives add hs_playercnt dummy
scoreboard objectives add hs_border dummy
scoreboard objectives add hs_arenaid dummy
scoreboard objectives add hs_localid dummy
scoreboard objectives add hs_spawnid dummy
scoreboard objectives add hs_idseq dummy
scoreboard objectives add hs_idx dummy
scoreboard objectives add hs_tempidx dummy
scoreboard objectives add hs_deaths minecraft.custom:minecraft.deaths
scoreboard objectives add hs_dangerflag dummy

team add hs_seeker
team modify hs_seeker color red
team modify hs_seeker prefix [{"text":"[Seeker] ","color":"red"}]

team add hs_hider
team modify hs_hider color blue
team modify hs_hider prefix [{"text":"[Hider] ","color":"blue"}]

bossbar add hideandseek:timer [{"text":"Hide and Seek"}]
bossbar set hideandseek:timer visible false
bossbar set hideandseek:timer color blue
bossbar set hideandseek:timer max 600

scoreboard objectives setdisplay list hs_wins

function hideandseek:reset_all
function hideandseek:lobby/setup
