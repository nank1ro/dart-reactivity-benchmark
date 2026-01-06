| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2369915 |
| mobx | broadPropagation (success) | 4382691 |
| mobx | deepPropagation (success) | 1504553 |
| mobx | diamond (success) | 2442245 |
| mobx | mux (success) | 1820164 |
| mobx | repeatedObservers (success) | 245298 |
| mobx | triangle (success) | 744104 |
| mobx | unstable (success) | 344805 |
| mobx | molBench | 589447 |
| mobx | create_signals | 84361 |
| mobx | comp_0to1 | 25381 |
| mobx | comp_1to1 | 16945 |
| mobx | comp_2to1 | 20134 |
| mobx | comp_4to1 | 13981 |
| mobx | comp_1000to1 | 22 |
| mobx | comp_1to2 | 37577 |
| mobx | comp_1to4 | 26014 |
| mobx | comp_1to8 | 21100 |
| mobx | comp_1to1000 | 15464 |
| mobx | update_1to1 | 24491 |
| mobx | update_2to1 | 12843 |
| mobx | update_4to1 | 6655 |
| mobx | update_1000to1 | 68 |
| mobx | update_1to2 | 12980 |
| mobx | update_1to4 | 6379 |
| mobx | update_1to1000 | 161 |
| mobx | cellx1000 (first: pass, last: pass) | 72766 |
| mobx | cellx2500 (first: pass, last: pass) | 250255 |
| mobx | cellx5000 (first: pass, last: pass) | 549497 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 1932787 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1477945 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1855793 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3468830 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1098963 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1639154 |
