# Daily OS Starter Kit

*[Русская версия ниже](#daily-os-starter-kit-русская-версия)*

A daily operating system for Claude Code: schedule + journal + an AI assistant. No app, no database, no code — just markdown files and a folder of daily notes on your computer.

## What it is

A self-management tool based on behavior-change research.

You get a **schedule assistant**. It:

- helps distribute tasks,
- keeps focus on the main thing and occasionally notices what you don't notice yourself,
- also knows your working patterns and how you approach tasks.

Works exactly as well as you answered honestly about yourself in the setup interview.

There are specific working schemes for productivity and healthy lifestyle formation (in case that's about you) — I pulled them from research (details in base.md).

## What you need

- [Claude Code](https://claude.com/claude-code) (CLI, desktop app, or IDE extension).
- This folder anywhere you like (e.g., `Documents/daily-os/`).
- Windows: PowerShell (for the status hook). macOS/Linux: rewrite the two hooks in `settings.json` for your shell — don't delete the file entirely, it also carries the calendar permissions and the real-clock hook.
- **Optional — Google Calendar.** If connected, the morning plan is built around your real meetings, not on top of them. Connection: Claude settings → Connectors → Google Calendar, or run `/mcp` in Claude Code CLI and authorize `claude.ai Google Calendar`. Setup will ask about this and test the connection; if you decline, the kit plans only from the 2-week plan and watchlist. Events are read, never written — nothing is sent to the calendar or anywhere else.

## Install (3 steps)

1. **Put the folder anywhere** (e.g., `Documents/daily-os/`).

    ```
    daily-os-starter-kit/
      README.md                          ← you are here
      CLAUDE.md                          ← boundaries and first-run gate
      base.md                            ← shared rules layer (filled during setup)
      templates/
        current-plan.md                  ← your 2-week table
        watchlist.md                     ← your master queue
      .claude/
        skills/
          setup/SKILL.md                 ← first-run interview
          morning/SKILL.md               ← day plan (trigger: "let's start the day")
          day/SKILL.md                   ← daytime log (triggers: food, events, "done")
          evening/SKILL.md               ← wrap up (trigger: "end of day")
          retro/SKILL.md                 ← weekly retro (trigger: "retro")
          cycle/SKILL.md                 ← 2-week plan rotation (auto every 14 days)
        agents/
          day-validator.md               ← completeness check (read-only)
          retro-agent.md                 ← weekly summary draft
          cycle-agent.md                 ← new plan draft
        hooks/
          day-status.ps1                 ← status on session start (Windows)
        settings.json                    ← registers the status hook and time hook
    ```

    Setup will create `weeks/` (weekly and cycle reviews) and `archive/` (retired plans) when first needed. Goals are not a file: they live in `base.md` §5.

2. **Open the folder in Claude Code.**

3. **Write anything** — "set me up", "hello", whatever. The assistant will refuse to run daily protocols and start the setup interview instead.

## First run: setup interview

Until there is at least one `{{placeholder}}` left in `base.md`, daily skills don't work. The interview (no more than 3 questions per message, ~10 minutes total) asks:

1. **Language**: English or Russian? (Files stay in English; only the conversation switches.)
2. **Who are you**: work/study, current life situation, how to address you.
3. **Goals (up to 3)**: for each — the result; what counts as a visible external trace (something another person could see, not "got better at X"); how the goal usually dies; and the exact phrase you want to hear when it stalls. Written into `base.md` §5.
4. **Day skeleton**: morning must-haves, weekly fixed activities, meals, one rest anchor (e.g., meditation), evening blocks (what's required, what's not), and whether to pull Google Calendar into the plan.
5. **Tracked habits**: alcohol, doomscrolling, sugar — anything. For each: target (zero / limit / observation) and whether to ask proactively or only log what you mention.
6. **Your patterns**: seven working patterns (§3.1) and seven anti-patterns (§3.2) — for each, "keep or delete". Deleting is normal; what stays is the map the assistant refers to by number. Plus up to 3 personal anti-patterns, each with: how it feels from inside, what a stranger would see, and the exact phrase to hear when it fires.
7. **Off-limits topics**: what the assistant never challenges (grief, faith, people, health).
8. **First 2-week plan**: build together (14 rows, 1 main task per day, minimum 1 rest day).

Then the assistant rewrites its own brain (`base.md`) with your answers. From that moment, the file is yours, not a template.

## Daily use

| You say | What happens |
|---|---|
| **"let's start the day"** | Morning protocol: energy check, day skeleton tick, main task from the 2-week plan, first action for 5–15 minutes, minimum for the worst day, if-then for the day's main risk, day file written. |
| **"note this for Friday"** (or any future date) | Goes straight to `watchlist.md` (master queue), never the day file. Surfaces in the morning plan automatically when the date arrives. |
| **"done with X"** (anytime during the day) | Logged in today's file with a real timestamp. |
| **"end of day"** | Evening protocol: count what was done (caveats forbidden), three one-word accounting fields (carried through / fuel / choice), credit one thing done despite difficulty, deviations as data (not verdict), emotional background (5 light fields, not therapy). |
| **"retro"** (any day) | Weekly summary: what counted this week, goal markers, a pattern you might not have noticed. |
| Every 14 days | The assistant notices the cycle end and rebuilds the plan — you don't re-plan, it does. Old plan → archive. |

Starter kit v1.0 — a complete operating system ready for first-time setup. Inside:

- 6 skills — setup plus 5 daily ones (morning, day, evening, retro, cycle) — with full protocols.
- 3 read-only agents (validator, retro-agent, cycle-agent).
- Session-start hook (Windows PowerShell; rewritable for other shells).
- Full setup interview that keeps the system gated until filled.

Open the folder in Claude Code and write anything.

---

# Daily OS Starter Kit (русская версия)

Дневная операционная система для Claude Code: расписание + дневник + ИИ-ассистент. Ни приложения, ни базы данных, ни кода — только markdown-файлы и папка ежедневных заметок на вашем компьютере.

## Что это

Инструмент самоуправления на основе исследований об изменении поведения.

Вы получаете **помощника по расписанию**. Он:

- помогает распределить задачи,
- держать фокус на главной и иногда замечать то, что вы сами не замечаете,
- ещё — знает ваши рабочие паттерны и как вы приступаете к задачам.

Работает ровно настолько под вас, насколько точно вы ответили про себя в установочном интервью.

Есть конкретные рабочие схемы по продуктивности и формированию здорового образа жизни (на случай если это про вас) — я переносила из исследований (подробно в base.md).

## Что нужно

- [Claude Code](https://claude.com/claude-code) (CLI, десктоп-приложение или расширение для IDE).
- Эта папка в любом удобном месте (например, `Documents/daily-os/`).
- Windows: PowerShell (для хука статуса). macOS/Linux: перепишите два хука в `settings.json` под свою оболочку — не удаляйте файл целиком, в нём же лежат разрешения для календаря и хук реального времени.
- **Опционально — Google Calendar.** Если подключить, утренний план строится вокруг ваших реальных встреч, а не поверх них. Подключение: настройки Claude → Connectors → Google Calendar, либо команда `/mcp` в Claude Code CLI и авторизация `claude.ai Google Calendar`. Setup спросит об этом и проверит связь; откажетесь — кит планирует только по 2-недельному плану и watchlist. События читаются, никогда не записываются — в календарь и куда-либо ещё не отправляется ничего.

## Установка (3 шага)

1. **Положите папку куда угодно** (например, `Documents/daily-os/`).

    ```
    daily-os-starter-kit/
      README.md                          ← вы здесь
      CLAUDE.md                          ← границы и гейт первого запуска
      base.md                            ← слой общих правил (заполняется при настройке)
      templates/
        current-plan.md                  ← ваша 2-недельная таблица
        watchlist.md                     ← ваша главная очередь
      .claude/
        skills/
          setup/SKILL.md                 ← интервью первого запуска
          morning/SKILL.md               ← план дня (триггер: «собираем день»)
          day/SKILL.md                   ← дневной лог (триггеры: еда, события, «сделала»)
          evening/SKILL.md               ← итоги (триггер: «конец дня»)
          retro/SKILL.md                 ← недельная ретро (триггер: «ретро»)
          cycle/SKILL.md                 ← смена 2-недельного плана (авто каждые 14 дней)
        agents/
          day-validator.md               ← проверка полноты (только чтение)
          retro-agent.md                 ← черновик недельной сводки
          cycle-agent.md                 ← черновик нового плана
        hooks/
          day-status.ps1                 ← статус при старте сессии (Windows)
        settings.json                    ← регистрирует хук статуса и хук времени
    ```

    Setup сам создаст `weeks/` (недельные и цикловые разборы) и `archive/` (отработавшие планы), когда они впервые понадобятся. Цели — не файл: они живут в `base.md` §5.

2. **Откройте папку в Claude Code.**

3. **Напишите что угодно** — «настрой меня», «привет», любое. Помощник откажется запускать дневные протоколы и начнёт интервью настройки.

## Первый запуск: интервью настройки

Пока в `base.md` остаётся хоть один `{{плейсхолдер}}`, дневные скиллы не работают. Интервью (не более 3 вопросов за реплику, ~10 минут целиком) спрашивает:

1. **Язык**: английский или русский? (Файлы остаются на английском; переключается только разговор.)
2. **Кто вы**: работа/учёба, текущая жизненная ситуация, как к вам обращаться.
3. **Цели (до 3)**: по каждой — результат; что считается видимым внешним следом (то, что мог бы увидеть другой человек, а не «стал лучше в X»); как цель обычно умирает; и точная фраза, которую вы хотите услышать, когда она встанет. Записываются в `base.md` §5.
4. **Каркас дня**: утренние обязательные, недельные фиксированные занятия, приёмы пищи, один якорь отдыха (например, медитация), вечерние блоки (что обязательно, что нет) и подтягивать ли Google Calendar в план.
5. **Отслеживаемые привычки**: алкоголь, думскроллинг, сахар — что угодно. По каждой: цель (ноль / лимит / наблюдение) и спрашивать ли проактивно или только фиксировать упомянутое вами.
6. **Ваши паттерны**: семь рабочих паттернов (§3.1) и семь антипаттернов (§3.2) — по каждому решение «оставить или удалить». Удалять — нормально; то, что осталось, и есть карта, на которую помощник ссылается по номеру. Плюс до 3 личных антипаттернов, к каждому: как это ощущается изнутри, что увидел бы посторонний, и точная фраза, которую надо услышать при срабатывании.
7. **Запретные темы**: то, что помощник никогда не оспаривает (горе, вера, люди, здоровье).
8. **Первый 2-недельный план**: собираете вместе (14 строк, 1 главная задача в день, минимум 1 день отдыха).

Потом помощник переписывает свой собственный мозг (`base.md`) вашими ответами. С этого момента файл ваш, а не шаблон.

## Ежедневное использование

| Вы говорите | Что происходит |
|---|---|
| **«давай начнём день»** | Протокол утра: проверка энергии, отметка каркаса дня, главная задача из 2-недельного плана, первое действие на 5–15 минут, минимум на худший день, if-then на главный риск дня, файл дня записан. |
| **«запомни на пятницу»** (или любая будущая дата) | Уходит прямо в `watchlist.md` (главная очередь), никогда в файл дня. Всплывёт в утреннем плане сама, когда дата придёт. |
| **«сделал/а X»** (в любой момент дня) | Фиксируется в файле сегодняшнего дня с реальным временем. |
| **«конец дня»** | Протокол вечера: учёт сделанного (оговорки запрещены), три поля учёта по одному слову (доведено / топливо / выбор), признание одного дела, сделанного вопреки трудности, отклонения как данные (не приговор), эмоциональный фон (5 лёгких полей, не терапия). |
| **«ретро»** (в любой день) | Недельная сводка: что засчитано за неделю, маркеры целей, паттерн, который вы могли не заметить. |
| Каждые 14 дней | Помощник сам замечает конец цикла и пересобирает план — вы не перепланируете, это делает он. Старый план → в архив. |

Стартер-кит v1.0 — законченная операционная система, готовая к первой настройке. Внутри:

- 6 скиллов — setup плюс 5 дневных (утро, день, вечер, ретро, цикл) — с полными протоколами.
- 3 агента только для чтения (валидатор, ретро-агент, агент цикла).
- Хук старта сессии (Windows PowerShell; переписывается под другие оболочки).
- Полное интервью настройки, которое держит систему закрытой, пока не заполнено.

Откройте папку в Claude Code и напишите что угодно.
