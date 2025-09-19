| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| mobx | avoidablePropagation (success) | 2356882 |
| mobx | broadPropagation (success) | 4402386 |
| mobx | deepPropagation (success) | 1551024 |
| mobx | diamond (success) | 2400403 |
| mobx | mux (success) | 1824087 |
| mobx | repeatedObservers (success) | 231945 |
| mobx | triangle (success) | 778172 |
| mobx | unstable (success) | 348186 |
| mobx | molBench | 585276 |
| mobx | create_signals | 88209 |
| mobx | comp_0to1 | 15916 |
| mobx | comp_1to1 | 41400 |
| mobx | comp_2to1 | 33874 |
| mobx | comp_4to1 | 15305 |
| mobx | comp_1000to1 | 15 |
| mobx | comp_1to2 | 40189 |
| mobx | comp_1to4 | 28308 |
| mobx | comp_1to8 | 20731 |
| mobx | comp_1to1000 | 15431 |
| mobx | update_1to1 | 23910 |
| mobx | update_2to1 | 12646 |
| mobx | update_4to1 | 5615 |
| mobx | update_1000to1 | 69 |
| mobx | update_1to2 | 13300 |
| mobx | update_1to4 | 6282 |
| mobx | update_1to1000 | 182 |
| mobx | cellx1000 (first: pass, last: pass) | 79179 |
| mobx | cellx2500 (first: pass, last: pass) | 236510 |
| mobx | cellx5000 (first: pass, last: pass) | 588641 |
| mobx | 10x5 - 2 sources - read 20.0% (simple, sum: pass, count: pass) | 2011666 |
| mobx | 10x10 - 6 sources - dynamic - read 20.0% (dynamic, sum: pass, count: pass) | 1515835 |
| mobx | 1000x12 - 4 sources - dynamic (large, sum: pass, count: pass) | 1743987 |
| mobx | 1000x5 - 25 sources (wide dense, sum: pass, count: pass) | 3502634 |
| mobx | 5x500 - 3 sources (deep, sum: pass, count: pass) | 1133081 |
| mobx | 100x15 - 6 sources - dynamic (very dynamic, sum: pass, count: pass) | 1674566 |
