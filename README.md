# Daily OS Starter Kit

A daily operating system for Claude Code: schedule + journal + an AI assistant that is required to push back before agreeing. No app, no database, no code — just markdown files and a folder of daily notes.

## What it is

You get a **schedule-assistant that is not allowed to agree with you**. It will:
- Recognize your working patterns and anti-patterns (set during setup).
- Interrupt caveats when you try to discount your wins.
- Flag empty work (preparation instead of results).
- Push back on vague plans before you trip on them.
- Run entirely in Claude Code — your data never leaves your disk.

## What you need

- [Claude Code](https://claude.com/claude-code) (CLI, desktop app, or IDE extension).
- This folder anywhere you like (e.g., `Documents/daily-os/`).
- Windows: PowerShell (for the status hook). macOS/Linux: rewrite the two hooks in `settings.json` for your shell — don't just delete the file, it also carries the calendar permissions and the real-clock hook.
- **Optional — Google Calendar.** If you connect it, the morning plan is built around your real meetings instead of on top of them. Connect it in Claude settings → Connectors → Google Calendar, or run `/mcp` in the Claude Code CLI and authorize `claude.ai Google Calendar`. Setup asks you about this and tests the connection; say no and the kit plans from your 2-week plan and watchlist only. Events are read, never written — nothing leaves your disk either way.

## Install (3 steps)

1. **Put this folder anywhere** (e.g., `Documents/daily-os/`).
   ```
   daily-os-starter-kit/
     README.md                          ← you are here
     CLAUDE.md                          ← boundaries & first-run gate
     base.md                            ← shared rules layer (fill during setup)
     templates/
       current-plan.md                  ← your 2-week table (filled at setup)
       watchlist.md                     ← your master queue (filled at setup)
     .claude/
       skills/
         setup/SKILL.md                 ← the first-run interview
         morning/SKILL.md               ← daily schedule (trigger: "let's plan")
         day/SKILL.md                   ← daytime logging (triggers: food, events, done)
         evening/SKILL.md               ← wrap up (trigger: "wrap up")
         retro/SKILL.md                 ← weekly retro (trigger: "retro")
         cycle/SKILL.md                 ← 2-week plan refresh (auto every 14 days)
       agents/
         day-validator.md               ← completeness check (read-only)
         retro-agent.md                 ← weekly summary draft
         cycle-agent.md                 ← new plan draft
       hooks/
         day-status.ps1                 ← session-start status (Windows)
       settings.json                    ← registers the hook + the datetime hook
   ```
   Setup also creates `weeks/` (weekly and cycle reviews) and `archive/` (retired plans) as they are first needed. Your goals are not a file — they live in `base.md` §5.
2. **Open this folder in Claude Code.**
3. **Say anything** — "set me up", "hello", whatever. The assistant will refuse the normal daily protocols and run the setup interview instead.

## First run: the setup interview

Until all `{{placeholders}}` are filled, you cannot use the daily skills. The setup interview asks (≤3 questions per message, takes ~10 minutes total):

1. **Language**: English or Russian? (Files stay in English; only the conversation switches.)
2. **Who are you**: your work/study, your current life situation, how you want to be addressed.
3. **Goals (up to 3)**: for each — the outcome, what counts as a visible external result (something someone else could see, not "better at X"), how the goal usually dies, and the exact sentence you want to hear when it stalls. They are written into `base.md` §5.
4. **Day skeleton**: your morning must-haves, weekly fixed activities, meals, one rest anchor (e.g., meditation), evening blocks (what's required vs optional), and whether to pull your Google Calendar into the plan.
5. **Habits to track**: alcohol, doomscrolling, sugar, anything. For each: target (zero / limit / observe) and whether the assistant should ask proactively or only log what you mention.
6. **Your failure map**: seven working patterns (§3.1) and seven anti-patterns (§3.2) — for each, keep or delete? Deleting is normal; what stays is the map the assistant leans on by number. Plus up to 3 personal anti-patterns, each with: what it feels like inside, what a stranger would observe, and the exact sentence to hear when it fires.
7. **Off-limits topics**: what the assistant should never challenge (grief, faith, people, health).
8. **First 2-week plan**: build it together (14 rows, 1 main task per day, ≥1 rest day).

Then the assistant rewrites its own brain (`base.md`) with your answers. From that point: the file is yours, not a template.

## Daily use

| You say | What happens |
|---|---|
| **"let's plan the day"** | Morning protocol: energy check, day skeleton tick, main task from your 2-week plan, a 5–15 min first action, worst-day minimum, if-then for today's biggest risk, day file written. |
| **"note this for Friday"** (or any future date) | Goes straight to `watchlist.md` (the master queue), never the day file. Surfaces in the morning plan automatically when that date arrives. |
| **"ate lunch"** / **"sore"** / **"done with X"** (anytime during the day) | Logged in today's file with a real timestamp. If food wasn't mentioned — the assistant asks. |
| **"wrap up"** | Evening protocol: count what was done (no caveats allowed), three one-word accounting fields (carried to completion / fuel / choice), credit one thing you did despite difficulty, log deviations as data (not verdicts), emotional background (5 light fields, not deep therapy). |
| **"retro"** (any day) | Weekly summary: what counted this week, goal markers, patterns you may not have noticed. |
| Every 14 days | The assistant auto-detects cycle end and rebuilds your plan itself — you don't re-plan, it does. Old plan → archive. |

## What the kit requires

- **Honesty in setup.** The kit works exactly as well as the failure map you write. Be embarrassingly specific about your patterns.
- **No app.** This is not a productivity app — it's a decision structure. No notifications, no gamification, no streak tracking.
- **Active push-back.** The assistant will object, interrupt your caveats, flag when you're "preparing" instead of doing. That is the feature. If you want cheerleading, this is not it.
- **Skin in the game.** Until the setup interview is finished, the daily skills don't run — no morning, no evening, no retro. You are not managing the assistant — it is managing the plan. The watchlist and day files are yours; the assistant maintains them, you decide.

## What this is NOT

- Not therapy. The kit is a self-management tool built on behavior-change research (cited in `base.md`). Hypotheses stay in the journal, not redirected outward.
- Not a calendar app. Dates with future deliverables live in the watchlist; the day file is only today.
- Not a habit tracker with streaks or graphs. It is a reality journal: what actually happened, what you credited to yourself, where you got stuck.

## Sources

The kit is built on research cited in `base.md` §18:
- Gollwitzer & Sheeran (implementation intentions, if-then plans)
- Lally et al. (habit formation)
- Marlatt & George (lapse ≠ relapse)
- Bandura (self-regulation)
- Miller & Rollnick (Motivational Interviewing)
- Clark & Chalmers (extended mind)
- Pennebaker (expressive writing)
- And others.

## Status (this version)

This is the starter kit v1.0 — a complete operating system ready for someone to set up for the first time. It includes:
- 6 skills — setup, plus 5 daily ones (morning, day, evening, retro, cycle) — with full protocols.
- 3 read-only agents (validator, retro-agent, cycle-agent).
- A session-start hook (Windows PowerShell; rewritable for other shells).
- Full setup interview that gates the whole system until filled.

Open the folder in Claude Code and say anything to get started.
