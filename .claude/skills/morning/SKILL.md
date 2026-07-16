---
name: morning
description: "Morning protocol: schedule the day. Trigger: \"let's plan the day\", \"morning\", \"schedule\", or \"short version\" (minimum+anchor+if-then only). Runs §7 from base.md. First step: recover yesterday's evening if not closed (§7 Step 0). Then read current-plan.md and watchlist.md, take today's main task, run the formula (Value×Belief×Plan), decompose to a micro-step (verb+object), assemble a schedule with minimums, if-then plan, and write the day file."
---

# Morning Protocol (§7)

**Trigger:** "let's plan the day" / "morning" / "schedule" / "short version" (minimum version only)

**First step (Step −1):** Read `base.md` entirely if not in context.

**Gate:** If `base.md` still contains any `{{...}}` placeholder — stop; run the `setup` skill instead. No daily protocol before setup.

**Second step (Step 0):** Read yesterday's day file.
- **No file for yesterday → nothing to recover. Skip silently, go to Step 1.** A missing file is not an unclosed evening (first morning after setup, or you weren't using the kit). Never open a recovery about a day that was never planned here; never write a day file for a past date.
- **File exists but "Evening review" is empty/missing** → run the recovery first (§7 Step 0 in base.md). Mandatory, not optional.

Then proceed:

## Core steps (always run, even at energy ≤4)

1. **Step 1 — Context** (§7): Energy 1–10? Anything urgent? One short question each: sleep, food, body. Skeleton tick (all items).

2. **Step 2 — Main task** (§7): `Read` `current-plan.md` and `watchlist.md`. Take today's main task. Cross-check: today ≥ cycle end date? → run `/cycle` first. Say the task; ask if anything changed.
   - **Calendar (§0.10, only if Config in base.md says `google`):** pull today's events via `mcp__claude_ai_Google_Calendar__list_events` (calendar `primary`, window = today). They are hard walls — say them before the main task; Step 6 blocks go only into free windows. Connector silent → say "the calendar didn't load", build the day from the plan + watchlist. Config says `none` → skip this bullet, don't mention it.

   - **Whose choice (3.2.7):** one question — "is this main task your choice or someone else's requirement?" "Someone else's" is valid, not a failure; don't replay the task over the answer. It lands in "Choice of the day" in the evening (§11 Step 1c).

3. **Step 3 — Micro-step** (§7): Reduce to verb + object (5–15 min, first physical action). Test: can you start without asking yourself another question?

4. **Step 4 — Minimum** (§7): Worst-day version. Test: "if everything goes wrong, will you still do this?"

5. **Step 5 — Anchor** (§7): "After [existing behavior] in [place] I do [micro-step]."

## Depth steps (energy ≥5 only)

6. **Step 6 — Schedule** (§7): Table with time, block, action, block minimum.

7. **Step 7 — If-then** (§7): Risk today? Where might you derail? IF [trigger] → THEN [behavior + permitted minimum].
   - **Default anti-scatter if-then (3.2.5), at energy ≥6 only:** IF I catch myself on the third topic-switch within an hour → THEN close everything but one window, timer 15 min. A default, not a duty — the user's own named risk outranks it.

8. **Step 8 — Habits** (§7): Only if you named an urge (not proactive).

9. **Step 9 — Goal markers** (§7): If today's task links to a goal in `base.md` §5.1-5.3, one check against that goal's own marker: "visible result or preparation?"

## Close

10. **Step 10 — Write file** (§7): Create or extend `YYYY-MM-DD.md` from the §14 template. Do NOT touch the evening part if it exists. Then call the `day-validator` agent for the morning half (energy is a number; sleep/food/body filled; micro-step is verb+object); holes → close one at a time, re-call until "clean". `## During the day` empty in the morning is NOT a hole. Then: "File saved. In the evening, say 'wrap up'."

---

## "Short version" trigger

Same as above, but stop after Step 5 (anchor). Skip the schedule, if-then, and goal markers. Focus: energy context, main task, micro-step, minimum, anchor.

---

## Preflight (§0)

- Real clock: check `Get-Date` before writing the file.
- Yesterday's recovery: mandatory if evening not closed.
- watchlist.md check: §1 (deadlines today-tomorrow) must be mentioned.
- Calendar (§0.10): only if Config says `google` — pull today's events via the MCP tool; if it fails, say so out loud.
