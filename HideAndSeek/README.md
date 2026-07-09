# HideAndSeek Datapack (Minecraft Java 1.20.1)

A complete, self-contained Hide & Seek minigame in the style of Hypixel's
"Hide and Seek". No mods, no plugins - pure vanilla datapack.

## Installation
1. Copy this whole folder (containing `pack.mcmeta` and `data/`) into your
   world's `datapacks` folder, or zip its **contents** into `HideAndSeek.zip`.
2. In-game: `/reload` (or restart the world).
3. On load, the pack automatically:
   - Registers all scoreboards/teams/bossbar.
   - Resets to a clean lobby state.
   - Places the physical **Start button** near the lobby at
     `-52 91 -33` (a stone button wired to a hidden command block).

## Building arenas (run these as an operator)
Unlimited arenas and unlimited hider spawns per arena are supported.

```
/function hideandseek:create_arena        # stand at the arena's center, run this
/function hideandseek:set_seeker_spawn     # stand where the seeker should spawn
/function hideandseek:add_spawn            # stand at a hiding spawn point, repeat as many times as you want
```

Optional / editing:
```
/scoreboard players set @s hs_input <size>
/function hideandseek:set_border           # sets world border size for the selected arena (10-600), default 300

/scoreboard players set @s hs_input <arenaId>
/function hideandseek:select_arena         # switch which arena you're editing (create_arena auto-selects the new one)

/function hideandseek:set_center           # re-center the selected arena on your position
/function hideandseek:list_spawns          # list all hider spawns of the selected arena (shows their ids)
/function hideandseek:list_arenas          # list every arena that exists

/scoreboard players set @s hs_input <spawnId>
/function hideandseek:remove_spawn         # remove a hider spawn by id
```

## Playing
Any player presses the Start button in the lobby. Nothing else is manual:

1. A random Seeker is chosen; everyone else becomes a Hider.
2. A random arena is chosen, and each Hider is teleported to a random spawn
   inside it; the Seeker goes to that arena's seeker spawn.
3. Kits are given: Seeker gets red leather armor + iron sword + food, plus
   30s Blindness & Slowness. Hiders get blue leather armor + wooden sword + food.
4. 30-second hiding phase (bossbar + actionbar countdown).
5. 10-minute seeking phase begins: the world border is set to the arena's
   configured size and shrinks to 20 blocks over the full 10 minutes. In the
   final 60 seconds the bossbar turns red, the border warning widens, and a
   title/sound alert everyone.
6. Win conditions:
   - All hiders eliminated -> **Seeker wins**.
   - Timer hits 0 with a hider still alive -> **Hiders win**.
7. After the match: inventories/effects are cleared, everyone is teleported
   back to the lobby, the world border/teams/tags are reset, and wins are
   tallied (visible permanently in the tab list).

## Lobby location
`-52.42 91 -28.33`

## Technical notes (why some things are built the way they are)
Minecraft 1.20.1 has **no `/random` command and no function macros**
(both were added in 1.20.2+), so this pack uses fully-vanilla workarounds:
- **Randomness**: a 100-entry loot table (`hideandseek:random_100`) spawns an
  item whose stack count (1-100) is read into a scoreboard value, then the
  item is destroyed. Used for picking the seeker, the arena, and hider spawns.
- **Arena/spawn storage**: each arena and spawn point is an invisible marker
  armor stand carrying its data in scoreboards (`hs_arenaid`, `hs_border`,
  `hs_localid`, `hs_spawnid`) and its own position - there is no way to store
  "unlimited" structured data in NBT storage and read it back into a command
  without macros, so entities are used as the database instead.
- **Dynamic world border size**: since a scoreboard value can't be substituted
  into `/worldborder set <N>` without macros, `util/apply_border.mcfunction`
  is a generated lookup table (`execute if score ... matches N run worldborder
  set N 0`) covering every supported size from 10 to 600.
- All per-tick work is gated behind `state != 0` checks and a 20-tick (1
  second) throttle, so the pack costs virtually nothing while idle in the lobby.
