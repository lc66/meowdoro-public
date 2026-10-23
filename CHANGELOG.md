# Changelog

Meowdoro (the app, tags `app-v…`) and the helper for remote machines (tags `helper-v…`) have their own versions. Both are here, newest first.

## Meowdoro 0.1.11 — 2026-10-23

- A question in Claude Desktop's next-step box (the Code tab's sessions) shows as waiting too: those sessions get no turn summary, which is all 0.1.10 looked at. On remote machines this needs helper 0.6.1.
- Read sessions are dimmed less, so they stay easy to read.

## Helper 0.6.1 — 2026-10-23

- A question in Claude Desktop's next-step box (the Code tab's sessions) now shows as waiting on your Mac too. Those sessions get no turn summary, which is all 0.6.0 looked at.
- Once you trust Codex's hooks, the Mac stops asking within a minute (it was up to ten), or at Codex's next event.

## Meowdoro 0.1.10 — 2026-10-23

- **Agents grouped by agent:** Claude, then Codex. A session on another machine carries the machine's name after its status, instead of a group per machine.
- **Read sessions dim:** a finished or failed session you've seen — clicked, in the list you opened, or read in Claude Desktop or ChatGPT on this Mac — dims, stops counting on the badge, and leaves the list 15 minutes later.
- **Questions wait:** when Claude Desktop marks a session with a yellow dot (its turn ended on a question for you, not a permission prompt), the island shows it as waiting, with the question, until you answer.
- **Settings → Remote agents** shows each machine's Claude Code and Codex: connected, waiting for you to trust Codex's hooks, or not there; and says when a machine's helper is out of date. Needs helper 0.6.0 there.
- An agent's header shows this Mac's plan limits only: a remote machine may run on another account.

## Helper 0.6.0 — 2026-10-23

- A finished session you read on this machine — opened in Claude Desktop after the reply, or opened in ChatGPT — tells your Mac, and the island shows it as read (dimmed) there too. Needs a Meowdoro that knows read sessions; older ones ignore it.
- Tells your Mac which agents have its plugin: Settings → Remote agents shows the Claude Code and Codex tiles under each machine (connected, found without the plugin, or not found).
- Checks whether Codex there still waits for you to trust its hooks (/hooks): the Codex tile turns orange, and the island says so.
- A session Claude Desktop shows with a yellow dot — the turn ended on a question for you — shows as waiting in the island too, with the question.
- An agent installed on the machine later gets the plugin by itself; one you switched off stays off.

## Meowdoro 0.1.9 — 2026-10-22

- **Auto-pause says so:** when a focus pauses by itself, the island slides out a card with why, and a cat in a headset for a call or asleep on its laptop when you're away. When you're back or the call is over, the same cat offers Start.
- **Do Not Disturb turns off on a Mac in any language.** The shortcut named "Do Not Disturb" in English, and Shortcuts looked it up by that name. If you added Meowdoro's shortcuts before, delete "Meowdoro Focus Off" in the Shortcuts app and add them again from Settings.
- Meowdoro looks for Claude Code and Codex in the same places as the helper for remote machines: one list for both.

## Helper 0.5.1 — 2026-10-22

- Finds Claude Code and Codex that aren't on PATH: the copy Claude Desktop keeps of Claude Code, the codex inside ChatGPT (wherever the app is), and the usual install folders (`~/.local/bin`, Homebrew, npm, Bun). Before, a Mac that runs them only from those apps got "not found" and no plugin. Run the line again to pick this up.
- The places it looks are the same list Meowdoro on the Mac uses, built into the helper.
- Says hello right after setup: the Mac lists the machine in Settings → Remote agents at once, before any agent runs there, and the setup line tells you whether the relay could be reached.

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
