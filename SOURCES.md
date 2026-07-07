# Sources and Influences

The intellectual foundations of this system. When making suggestions or pushing back on
changes, Claude should reason from these — understanding the *why* behind a strategy is
more useful than pattern-matching on the strategy alone.

Where a source has been read/watched directly, that's noted. Where it's been absorbed
secondhand (via Claude summaries, podcast references, etc.), that's noted too — secondhand
understanding is useful but should be held with less confidence.

---

## Russell Barkley — executive function model of ADHD

[russellbarkley.org](https://www.russellbarkley.org/) · [YouTube](https://www.youtube.com/channel/UC0tLWu7ljYVFPiZQfHjTMsA) · *Taking Charge of Adult ADHD*

Researcher and clinician; the most cited ADHD voice in this system. Not read directly —
absorbed via Claude summaries and secondary sources.

Core claim: ADHD is not primarily a disorder of attention but of **self-regulation** —
specifically deficits in working memory, inhibition, and time perception. This reframes
every "why didn't you just..." question as a structural capacity question, not a
motivation or character question.

Practical implication for this system: any design decision that relies on remembering,
estimating time, or resisting impulse is working against the grain. Externalise everything.

Primary sources (for future direct reading): *Taking Charge of Adult ADHD*; YouTube
lecture series on ADHD and executive function.

---

## Dr. Alok Kanojia (Dr. K) — HealthyGamerGG, "ADHD & Doing Stuff" module

[ADHD module](https://coaching.healthygamer.gg/guide/modules/adhd) · [HealthyGamerGG](https://www.healthygamer.gg/)

Psychiatrist and streamer. The ADHD module is part of *Dr. K's Guide to Mental Health*
(coaching.healthygamer.gg) — 40+ videos with worksheets covering attention, impulsivity,
and the relationship between thoughts and actions.

Distinctive angle: Dr. K bridges clinical psychiatry with how ADHD actually manifests in
modern, screen-heavy, dopamine-rich environments. Useful where Barkley gives the
neurological model and this system needs the behavioural translation layer.

Worked through directly.

---

## Jessica McCabe — How to ADHD (YouTube channel)

[YouTube](https://www.youtube.com/@HowtoADHD)

Practical, evidence-based ADHD strategies translated for everyday use. Where many of
the "this is actually an ADHD thing, not a character flaw" reframes originate.

Contributions to this system: capture-anywhere reflex, reducing friction as the primary
intervention, and the framing of system failures as design problems rather than user failures.

Watched directly — an ongoing channel, so this reflects episodes seen, not a fixed corpus.

---

## Jason — Midwest Magic Cleaning (YouTube channel)

[YouTube](https://www.youtube.com/@MidwestMagicCleaning)

Cleaning and organising strategies specifically for ADHD/autistic brains. The channel's
central method — "The Fluid Method" — reframes cleaning as a non-linear, low-commitment
flow rather than a task list to execute in order.

The user's insight: the principle generalises far beyond physical cleaning. Any "mess"
— an overflowing inbox, a tangled project, a sprawling someday queue — responds to the
same approach: don't try to impose order top-down, follow what's moveable, build
momentum from small visible wins, and resist the urge to fully plan before starting.

Applied here: when a triage session stalls because the user is trying to figure out
the perfect system before processing a single item, the Midwest Magic heuristic applies —
start moving things, the shape of the system becomes clear in motion.

Watched directly — an ongoing channel, so this reflects episodes seen, not a fixed corpus.

---

## Jesse J. Anderson — ADHD Motivation Mastery (course)

[ADHD Motivation Mastery](https://www.adhdmotivationmastery.com/)

The course "ADHD Motivation Mastery" is the influence here — taken directly.

Key idea: ADHD motivation doesn't run on importance or willpower — it runs on specific
triggers. His **4 Cs framework**: Challenge, Competition, Creativity, Completion. If an
item has none of these, it won't get done regardless of how important it is.

Practical implication: when an active item keeps getting skipped, ask which of the 4 Cs
is missing and whether one can be engineered in — rather than just rescheduling.

---

## David Allen — *Getting Things Done*

[gettingthingsdone.com](https://gettingthingsdone.com/)

The structural backbone of this system: one inbox, the clarify/organise/reflect/engage
cycle, next physical action, someday/maybe.

Read directly. This implementation diverges from Allen in several places:
- Context tags are pared back (Allen's @context system is extensive; this system keeps
  only a handful).
- The two-minute rule is triage-only, not a universal rule, to avoid mid-focus-block
  interruptions.
- Projects are tracked separately from tasks (Allen conflates them more than this system does).

When in doubt, divergence from Allen is intentional — don't restore GTD orthodoxy
without checking whether the deviation was a considered choice.

---

## Jonathan Cutrell — Developer Tea (podcast)

[developertea.com](https://developertea.com/)

One specific idea from this podcast:

> A project needs both a goal *and* a deadline. Missing either, it's just a dream.

The underlying aphorism is older (often attributed to Napoleon Hill or Harvey Mackay:
"a goal is a dream with a deadline"), but the *project* framing — two ingredients, both
required — is the version this system uses.

Applied here: any project entry without a clear outcome *and* a timeframe is a
placeholder, not a plan. The weekly review should surface these and either add the
missing ingredient or demote the entry to Someday.

Listened to directly — an ongoing podcast, so this reflects episodes heard, not a fixed corpus.

---

## Charles Conn & Robert McLean — *Bulletproof Problem Solving* (McKinsey)

[bulletproofproblemsolving.com](https://bulletproofproblemsolving.com/)

Read directly, though not yet applied to this system — anticipated for the project
decomposition workflow.

Core method: MECE issue trees (Mutually Exclusive, Collectively Exhaustive), hypothesis-
driven analysis, and prioritisation by impact rather than completeness. The discipline
of decomposing a problem into non-overlapping, jointly exhaustive sub-questions before
proposing solutions.

When the project decomposition skill is built, this is the primary reference for the
decomposition step.

---

## Sönke Ahrens — *How to Take Smart Notes*

[takesmartnotes.com](https://takesmartnotes.com/) · in `REFERENCES.bib` as `@ahrens2017HowTakeSmart`

Read directly. The book that defines the zettelkasten method the note system implements.

Core: the thinking happens in the *writing*, not in collecting; notes progress fleeting →
literature → permanent, and the load-bearing move is restating a source's idea in your own
words — the step that is easiest to skip and matters most.

Shapes: ADR 0001 (note maturity lifecycle) and ADR 0019 (the seven-criteria quality bar —
especially the comprehension→integration step, which is Ahrens' "write it in your own
words" turned into a criterion).

---

## Mortimer Adler & Charles Van Doren — *How to Read a Book*

[Wikipedia](https://en.wikipedia.org/wiki/How_to_Read_a_Book) · in `REFERENCES.bib` as `@adler2014HowReadBook`

Read directly. The backbone of the literature-note workflow.

Core: four levels of reading (elementary, inspectional, analytical, syntopical). Analytical
reading means X-raying the structure, coming to terms with the author's key words, stating
the book's unity, then judging it — and a fair critic must understand before agreeing or
disagreeing. A book can fall short in exactly four ways: uninformed, misinformed,
illogical, incomplete.

Shapes: ADR 0022 (literature note workflow) end to end — its Orientation / Capture /
Reflection stages mirror Adler's, and the Reflection cues *are* Adler's "state the unity,"
his four failure modes, and "what of it?".

---

## Andy Matuschak — *Evergreen notes*

[notes.andymatuschak.org](https://notes.andymatuschak.org/Evergreen_notes)

Read directly (his public working notes / digital garden).

Core: evergreen notes are atomic, densely linked, concept-oriented, and written to
accumulate over time; prefer associative links between ideas over hierarchical
categorisation; writing the notes *is* the thinking, not a record of it.

Shapes: ADR 0019 ("prefer links to taxonomy; tags earn their place at critical mass") and
ADR 0025 (tag axes — a link carries the *relationship*, a tag only set membership).

---

## Niklas Luhmann — *Communicating with Slip Boxes* (Zettelkasten originator)

[luhmann.surge.sh](https://luhmann.surge.sh/) — English translation of "Kommunikation mit Zettelkästen"

**Not read directly** — absorbed secondhand, via Ahrens and general zettelkasten discourse;
the original Luhmann essay is on the list. Hold with less confidence than the others.

Core: the slip-box functions as a communication/thinking partner; ideas gain value through
links and branching numbers, and the record *accretes* rather than being overwritten. The
often-cited "never change a note" is partly a genuine principle (don't destroy the record)
and partly an artifact of the paper medium.

Shapes: ADR 0024 (notes evolve by append, not rewrite) — which separates Luhmann's real
principle from the paper artifact and reinterprets "preserve the record" as dated appends
in a digital graph.
