| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2345450 |
| mobx | broadPropagation (success) | 4338321 |
| mobx | deepPropagation (success) | 1552351 |
| mobx | diamond (success) | 2451789 |
| mobx | mux (success) | 1847411 |
| mobx | repeatedObservers (success) | 232122 |
| mobx | triangle (success) | 777825 |
| mobx | unstable (success) | 356027 |
| mobx | molBench | 582220 |
| mobx | create_signals | 55363 |
| mobx | comp_0to1 | 15736 |
| mobx | comp_1to1 | 41209 |
| mobx | comp_2to1 | 35685 |
| mobx | comp_4to1 | 15151 |
| mobx | comp_1000to1 | 16 |
| mobx | comp_1to2 | 33966 |
| mobx | comp_1to4 | 17687 |
| mobx | comp_1to8 | 20232 |
| mobx | comp_1to1000 | 15191 |
| mobx | update_1to1 | 26381 |
| mobx | update_2to1 | 12451 |
| mobx | update_4to1 | 6751 |
| mobx | update_1000to1 | 64 |
| mobx | update_1to2 | 13007 |
| mobx | update_1to4 | 6269 |
| mobx | update_1to1000 | 175 |
| mobx | cellx1000 (first: pass, last: pass) | 80592 |
| mobx | cellx2500 (first: pass, last: pass) | 291263 |
| mobx | cellx5000 (first: pass, last: pass) | 626884 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 2049885 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1600305 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1984487 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3621965 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1182268 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1800032 |
