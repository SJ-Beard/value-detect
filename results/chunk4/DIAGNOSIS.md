# Diagnosis: why the action's measured intake was tiny

All numbers in nats (one bit = 0.693). 'Hand-predicted' values are derived from the
world's designed noise rates before measuring.

## Exhibit 1 — the inputs are there, but encrypted (real trace)

| Measurement of tomorrow's action | Reading |
|---|---|
| From belief alone (pairwise) | 0.0005 |
| From goal alone (pairwise) | 0.0004 |
| From sensor-line alone (pairwise) | 0.0011 |
| From sensor-line AND goal **jointly** | **0.3044** |
| Hand-predicted joint value from noise rates | 0.3050 |

(The Chunk 4 mega-state cross-check read A's intake as 0.3085 — same story; G's stayed at the bias floor, 0.0051, alongside pure noise W at 0.0070.)

## Exhibit 2 — re-timing the world does NOT fix it (variant simulation)

Variant loop in which the decision lags a full tick (tomorrow's action is computed
from today's belief and goal), exactly as proposed:

| Measurement of tomorrow's action | Reading |
|---|---|
| From belief alone (pairwise) | 0.0015 |
| From goal alone (pairwise) | 0.0003 |
| From belief AND goal **jointly** | **0.5197** |
| Hand-predicted joint value | 0.5252 |

Each input alone still reads ~zero even with the lag in place: the hiding is done by
the XOR combination (each input is a cipher key for the other), not by the timing.

## Exhibit 3 — one extra conditioning variable decrypts the outbound flows (real trace)

| Measurement | Reading | Hand-predicted |
|---|---|---|
| Belief drives environment, measured naively | 0.0013 | — |
| ... decrypted with the goal as key | 0.4422 | 0.4458 |
| Goal drives environment, measured naively | 0.0002 | — |
| ... decrypted with the belief as key | 0.4411 | 0.4458 |
| Goal drives environment, wrongly conditioned on the action wire (mediator) | 0.0002 | — |
| ... conditioned on the noisy action readout (partial mediator screen) | 0.0001 | — |
| Distractor 'drives' environment, naively | 0.0001 | — |
| ... with belief as key (fake drive must stay dead) | 0.0001 | — |
| Goal's grip on tomorrow's action, decrypted by the sensor line | 0.3033 | 0.3050 |

Reading the exhibits together: single-variable (pairwise) conventions under-read every
flow that passes through an XOR-style combination; one well-chosen extra conditioning
variable restores it to its true size; conditioning on a mediator destroys it (as the
design warned); and decoy 'witness' flows stay dead under decryption. The instrument
family is sound — the choice of conditioning convention decides what it can see.
