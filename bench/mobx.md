| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2328518 |
| mobx | broadPropagation (success) | 4343754 |
| mobx | deepPropagation (success) | 1546873 |
| mobx | diamond (success) | 2456728 |
| mobx | mux (success) | 1815260 |
| mobx | repeatedObservers (success) | 238725 |
| mobx | triangle (success) | 789008 |
| mobx | unstable (success) | 356649 |
| mobx | molBench | 587478 |
| mobx | create_signals | 72934 |
| mobx | comp_0to1 | 19180 |
| mobx | comp_1to1 | 45545 |
| mobx | comp_2to1 | 29360 |
| mobx | comp_4to1 | 12878 |
| mobx | comp_1000to1 | 15 |
| mobx | comp_1to2 | 32764 |
| mobx | comp_1to4 | 17501 |
| mobx | comp_1to8 | 23008 |
| mobx | comp_1to1000 | 15645 |
| mobx | update_1to1 | 27687 |
| mobx | update_2to1 | 14218 |
| mobx | update_4to1 | 7656 |
| mobx | update_1000to1 | 66 |
| mobx | update_1to2 | 13988 |
| mobx | update_1to4 | 6814 |
| mobx | update_1to1000 | 164 |
| mobx | cellx1000 (first: pass, last: pass) | 72542 |
| mobx | cellx2500 (first: pass, last: pass) | 263184 |
| mobx | cellx5000 (first: pass, last: pass) | 552081 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 2029892 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1514347 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1773036 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3490958 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1134361 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1730464 |
