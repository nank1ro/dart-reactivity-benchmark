| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2232848 |
| mobx | broadPropagation (success) | 4103235 |
| mobx | deepPropagation (success) | 1433938 |
| mobx | diamond (success) | 2251932 |
| mobx | mux (success) | 1868358 |
| mobx | repeatedObservers (success) | 226851 |
| mobx | triangle (success) | 759598 |
| mobx | unstable (success) | 338170 |
| mobx | molBench | 482792 |
| mobx | create_signals | 50101 |
| mobx | comp_0to1 | 20256 |
| mobx | comp_1to1 | 34989 |
| mobx | comp_2to1 | 24453 |
| mobx | comp_4to1 | 24341 |
| mobx | comp_1000to1 | 17 |
| mobx | comp_1to2 | 32194 |
| mobx | comp_1to4 | 31098 |
| mobx | comp_1to8 | 26794 |
| mobx | comp_1to1000 | 16980 |
| mobx | update_1to1 | 20548 |
| mobx | update_2to1 | 9946 |
| mobx | update_4to1 | 5559 |
| mobx | update_1000to1 | 50 |
| mobx | update_1to2 | 10381 |
| mobx | update_1to4 | 4871 |
| mobx | update_1to1000 | 169 |
| mobx | cellx1000 (first: pass, last: pass) | 109350 |
| mobx | cellx2500 (first: pass, last: pass) | 304931 |
| mobx | cellx5000 (first: pass, last: pass) | 644752 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 2030250 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1504118 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1756732 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3409421 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1192510 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1689793 |
