| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2295643 |
| mobx | broadPropagation (success) | 4279551 |
| mobx | deepPropagation (success) | 1561186 |
| mobx | diamond (success) | 2403706 |
| mobx | mux (success) | 1793313 |
| mobx | repeatedObservers (success) | 232578 |
| mobx | triangle (success) | 768827 |
| mobx | unstable (success) | 342462 |
| mobx | molBench | 584453 |
| mobx | create_signals | 67016 |
| mobx | comp_0to1 | 20346 |
| mobx | comp_1to1 | 31740 |
| mobx | comp_2to1 | 35967 |
| mobx | comp_4to1 | 22373 |
| mobx | comp_1000to1 | 16 |
| mobx | comp_1to2 | 33119 |
| mobx | comp_1to4 | 17484 |
| mobx | comp_1to8 | 19809 |
| mobx | comp_1to1000 | 14867 |
| mobx | update_1to1 | 21283 |
| mobx | update_2to1 | 10369 |
| mobx | update_4to1 | 5595 |
| mobx | update_1000to1 | 51 |
| mobx | update_1to2 | 10416 |
| mobx | update_1to4 | 5189 |
| mobx | update_1to1000 | 168 |
| mobx | cellx1000 (first: pass, last: pass) | 68853 |
| mobx | cellx2500 (first: pass, last: pass) | 251970 |
| mobx | cellx5000 (first: pass, last: pass) | 554984 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 1977574 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1490556 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1819740 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3334991 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1138472 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1657213 |
