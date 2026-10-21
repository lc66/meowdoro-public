# Meowdoro

A focus timer with a cat that lives around your MacBook's notch. It also shows what Claude Code and Codex are doing — on this Mac, and on other machines through a small helper.

This repository holds Meowdoro's releases and the helper for remote machines. The app's source isn't here.

## Download

**[The latest Meowdoro](https://github.com/lc66/meowdoro-public/releases/latest)**: `Meowdoro-<version>.dmg` under Assets. Older versions and what changed: [Releases](https://github.com/lc66/meowdoro-public/releases).

- macOS 14 or later, Apple silicon or Intel. On a Mac without a notch it's a small bar in the middle of the top edge.
- This test version isn't signed by Apple yet, so macOS refuses the first launch. Drag Meowdoro to Applications, then run this once in Terminal:

  ```sh
  xattr -dr com.apple.quarantine /Applications/Meowdoro.app
  ```

  The read-me inside the DMG walks through it. Once the app is signed, this step goes away.
- No Dock or menu bar icon: click the island to open it, right-click it for Settings and Quit.

## Agents on other machines

Meowdoro can show agents that run on a VM, a Linux server or another Mac. The helper here sends their status from that machine to your Mac:

```
that machine                                                              relay              your Mac
agent hook → meowdoro-remote hook → meowdoro-remote daemon ──HTTPS──▶ (sees only ciphertext) ──▶ Meowdoro
```

Meowdoro shows the line in Settings → Remote agents. It looks like this:

```sh
curl -fsSL https://raw.githubusercontent.com/lc66/meowdoro-public/main/install.sh | sh -s -- https://<relay> <code> [name]
```

- Needs `python3` (3.8+, standard library only) and `curl`.
- `install.sh` downloads the helper of its own release by tag and runs it only if its SHA-256 matches.
- `<code>` carries the channel and the encryption key made on your Mac; it is saved to `~/.meowdoro/remote.json` (owner-only).
- The Meowdoro plugin is installed into Claude Code and Codex with their own commands. Running sessions pick it up after a restart; Codex runs plugin hooks only after you trust them (`/hooks`).
- Update: run the line again. Remove: `python3 ~/.meowdoro/bin/meowdoro-remote uninstall`.

### What leaves that machine

Only status: agent, session id, event (working / waiting / finished / error / closed), project name (the git repository's folder name), the session's title, a tool's name when it asks for permission or is an MCP tool, how full the session's context is, Codex's plan limits, the machine's name, the helper's version, a timestamp. Never prompts, tool inputs or outputs, file contents, paths or the agent's replies. Everything is encrypted with AES-256-GCM before it leaves; the relay can't read it.

## Versions

The app and the helper have their own versions: app releases are tagged `app-v<version>`, helper releases `helper-v<version>`. A new helper doesn't need a new app, and the other way round. Each message from the helper carries a protocol version. New helpers only add fields, so an older Meowdoro keeps working with a newer helper (it ignores what it doesn't know, and shows agents it doesn't know yet by their name). A change an older Meowdoro couldn't read would raise the protocol version; that Meowdoro then says the machine needs a newer Meowdoro.
