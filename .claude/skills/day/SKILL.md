---
name: day
description: "Daytime logging: log facts as they happen (food, body, events, accomplishments, urgencies, urges). Triggers: eating, body updates, \"done\", \"urgent\", \"urge\", \"note this for\", self-criticism. NOT for morning (morning skill), NOT for \"wrap up\" (evening skill), NOT for retro/cycle. Logs to today's day file (§14, \"During the day\" section) with real timestamps. Routes per §0 preflight and type of message."
---

# Day Protocol — Daytime Logging

**Trigger:** Anything NOT a morning/evening/retro/cycle trigger. Specifically: food, body, events, "done", "urgent", urge/temptation, "note this for [date]", self-criticism, deviations.

**First step (Step −1):** Read `base.md` entirely if not in context. Then `Read` today's `YYYY-MM-DD.md` (if it exists).

**Gate:** If `base.md` still contains any `{{...}}` placeholder — stop; run the `setup` skill instead. No daily protocol before setup.

---

## What this skill does

1. **Log the fact** to `YYYY-MM-DD.md` under "During the day" with real timestamp (`HH:MM — fact`). Time is real, from `Get-Date`, never guessed.

2. **Food (proactive).** If you've written anything today and food hasn't been mentioned and isn't logged → ask: "What did you eat and when?"

3. **Route by type** (see §0 Preflight in base.md):
   - Deviation / "didn't do block" / "can I do it now?" → §9 (deviation protocol)
   - "I have something urgent / need to do today" → §10a (urgent protocol)
   - Urge / temptation / "I want to slip" → §16.16 (temptation architecture) + second if-then
   - "Note this for [date]" / deadline / idea / blocker → write to `watchlist.md` **only**, never day file
   - Self-criticism / "I'm worthless" / "I want to quit" → §12 (pause protocol)
   - Event / accomplishment → log it, apply §0.5 (optimization, if drift visible)

4. **Don't impose evening.** Evening is user-initiated ("wrap up"). Don't suggest it.

---

## Real time

Before logging: `Get-Date` to get the real timestamp. Reuse timestamps only if the gap is clearly <1 minute; if uncertain, check again.

---

## Preflight (§0)

- If you reference something in an earlier file → `Read` it first, don't re-ask.
- watchlist.md-first: future dates go to watchlist, not day file.
- No thermometer questions — log facts, not micro.
