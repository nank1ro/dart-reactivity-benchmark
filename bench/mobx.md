| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2323845 |
| mobx | broadPropagation (success) | 4475836 |
| mobx | deepPropagation (success) | 1561345 |
| mobx | diamond (success) | 2438089 |
| mobx | mux (success) | 1854543 |
| mobx | repeatedObservers (success) | 233464 |
| mobx | triangle (success) | 770483 |
| mobx | unstable (success) | 352660 |
| mobx | molBench | 578818 |
| mobx | create_signals | 89725 |
| mobx | comp_0to1 | 16690 |
| mobx | comp_1to1 | 49843 |
| mobx | comp_2to1 | 22641 |
| mobx | comp_4to1 | 23494 |
| mobx | comp_1000to1 | 17 |
| mobx | comp_1to2 | 36081 |
| mobx | comp_1to4 | 19527 |
| mobx | comp_1to8 | 23248 |
| mobx | comp_1to1000 | 15989 |
| mobx | update_1to1 | 27029 |
| mobx | update_2to1 | 12027 |
| mobx | update_4to1 | 6819 |
| mobx | update_1000to1 | 70 |
| mobx | update_1to2 | 11388 |
| mobx | update_1to4 | 6976 |
| mobx | update_1to1000 | 173 |
| mobx | cellx1000 (first: pass, last: pass) | 70923 |
| mobx | cellx2500 (first: pass, last: pass) | 234660 |
| mobx | cellx5000 (first: pass, last: pass) | 540926 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 2033168 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1558448 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1808926 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3517050 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1164934 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1744889 |
