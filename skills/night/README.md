# night: a Claude Code skill for leaving Claude working overnight

My night prompt, saved as a skill. Type `/night` before bed and Claude keeps working through the plan, stage by stage.
After each stage it checks how much of your weekly limit is used, and at 90% it stops, writes where it stopped and
waits for you. In the morning it shows you what it finished, what broke and where to start.

The skill itself: [SKILL.md](SKILL.md).

## Install

**Ask Claude.** Paste this into Claude Code and approve the file write:

```
Install this skill for me: fetch https://raw.githubusercontent.com/lc66/meowdoro-public/main/skills/night/SKILL.md and save it as ~/.claude/skills/night/SKILL.md
```

**Or in the terminal:**

```sh
mkdir -p ~/.claude/skills/night && curl -fsSL https://raw.githubusercontent.com/lc66/meowdoro-public/main/skills/night/SKILL.md -o ~/.claude/skills/night/SKILL.md
```

**Or by hand:** copy [SKILL.md](SKILL.md) to `~/.claude/skills/night/SKILL.md`.

Then, before bed, type `/night`.

---

Made by the author of [Meowdoro](https://meowdoro.com/?utm_source=github&utm_medium=skill&utm_campaign=night), a timer
in your Mac's notch that tells you when Claude needs you.
