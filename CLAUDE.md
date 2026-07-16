# Daily OS — Project Setup and Boundaries

This folder is your personal daily operating system. The assistant maintains your schedule, journal, and watchlist. Your files stay on your disk — no app, no server, no sync; what the assistant reads from them goes to Anthropic's API, like any Claude Code conversation.

## FIRST-RUN GATE

**If `base.md` still contains any `{{...}}` placeholder, the setup interview must run first.** Whatever your first message says — "set me up", "hello", "let's plan" — the assistant will refuse to run any daily protocol and start §S (Setup Interview) in `base.md` instead.

Only after setup completes and every placeholder is replaced can you use the daily skills (morning, day, evening, retro, cycle).

## File structure

- **`base.md`** — the shared rules layer (§0 preflight, protocols §7–§14, strategies §16, sources §18). Loaded by every skill as Step −1. All placeholders live here; each is filled by exactly one setup question.
- **`templates/`** — empty schemas for your data files (current-plan.md, watchlist.md). Goals are not a file: they live in `base.md` §5.
- **`.claude/skills/`** — setup, plus five daily skills: morning, day, evening, retro, cycle.
- **`.claude/agents/`** — three read-only agents: day-validator, retro-agent, cycle-agent.
- **`.claude/hooks/`** — session-start status (Windows PowerShell).
- **`.claude/settings.json`** — registers the hook (delete or rewrite for macOS/Linux).

## Boundaries

- Work **only in this folder**. No reading or writing outside it.
- Your data files (day files, watchlist, plan, hypotheses) are yours — the assistant maintains them and you own them.
- No external communication, no uploads. One exception, and only if you turned it on during setup: reading your Google Calendar events for today (base.md §0.10). Read-only — nothing is ever written to the calendar or sent anywhere.
- Temporary files go to the OS temp folder, not here.

## Rules you are bound by

Once setup finishes, these apply:

- **Real time always.** Timestamp every logged fact with a real clock command; never guess times between messages.
- **Watchlist-first.** Anything dated for the future (deadlines, ideas, "someday" projects) goes to `watchlist.md`, never to day files.
- **Morning check of yesterday.** If yesterday's evening was not closed, you add the recovery before any question about today.
- **Caveat-free counting.** When you say "I did X", it counts — no "but I could have done more", no "but this was easy". The assistant interrupts these instantly.
- **Cycle auto-roll.** When the 2-week plan's end date arrives, the assistant rebuilds your plan itself — you don't have to remember or ask.
- **Read base.md first.** Every skill loads `base.md` as Step −1 before any conversation.

## What this is and isn't

**This IS:**
- A schedule + journal system in plain markdown.
- An assistant that is required to push back, interrupt caveats, and flag empty work.
- Built on behavior-change research (cited in `base.md`).

**This IS NOT:**
- A productivity app or habit tracker with gamification.
- Therapy or a substitute for mental health support.
- An external decision-maker. The assistant proposes; you choose.

## First message

Open this folder in Claude Code and say anything. The assistant will start the setup interview (§S in `base.md`).
