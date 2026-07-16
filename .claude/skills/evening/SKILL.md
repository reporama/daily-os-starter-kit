---
name: evening
description: "Evening protocol: close the day. Trigger: \"wrap up\", \"end of day\", \"check-in\" (USER initiates, assistant does NOT impose). Runs §11 from base.md with the full 19-step checklist. Core (always): count done/no-caveats, the accounting fields listed in §14 (carried/fuel/choice), credit one thing, say what's tomorrow, tick skeleton, write file. Depth (energy≥5): 5 emotions, skills+ideas, deviations, health spheres, watchlist check. Ends with validator check (day-validator agent)."
---

# Evening Protocol (§11)

**Trigger:** "wrap up" / "end of day" / "check-in" — **you initiate.** Assistant does NOT offer or push the evening.

**First step (Step −1):** Read `base.md` entirely if not in context.

**Gate:** If `base.md` still contains any `{{...}}` placeholder — stop; run the `setup` skill instead. No daily protocol before setup.

---

## Structure

**Core (mandatory, always runs, even energy ≤4):**

1. **Step 0:** `Read` today's day file. Get main task, schedule, minimums, if-thens.
2. **Step 1:** Count done (no caveats). Interrupt first "but". Tier each item. Final line: "Counted N — big a / medium b / maintenance c."
3. **Step 1c:** The accounting fields — carried to completion (N of M) / fuel (interest–duty–anxiety) / choice (mine–someone else's–didn't choose). **Ask only for the fields the §14 day template actually lists:** setup deletes the ones whose anti-pattern (3.2.5 / 3.2.6 / 3.2.7) the user rejected, so it may be three, two, one, or none. One word each, one line each in the file. Ask, write, move on — don't deepen, don't interpret, don't argue with the answer. The pattern only shows across a week (§14a), so don't raise "anxiety again" in the moment.
4. **Step 4:** One thing you did despite difficulty. If "nothing" → name it yourself (negativity bias). If §14 lists "Fuel of the day" (3.2.6 kept), add the discriminator: "relief or gladness when you closed it?" — one word beside that field, not deepened.
5. **Step 4b:** One line of emotional background (the short version of Step 6 — one line, not the five fields).
6. **Step 2:** What wasn't done — no verdict, cause per §9.
7. **What's tomorrow:** one line (from the count's "tomorrow" items + tomorrow's watchlist activations).
8. **Skeleton tick (§4):** ALL items, one orienting line. Unticked = data.
9. **Step 9:** Write the file (`YYYY-MM-DD.md`): append "Evening review" block. Never lose content.
10. **Step 9b:** Call `day-validator` agent. If holes returned → ask and close them one by one, calling validator again until "clean" OR you say "enough" (then write `_closed early by user's word_`).

**Depth (energy ≥5 only):**

1. **Step 1b:** Skills + ideas of the day (think outward, not ruminate).
2. **Step 3:** Meta-position if a pattern surfaced (one pass only).
3. **Step 5:** Tracked habits (mode per base.md §4h).
4. **Step 6:** Emotional background — five short fields walked across messages, not deepened.
   - 3 emotions (emotion — 0–10 — context)
   - Body (where the sensation lived)
   - Up / Down (best / worst minute)
   - What you said to yourself (quote)
   - What you needed, didn't get (one word)
5. **Step 7:** Deviations of the day (fact + cause).
6. **Step 8:** Health spheres (sleep / food / body / screens / contact) — one phrase each.
7. **Step 8b:** Check `watchlist.md`: what activates tomorrow, close today's done items, add new open items.

**At energy ≤4 the depth fields are not asked** — the skipped ones (5 emotions, health spheres, habits, deviations) go into the file as the word `skipped`. The validator accepts `skipped` as filled, so a skipped depth field never becomes a hole to close.

**Close:**

1. **Step 10:** Reflective one-sentence summary.
2. Final: "File completed. Day closed."

---

## Key rules (base.md)

- **Caveat-free counting (§5.4):** "I did X" is done. Stop at first "but" and interrupt.
- **No caveats at all** — not "but I could have done more", "but it was easy", "but this doesn't count" (interrupt each).
- **Tiers AFTER counting,** not during, so tier can't become devaluation. Step 1c runs after the tiers, for the same reason.
- **The accounting fields are raw material, not a topic.** "anxiety"/"someone else's" are data — record, never grade. They pay off in the weekly retro (§14a Block 2), never in the moment.
- **No deep reflection, no therapy.** Light logging: ask, get answer, move on.
- **Validator gates closure:** evening is closed = validator said "clean" OR you said "enough" (write `_closed early_`).

---

## No file case

If no morning protocol ran today (no file exists): "We didn't build the day this morning. Want a minimal set of questions for a late summary?" — then abbreviated evening (steps 1, 4, 9 only).

---

## Preflight (§0)

- Read today's file first (Step 0).
- watchlist.md-check (Step 8b): tomorrow's activations + close today's done items.
