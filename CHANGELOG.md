# Changelog

Meowdoro (the app, tags `app-v…`) and the helper for remote machines (tags `helper-v…`) have their own versions. Both are here, newest first.

## Meowdoro 0.1.8 — 2026-10-22

- **Count down or up:** Settings → Timer → Count. The digits, the ring and the bar show the time left or the time gone.
- **Name your focus:** click "Focus" in the island and type what it's for.
- **Session journal** in Statistics: every focus and break of the day, with its name and projects. Rename a focus, or delete a record entered by mistake.
- **Projects, counted more simply:** a focus with agents on screen counts in full for every project worked on during it, reading an agent's answer included. With agents hidden, it counts for none.
- **Auto-pause** (off by default): a focus pauses after 5 minutes without keyboard or mouse, or during a call (camera or microphone in use), with the time rewound to when it began.
- **A fresh start after a night away:** after 4 hours with nothing running, the timer starts over from the first round instead of counting hours of overtime.
- **Agents on this Mac:** a tile per agent with its mark and a green ring once connected. Meowdoro finds Claude Code and Codex by itself (Codex inside ChatGPT too, wherever the app is); "Connect all…" connects them in one go.
- **Do Not Disturb during focus:** "Add Do Not Disturb shortcuts" adds Meowdoro's two shortcuts in two clicks.
- The round dots stand in for the "round 1 of 4" text, and the island's "Today · …" line is gone: those numbers are in Statistics.
- A phase that has started keeps its length when you change the settings.

## Helper 0.5.0 — 2026-10-22

- The helper's plugin is now called `meowdoro-remote`, so it works next to Meowdoro's own plugin on a machine that runs Meowdoro too (a Mac VM, say): agents there show up both in that machine's island and on your Mac. Before, whichever was installed second didn't take, and the other Meowdoro's Settings could count the helper's plugin as its own.
- Running the line again replaces the `meowdoro@meowdoro` plugin older helpers installed. A plugin of that name that came from Meowdoro itself is left alone.
- `meowdoro-remote uninstall` removes only the helper's plugin.
- Codex asks you to trust the hooks again (`/hooks`): they belong to a new plugin now.
- **Several Macs can watch the same machine.** Run each Mac's line there: it adds that Mac instead of replacing the one before, and every event goes to each of them, sealed with its own key. Up to 8; one more drops the oldest. `meowdoro-remote list` shows them, `meowdoro-remote remove <number>` stops sending to one.

## Meowdoro 0.1.6 — 2026-10-21

The first public test version.

- **Focus timer around the notch**, with the cat: focus and break rounds, overtime after a phase ends, a warning on the last minute, the next phase starting on its own if you want. The time in the notch as digits, a ring or a bar.
- **Claude Code and Codex at a glance:** which sessions are working, waiting for you or finished; a click opens the session. How full each session's context is, with a /compact hint at the start of a break. Codex's plan limits and when they'd run out at the current pace.
- **Agents on other machines** (a VM, a Linux server, another Mac) through the shared relay at relay.meowdoro.com, encrypted end to end: Settings → Remote agents.
- **Statistics** for the day, week and month, by project.

## Helper 0.4.1 — 2026-10-21

The first public version of the helper for remote machines.

- `meowdoro-remote uninstall` also stops the running helper, so the machine leaves your Mac's list right away instead of within 10 minutes.
