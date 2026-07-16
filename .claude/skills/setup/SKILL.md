---
name: setup
description: First-run interview gate. While any {{...}} placeholder exists in base.md, this skill runs on any user message instead of the daily protocols. Sets up language, bio, goals, day skeleton, tracked habits, failure map, boundaries, and first 2-week plan. After completion, rewrites base.md with user answers (goals included, in base.md §5) and creates current-plan.md, watchlist.md from templates/.
---

# Setup Interview (runs only while placeholders exist)

You are the gatekeeper skill. Your job: run the setup interview defined in `base.md` §S. Nothing else runs until every {{...}} placeholder is filled.

**Trigger:** Any message while `base.md` contains any `{{...}}` placeholder.

**Structure:**
- One block per message (≤3 questions).
- Answers → captured and used to fill placeholders.
- At the end (Step S9): rewrite `base.md` with all answers, create data files, read config back to user in their language, list trigger phrases.

---

## Step −1: Load base.md

Before proceeding, `Read` `base.md` entirely. This is the source of placeholders and the interview structure.

---

## S1 — Language (exactly one question, always first)

> "Which language should I use when talking to you — **English** or **Russian**? (en / ru — the files stay in English either way.)"

Wait for answer. Store as `{{LANG}}` (either "en" or "ru").

From the next message onward, conduct the entire interview and all responses in that language.

---

## S2 — About you

Ask these three questions (≤3 per message):

1. "What do you do — your main work, study, or primary project?"
2. "Your current life season in 2–3 sentences — what's this chapter of your life like?"
3. "How should I address you when talking? (Your name, nickname, or skip if you prefer no form of address.)"

Store answers as `{{USER_BIO}}` (2–3 sentence bio) and `{{ADDRESS}}` (name or "skip").

---

## S3 — Goals (up to 3)

"Let's name your goals for the next 3–6 months. For each:
- What counts as a **visible external result** — something another person could see (submitted, published, sold, defended, shipped, shared)? "Getting better at X" doesn't count.
- Which of these goals has the shortest path to a first visible result? We'll order them by speed.

Walk through up to 3 goals. For each, also ask: "How does this goal usually die?" (the risk) and "What observable signal tells you it has stalled, and what exact sentence should I say then?" (the marker).

Store into `base.md` §5.1 / §5.2 / §5.3 — twelve tokens, four per goal: `{{GOAL_1_NAME}}`, `{{GOAL_1_NEEDS}}`, `{{GOAL_1_RISK}}`, `{{GOAL_1_MARKER}}`, and the same for `GOAL_2_*` and `GOAL_3_*`. Fill them by section, and check all twelve are gone before S9 signs off. Order them by speed to first visible result. Fewer than 3 goals is fine — delete the unused sections at S9.

---

## S4 — Day skeleton (your fixed anchors)

Ask in blocks (≤3 questions per message):

1. "Morning non-negotiables — what happens every morning without negotiation? (e.g., 10 min stretching, real breakfast, a walk)"
   → `{{MORNING_ANCHORS}}`

2. "Weekly fixed activities — any recurring commitments with days and times? (e.g., gym: Mon/Wed/Fri 19:00; class: Tue 10am)"
   → `{{FIXED_ACTIVITIES}}`

3. "Meal pattern — the simplest version that works for you, so food doesn't become a project."
   → `{{MEAL_PATTERN}}`

4. "Evening: is there a recurring learning / practice / reading block? How many times per week? Which evenings?"
   → `{{RECURRING_LEARNING_BLOCK}}`

5. "What are your optional evening activities — things you enjoy but don't require? (e.g., film, a walk, reading, gaming)"
   → `{{EVENING_OPTIONS}}`

6. "One daily rest anchor — a single rest/pause moment every day. What and when? (e.g., 10-min meditation at 17:00; a short walk after lunch)"
   → `{{REST_ANCHOR}}` and `{{REST_TIME}}`

