---
name: cycle
description: "Cycle change: rebuild 2-week plan. Trigger: auto-fires when today≥cycle-end-date from current-plan.md header (check in §0.8), or manual \"new plan\"/\"new cycle\". Runs cycle review (retro-agent over whole cycle), grooms watchlist, calls cycle-agent for draft plan, archives old current-plan.md, writes new one."
---

# Cycle Protocol (§14b)

**Trigger:** **Auto-fires** when today ≥ cycle end date in `current-plan.md` header (check in base.md §0.8, Preflight Step 8). Also manual: "new plan" / "new cycle" / "next 2 weeks".

**First step (Step −1):** Read `base.md` entirely if not in context.

**Gate:** If `base.md` still contains any `{{...}}` placeholder — stop; run the `setup` skill instead. No daily protocol before setup.

---

## Steps (in order, don't skip)

1. **Cycle review (retro-agent)**: Call `retro-agent` with window = entire cycle (dates from `current-plan.md` header). Returns draft in §14a format. Write `weeks/YYYY-MM-DD_cycle-review.md`.

2. **Groom watchlist**: `Read` `watchlist.md`. 
   - §1: done/closed → move to §6 (archive) with date.
   - §2: stalled ≥2 cycles without movement → ask user "still live or park?" Park low in §2.
   - §0 (milestones): cross-check against reality.
   - Result: clean watchlist ready for next step.

3. **Draft new cycle (cycle-agent)**: Call `cycle-agent`. It reads `watchlist.md` (§0 milestones, §1 active, §2 queue), old `current-plan.md`, and cycle review; returns DRAFT new table (14 rows, 1 main task/day, ≥1 rest, checks from §10c).

4. **Discuss with user**: "Cycle ended. Building next plan." Walk through cycle-agent's draft. Any changes? Discuss risks noted by cycle-agent.

5. **Finalize**: Apply §10c checks (14 rows, 1 main per day, ≥1 rest, check-ins ≥1/week).

6. **Archive old**: Move `current-plan.md` → `archive/plan_YYYY-MM-DD_to_YYYY-MM-DD.md` (dates of old cycle). Don't lose it.

7. **Write new**: Write new `current-plan.md`. Header format **must be exact:** `# Current 2-week plan: DD.MM–DD.MM.YYYY` (the hook parses this to detect end date). Timeless rules = "see base.md §6" (don't duplicate). Cycle-specific notes if any.

---

## What cycle-agent does

Reads source files (watchlist, old plan, cycle review), returns DRAFT with:
- Cross-check of what got done in the old cycle
- Candidate tasks from watchlist (with priorities)
- Draft 14-day table (checks: 1 main/day, big before maintenance, ≥1 rest, check-ins)
- Risks noted (overload, milestone not moving, task patterns)

You finalize and write.

---

## Critical

- **Auto-fire:** this skill must run ITSELF when cycle end date arrives, not wait for user to say "new cycle". Check at every morning trigger (§0.8).
- **Never leave the old plan stale.** A stale plan silently rots every morning after.
- **Header format matters.** The hook parses `DD.MM–DD.MM.YYYY` to detect the next end date.

---

## Preflight (§0)

- Real clock: `Get-Date` to confirm today ≥ end date.
- watchlist check: must be run (Step 2).
- Old plan location: archive folder must exist.
