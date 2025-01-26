| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2304828 |
| mobx | broadPropagation (success) | 4364735 |
| mobx | deepPropagation (success) | 1561349 |
| mobx | diamond (success) | 2476179 |
| mobx | mux (success) | 1807786 |
| mobx | repeatedObservers (success) | 233684 |
| mobx | triangle (success) | 764849 |
| mobx | unstable (success) | 358000 |
| mobx | molBench | 588534 |
| mobx | create_signals | 68600 |
| mobx | comp_0to1 | 20854 |
| mobx | comp_1to1 | 31536 |
| mobx | comp_2to1 | 22522 |
| mobx | comp_4to1 | 21608 |
| mobx | comp_1000to1 | 19 |
| mobx | comp_1to2 | 32832 |
| mobx | comp_1to4 | 21737 |
| mobx | comp_1to8 | 20375 |
| mobx | comp_1to1000 | 15205 |
| mobx | update_1to1 | 24308 |
| mobx | update_2to1 | 11798 |
| mobx | update_4to1 | 7301 |
| mobx | update_1000to1 | 68 |
| mobx | update_1to2 | 14174 |
| mobx | update_1to4 | 6978 |
| mobx | update_1to1000 | 182 |
| mobx | cellx1000 (first: pass, last: pass) | 70536 |
| mobx | cellx2500 (first: pass, last: pass) | 257969 |
| mobx | cellx5000 (first: pass, last: pass) | 541755 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 1995920 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1528163 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1832371 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3477717 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1122771 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1650857 |
