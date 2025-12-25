| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2345821 |
| mobx | broadPropagation (success) | 4352458 |
| mobx | deepPropagation (success) | 1481505 |
| mobx | diamond (success) | 2370421 |
| mobx | mux (success) | 1860084 |
| mobx | repeatedObservers (success) | 225012 |
| mobx | triangle (success) | 729297 |
| mobx | unstable (success) | 341900 |
| mobx | molBench | 588896 |
| mobx | create_signals | 59599 |
| mobx | comp_0to1 | 19216 |
| mobx | comp_1to1 | 30816 |
| mobx | comp_2to1 | 21038 |
| mobx | comp_4to1 | 29915 |
| mobx | comp_1000to1 | 22 |
| mobx | comp_1to2 | 32110 |
| mobx | comp_1to4 | 24600 |
| mobx | comp_1to8 | 25177 |
| mobx | comp_1to1000 | 15725 |
| mobx | update_1to1 | 24808 |
| mobx | update_2to1 | 11429 |
| mobx | update_4to1 | 7119 |
| mobx | update_1000to1 | 69 |
| mobx | update_1to2 | 13701 |
| mobx | update_1to4 | 5141 |
| mobx | update_1to1000 | 161 |
| mobx | cellx1000 (first: pass, last: pass) | 89056 |
| mobx | cellx2500 (first: pass, last: pass) | 309199 |
| mobx | cellx5000 (first: pass, last: pass) | 617311 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 1889916 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1432286 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1866102 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3426764 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1093895 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1651137 |