7. "Google Calendar: should I pull today's events into your plan, so blocks land around your meetings instead of on top of them? (yes / no — without it I plan from `current-plan.md` and `watchlist.md` only.)"
   → `{{CALENDAR}}`: **"google"** or **"none"**.

   - Answer "no" → write `none`, move on, never mention the calendar again.
   - Answer "yes" → **test the connector right now**: call `mcp__claude_ai_Google_Calendar__list_events` for today, calendar `primary`. It answers → write `google`, say what's on today's calendar as proof.
   - The tool is missing or not authorized → tell the user how to connect it, in {{LANG}}: the Google Calendar connector is enabled in Claude settings → Connectors → Google Calendar → Connect; in the Claude Code CLI, run `/mcp` and authorize `claude.ai Google Calendar`. Then say: "Connect it and say 'calendar ready' — I'll test again. Or say 'skip' and I'll plan without it."
   - Still not working, or the user says "skip" → write `none`. Setup never blocks on the calendar.

---

## S5 — Habits to track

"Are there habits you want to watch or limit — alcohol, smoking, doomscrolling, sugar, energy drinks, gaming, anything else? For each habit:
- **Target:** zero (don't want it), limit (hold below X), or observe only (understand the pattern)?
- **Mode:** Should I ask you about it proactively (I ask every evening), or only log it reactively (you tell me when it happens)?"

Default if unsure: **reactive** (you name it, I record it; I never ask first).

Store as the habit table in base.md §4h: one row per habit, filling {{HABIT_1}}, {{HABIT_2}} (add rows if more). If no habits, write "not set".

---

## S6 — Failure map (your anti-patterns)

**Part 1 — Working patterns (§3.1): keep or delete each of the seven?**

Show the seven defaults from `base.md` §3.1 — **one line each, in your own words, a few at a time** (not the full text, or the interview drowns):
- 3.1.1. High engagement after launch — high entry threshold, but holds for hours once started
- 3.1.2. Precise verbalization of your own state — you can name your pattern in words
- 3.1.3. Intellectual curiosity as the launch engine — a substantive angle gets you in faster
- 3.1.4. Speed in a logically structured environment — complex-but-logical beats simple-but-vague
- 3.1.5. Translating "I'm bad" into "here is a concrete pattern" — almost a meta-position skill
- 3.1.6. High standards belong to the finish, not the start — "a draft is not evaluated"
- 3.1.7. Adaptivity to external structure — a deadline or one person who asks is a resource

For each: "Does this ring true for you — keep or delete?" Say plainly that deleting is normal: a map of seven patterns that aren't theirs is worse than a map of two that are. What stays becomes the map the assistant leans on by number.

Store keep/delete decisions for §3.1. Deleted ones are removed from `base.md` entirely at S9.

**Part 2 — Anti-patterns (§3.2): keep or delete each of the seven?**

Same format, one line each, a few at a time:
- 3.2.1. Preparation as work
- 3.2.2. Analysis as outcome
- 3.2.3. Self-analysis as criticism in a smart wrapper
- 3.2.4. Postponing readiness
- 3.2.5. Scatter instead of sequence — busy day, nothing carried to completion
- 3.2.6. Acting from anxiety, not interest — relief instead of gladness when it's done
- 3.2.7. Active compliance with passive choice — much done, nothing chosen

For each: "Does this one resonate with you?" Store keep/delete decisions.

**Note:** 3.2.5 / 3.2.6 / 3.2.7 each have a matching field in the day file (§14: "Carried to completion", "Fuel of the day", "Choice of the day"). If the user deletes one of these three, delete its field from the **§14 template** at S9 — that one edit is the whole job. The evening protocol and `day-validator` both read §14 and ask for exactly what's listed there, so nothing else needs syncing.

**Part 3 — Up to 3 personal anti-patterns.**

For each one you want to add, ask three questions:
1. "What does it feel like from inside when this pattern fires?"
2. "What would a stranger reading your journal observe? (The external marker.)"
3. "What **exact sentence** should I say to you when it fires? (Verbatim — I won't soften it.)"

Store each as `{{PERSONAL_PATTERN_1}}`, `{{PERSONAL_PATTERN_2}}`, `{{PERSONAL_PATTERN_3}}` (or "not set" for empty slots).

---

## S7 — Boundaries (off-limits topics)

"Are there topics the assistant should never challenge or push on?  (e.g., people, grief, faith, health decisions, family.) On these I'll only listen and reflect, never argue or pressure."

Store as `{{NO_CHALLENGE_TOPICS}}`.

"Are there words or framings you don't want to hear?"

Store as `{{CUSTOM_DONTS}}`.

---

## S8 — First 2-week plan

"Let's build your first 2-week plan together. Pick a start date. We'll fill in 14 days: one main task per day, at least one rest / empty day, and ideally one rest day after anything big.

Walk through the dates together, filling in main tasks day by day. Check against `base.md` §10c rules:
- 14 rows total
- 1 main task per day (no two "big" tasks in one day)
- At least one empty / rest day
- At least one rest day after a big effort
- Check-ins: at least 1 per week

Store as the 2-week table in `current-plan.md` format.

**Also create the watchlist:** Ask the user to name anything from this interview that has a future date or "someday" flavor. Seed `watchlist.md`:
- Deadlines → §1 (active / deadlines)
- Ideas / projects → §2 (project queue)
- Blockers → §3 (blockers)
- Observations → §4 (observations)
- Top-level milestones → §0 (milestones)

**Explain how the watchlist works** (in {{LANG}}, user's own words, ~3 lines):
1. Anything with a future date or "someday" — you just name it ("note this for Friday") and I file it to the watchlist.
2. The day file is only today — future tasks never go there.
3. When a dated item arrives, it walks into the morning plan by itself; when done, I move it to archive with the date — you don't remember twice.

Get confirmation: "Does that make sense?"

---

## S9 — Finish

Now you have all answers. Do this:

1. **Rewrite `base.md`:** Replace every placeholder token with the user's actual answers (or "not set" for skipped ones). Then prune what the user rejected: delete the §3.1 / §3.2 patterns they chose to delete, delete unused goal sections in §5, and drop any of the three accounting fields whose anti-pattern (3.2.5 / 3.2.6 / 3.2.7) was deleted — from the §14 template only; the evening protocol and `day-validator` read §14 and follow it.

   **All edits stay inside `base.md`.** Do not rewrite files in `.claude/` — the skills and agents are written to adapt to whatever §14 and §4h list. Prose there that names a deleted pattern is documentation, not a bug.

2. **Create data files:**
   - `current-plan.md`: Write the 14-day table with the dates and tasks.
   - `watchlist.md`: Write the seeded watchlist sections.

3. **Read the configuration back** in {{LANG}}:
   - "Your setup is complete. Here's what I have:"
   - Read back their name/address, language, day skeleton (morning anchors, fixed activities, meals, learning block, options, rest anchor).
   - Read back their tracked habits and targets.
   - Read back which working patterns (§3.1) and anti-patterns (§3.2) they kept.
   - Read back their top goal and its marker.

4. **List trigger phrases** (in {{LANG}}). Show which commands activate which skills:
   - "let's plan the day" → morning protocol
   - "note this for [date]" → watchlist entry
   - "wrap up" → evening protocol
   - "retro" → weekly summary
   - etc.

5. **Set the setup date** to today in the `base.md` config block.

6. **Delete §S from `base.md` — mandatory, LAST, and easy to forget.** Do this only after every other edit to `base.md` is finished. The interview text quotes placeholder tokens as documentation ("Answer → the LANG token"). Those quotes can never be "filled", so if §S survives, `base.md` still matches the first-run gate and **every daily skill will bounce back to setup forever** — the kit becomes permanently unusable. Setup is not complete until §S is gone.
   **Verify:** search `base.md` for the token pattern `\{\{[A-Z_0-9]+\}\}` — zero matches = done. Search for that pattern, **not** a bare `{{`: base.md §0 item 0 defines the gate and names the pattern in prose, so it always contains brace characters and must survive.

7. **Final message:**
   "Setup complete. From now on, the daily protocols are live. Tomorrow morning, say 'let's plan the day' — I'll help you set up your first day."

---

## Rules

- **Never invent content.** Every answer comes from the user's own words. "Skip" or "not set" is a valid answer.
- **Interview length:** aim for 10–15 minutes total across all steps.
- **Language:** switch to {{LANG}} after S1, and stay there for the entire interview and all outputs.
- **After S9:** all other skills (morning, day, evening, retro, cycle) can now run. The setup skill itself steps back.

---

## Failure mode: interrupted setup

If the user says "stop" or walks away mid-setup, they can resume: the next message will see the incomplete placeholders and restart this skill at the last step. No data is lost.
