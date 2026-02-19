| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2345711 |
| mobx | broadPropagation (success) | 4357204 |
| mobx | deepPropagation (success) | 1542893 |
| mobx | diamond (success) | 2465093 |
| mobx | mux (success) | 1792668 |
| mobx | repeatedObservers (success) | 231002 |
| mobx | triangle (success) | 772692 |
| mobx | unstable (success) | 343836 |
| mobx | molBench | 584908 |
| mobx | create_signals | 78172 |
| mobx | comp_0to1 | 24542 |
| mobx | comp_1to1 | 31173 |
| mobx | comp_2to1 | 31563 |
| mobx | comp_4to1 | 20349 |
| mobx | comp_1000to1 | 38 |
| mobx | comp_1to2 | 43621 |
| mobx | comp_1to4 | 23270 |
| mobx | comp_1to8 | 26472 |
| mobx | comp_1to1000 | 15300 |
| mobx | update_1to1 | 21151 |
| mobx | update_2to1 | 10735 |
| mobx | update_4to1 | 6021 |
| mobx | update_1000to1 | 52 |
| mobx | update_1to2 | 12344 |
| mobx | update_1to4 | 5219 |
| mobx | update_1to1000 | 155 |
| mobx | cellx1000 (first: pass, last: pass) | 95392 |
| mobx | cellx2500 (first: pass, last: pass) | 316849 |
| mobx | cellx5000 (first: pass, last: pass) | 621597 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 2010960 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1473524 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1901522 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3428377 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1232124 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1681542 |
