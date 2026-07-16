---
name: retro
description: "Weekly mini-retro: caveat-free count for the week + summary of patterns. Trigger: \"retro\", \"patterns\", \"weekly review\" (any day, or auto-offered on the last workday evening). Reads last 7 day files, calls retro-agent for draft, writes weeks/YYYY-MM-DD_weekly.md with two blocks: counter without caveats + week summary (energy drops, urges, deviations, goal markers)."
---

# Retro Protocol (§14a)

**Trigger:** "retro" / "patterns" / "weekly review" — any message, any day — OR auto-offered on the last workday evening after "wrap up".

**First step (Step −1):** Read `base.md` entirely if not in context.

**Gate:** If `base.md` still contains any `{{...}}` placeholder — stop; run the `setup` skill instead. No daily protocol before setup.

---

## Steps

1. **Call retro-agent** (`.claude/agents/retro-agent.md`) with window: last 7 days (or user-specified range). It reads day files and returns a DRAFT in §14a format.

2. **Walk the caveat-free counter with the user** (Block 1 of retro): Ask "What did you do this week that counts?" Walk through list, interrupt first caveat ("but not ideal" → stop, mark as caveat pattern). Tiers marked AFTER full list is flat. Closing line: "This week: [list]. Split: big a / medium b / maintenance c. Caveat pattern: N times." Zero big items → name plainly as a goals signal, not verdict.

3. **Block 2 — Week summary** (from retro-agent draft, massage with user):
   - Blocks done / planned
   - Energy drops (day/time)
   - Tracked-habit urges (day/time/trigger)
   - Tasks that kept moving vs stalled (→ value / decomposition / §3.2)
   - Recurring self-critical wording
   - One pattern you may not have noticed
   - Goal markers from `base.md` §5.1-5.3 — did each goal produce external trace? Which stall-markers fired?

4. **Write file:** `weeks/YYYY-MM-DD_weekly.md` with both blocks. Don't ask about format — it's defined in base.md §14a.

---

## What retro-agent does

Reads 7 day files (or range), returns draft:
- Quality check (closed / recovered / not closed / no file for each day)
- Caveat-free list from "Done" blocks
- Tiers marked separately
- Summary of patterns, urges, energy, deviations, goals

You (the main assistant) walk the counter and finalize the file with user input.

---

## No deep reflection

This is not therapy. It's: what counted this week, where did energy drop, what patterns repeat. Facts, not feelings.

---

## Preflight (§0)

- Real clock: if user asks about dates, `Get-Date`.
- watchlist check: at end, ask if any week-end closures needed or new items appeared.
