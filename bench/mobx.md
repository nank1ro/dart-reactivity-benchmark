| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2345863 |
| mobx | broadPropagation (success) | 4387804 |
| mobx | deepPropagation (success) | 1567272 |
| mobx | diamond (success) | 2498021 |
| mobx | mux (success) | 1861568 |
| mobx | repeatedObservers (success) | 233884 |
| mobx | triangle (success) | 791480 |
| mobx | unstable (success) | 352687 |
| mobx | molBench | 580502 |
| mobx | create_signals | 67744 |
| mobx | comp_0to1 | 25910 |
| mobx | comp_1to1 | 30562 |
| mobx | comp_2to1 | 33012 |
| mobx | comp_4to1 | 17256 |
| mobx | comp_1000to1 | 21 |
| mobx | comp_1to2 | 34682 |
| mobx | comp_1to4 | 19916 |
| mobx | comp_1to8 | 24398 |
| mobx | comp_1to1000 | 14955 |
| mobx | update_1to1 | 23789 |
| mobx | update_2to1 | 10779 |
| mobx | update_4to1 | 6315 |
| mobx | update_1000to1 | 57 |
| mobx | update_1to2 | 12594 |
| mobx | update_1to4 | 5769 |
| mobx | update_1to1000 | 164 |
| mobx | cellx1000 (first: pass, last: pass) | 71204 |
| mobx | cellx2500 (first: pass, last: pass) | 240277 |
| mobx | cellx5000 (first: pass, last: pass) | 552355 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 2104423 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1581011 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1860447 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3585677 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1200659 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1708041 |
