# Chunk 3 — the measuring tools, checked against known answers

All numbers in 'nats'; one bit = 0.693. 'Expected' is worked out by hand.

| Check | Expected | Measured |
|---|---|---|
| A variable that copies another, one step later -> should read one bit | 0.6931 | 0.6930 |
| The same, measured backwards -> should read nothing | 0.0000 | 0.0000 |
| A noisy copy (5% errors) -> a partial reading | 0.4946 | 0.4924 |
| A noisy copy (15% errors) -> a partial reading | 0.2704 | 0.2696 |
| A noisy copy (30% errors) -> a partial reading | 0.0823 | 0.0817 |
| Two unrelated coin-flips -> should read nothing | 0.0000 | 0.0000 |
| Bias on unrelated pair, little data (2k steps) -> small, positive | 0.0000 | 0.0003 |
| Bias on unrelated pair, more data (80k steps) -> smaller | 0.0000 | 0.0000 |
| Flow through a middle-man, measured directly -> one bit | 0.6931 | 0.6930 |
| The same, but conditioning on the middle-man -> collapses to nothing | 0.0000 | 0.0001 |

## The built-in audit (does inflow + outflow add up to the total?)
A mathematical law says the total link between two variables must equal the flow one
way plus the flow the other way. If our tools obey it, they are internally consistent.

| Case | Total link | Forward flow | Backward flow | Forward+Backward | Left-over |
|---|---|---|---|---|---|
| One-way (X drives Y) | 1.386 | 1.386 | 0.000 | 1.386 | -0.000 |
| Two-way (mutual) | 1.386 | 0.693 | 0.693 | 1.386 | -0.000 |

A left-over near zero means the books balance exactly.
