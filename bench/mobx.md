| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2304876 |
| mobx | broadPropagation (success) | 4339798 |
| mobx | deepPropagation (success) | 1540867 |
| mobx | diamond (success) | 2386561 |
| mobx | mux (success) | 1795769 |
| mobx | repeatedObservers (success) | 230872 |
| mobx | triangle (success) | 759404 |
| mobx | unstable (success) | 353488 |
| mobx | molBench | 587896 |
| mobx | create_signals | 68581 |
| mobx | comp_0to1 | 23407 |
| mobx | comp_1to1 | 23042 |
| mobx | comp_2to1 | 9196 |
| mobx | comp_4to1 | 29698 |
| mobx | comp_1000to1 | 38 |
| mobx | comp_1to2 | 29886 |
| mobx | comp_1to4 | 19427 |
| mobx | comp_1to8 | 26829 |
| mobx | comp_1to1000 | 21320 |
| mobx | update_1to1 | 26035 |
| mobx | update_2to1 | 13062 |
| mobx | update_4to1 | 6663 |
| mobx | update_1000to1 | 69 |
| mobx | update_1to2 | 10564 |
| mobx | update_1to4 | 7020 |
| mobx | update_1to1000 | 164 |
| mobx | cellx1000 (first: pass, last: pass) | 71842 |
| mobx | cellx2500 (first: pass, last: pass) | 244698 |
| mobx | cellx5000 (first: pass, last: pass) | 548200 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 2004587 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1499928 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1798694 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3485374 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1114933 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1682823 |
