| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2395849 |
| mobx | broadPropagation (success) | 4354851 |
| mobx | deepPropagation (success) | 1507339 |
| mobx | diamond (success) | 2366933 |
| mobx | mux (success) | 1824547 |
| mobx | repeatedObservers (success) | 226202 |
| mobx | triangle (success) | 737202 |
| mobx | unstable (success) | 344359 |
| mobx | molBench | 589664 |
| mobx | create_signals | 70640 |
| mobx | comp_0to1 | 26486 |
| mobx | comp_1to1 | 41902 |
| mobx | comp_2to1 | 23584 |
| mobx | comp_4to1 | 21401 |
| mobx | comp_1000to1 | 15 |
| mobx | comp_1to2 | 35754 |
| mobx | comp_1to4 | 24653 |
| mobx | comp_1to8 | 23115 |
| mobx | comp_1to1000 | 15375 |
| mobx | update_1to1 | 26586 |
| mobx | update_2to1 | 12952 |
| mobx | update_4to1 | 7104 |
| mobx | update_1000to1 | 70 |
| mobx | update_1to2 | 13654 |
| mobx | update_1to4 | 6831 |
| mobx | update_1to1000 | 173 |
| mobx | cellx1000 (first: pass, last: pass) | 70109 |
| mobx | cellx2500 (first: pass, last: pass) | 245115 |
| mobx | cellx5000 (first: pass, last: pass) | 555335 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 1951781 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1475806 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1832332 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3435896 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1097777 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1643827 |
