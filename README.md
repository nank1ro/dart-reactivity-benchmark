# Dart Reactivity Benchmark

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Frameworks Tested
- alien_signals
- preact_signals
- signals
- solidart

### System Information:
  - Operating System: macOS 15.2 24C101
  - Model: Mac15,10
  - Memory: 36.00 GB
  - CPU: Apple M3 Max

==================== signals ====================
2024年12月19日 星期四 13时27分30秒 CST
| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| signals | avoidablePropagation | 94613 |
| signals | broadPropagation | 212758 |
| signals | deepPropagation | 95166 |
| signals | diamond | 150144 |
| signals | mux | 190597 |
| signals | repeatedObservers | 23500 |
| signals | triangle | 53956 |
| signals | unstable | 38089 |
| signals | molBench | 275863 |
| signals | create_signals | 12591 |
| signals | comp_0to1 | 4730 |
| signals | comp_1to1 | 6743 |
| signals | comp_2to1 | 4756 |
| signals | comp_4to1 | 1736 |
| signals | comp_1000to1 | 2 |
| signals | comp_1to2 | 6063 |
| signals | comp_1to4 | 3347 |
| signals | comp_1to8 | 3288 |
| signals | comp_1to1000 | 2051 |
| signals | update_1to1 | 4087 |
| signals | update_2to1 | 2065 |
| signals | update_4to1 | 1090 |
| signals | update_1000to1 | 10 |
| signals | update_1to2 | 2068 |
| signals | update_1to4 | 1054 |
| signals | update_1to1000 | 26 |
| signals | cellx 1000 | 4399 |
| signals | cellx 2500 | 14432 |
| signals | cellx 5000 | 37312 |
| signals | 10x5 - 2 sources - read 20.0% (simple) | 239805 |
| signals | 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 121019 |
| signals | 1000x12 - 4 sources - dynamic (large) | 2558794 |
| signals | 1000x5 - 25 sources (wide dense) | 2316648 |
| signals | 5x500 - 3 sources (deep) | 105790 |
| signals | 100x15 - 6 sources - dynamic (very dynamic) | 254095 |

- real	0m23.670s
- user	0m23.420s
- sys	0m0.220s

==================== alien_signals ====================
2024年12月19日 星期四 13时27分55秒 CST
| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| alien_signals | avoidablePropagation | 81888 |
| alien_signals | broadPropagation | 179085 |
| alien_signals | deepPropagation | 77676 |
| alien_signals | diamond | 107764 |
| alien_signals | mux | 173436 |
| alien_signals | repeatedObservers | 10805 |
| alien_signals | triangle | 43968 |
| alien_signals | unstable | 22460 |
| alien_signals | molBench | 273671 |
| alien_signals | create_signals | 9399 |
| alien_signals | comp_0to1 | 2170 |
| alien_signals | comp_1to1 | 7753 |
| alien_signals | comp_2to1 | 5631 |
| alien_signals | comp_4to1 | 740 |
| alien_signals | comp_1000to1 | 2 |
| alien_signals | comp_1to2 | 4279 |
| alien_signals | comp_1to4 | 6263 |
| alien_signals | comp_1to8 | 4113 |
| alien_signals | comp_1to1000 | 1754 |
| alien_signals | update_1to1 | 1722 |
| alien_signals | update_2to1 | 888 |
| alien_signals | update_4to1 | 512 |
| alien_signals | update_1000to1 | 5 |
| alien_signals | update_1to2 | 860 |
| alien_signals | update_1to4 | 438 |
| alien_signals | update_1to1000 | 21 |
| alien_signals | cellx 1000 | 3429 |
| alien_signals | cellx 2500 | 9583 |
| alien_signals | cellx 5000 | 23817 |
| alien_signals | 10x5 - 2 sources - read 20.0% (simple) | 136325 |
| alien_signals | 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 91691 |
| alien_signals | 1000x12 - 4 sources - dynamic (large) | 143979 |
| alien_signals | 1000x5 - 25 sources (wide dense) | 227918 |
| alien_signals | 5x500 - 3 sources (deep) | 109763 |
| alien_signals | 100x15 - 6 sources - dynamic (very dynamic) | 132248 |

- real	0m12.146s
- user	0m11.912s
- sys	0m0.130s

==================== state_beacon ====================
2024年12月19日 星期四 13时28分08秒 CST
| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| state_beacon | avoidablePropagation | 87672 |
| state_beacon | broadPropagation | 2773 |
| state_beacon | deepPropagation | 91305 |
| state_beacon | diamond | 87988 |
| state_beacon | mux | 93721 |
| state_beacon | repeatedObservers | 24700 |
| state_beacon | triangle | 42773 |
| state_beacon | unstable | 6021 |
| state_beacon | molBench | 418 |
| state_beacon | create_signals | 28447 |
| state_beacon | comp_0to1 | 23802 |
| state_beacon | comp_1to1 | 19517 |
| state_beacon | comp_2to1 | 12687 |
| state_beacon | comp_4to1 | 7191 |
| state_beacon | comp_1000to1 | 20 |
| state_beacon | comp_1to2 | 20850 |
| state_beacon | comp_1to4 | 19760 |
| state_beacon | comp_1to8 | 20251 |
| state_beacon | comp_1to1000 | 19019 |
| state_beacon | update_1to1 | 2812 |
| state_beacon | update_2to1 | 1543 |
| state_beacon | update_4to1 | 730 |
| state_beacon | update_1000to1 | 7 |
| state_beacon | update_1to2 | 1508 |
| state_beacon | update_1to4 | 725 |
| state_beacon | update_1to1000 | 184 |
| state_beacon | cellx 1000 | 2948 |
| state_beacon | cellx 2500 | 10202 |
| state_beacon | cellx 5000 | 47070 |
| state_beacon | 10x5 - 2 sources - read 20.0% (simple) | 145873 |
| state_beacon | 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 104096 |
| state_beacon | 1000x12 - 4 sources - dynamic (large) | 183876 |
| state_beacon | 1000x5 - 25 sources (wide dense) | 255969 |
| state_beacon | 5x500 - 3 sources (deep) | 119579 |
| state_beacon | 100x15 - 6 sources - dynamic (very dynamic) | 142400 |

- real	0m8.069s
- user	0m8.082s
- sys	0m0.184s


==================== preact_signals ====================
2024年12月19日 星期四 13时28分17秒 CST
| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| preact_signals | avoidablePropagation | 91000 |
| preact_signals | broadPropagation | 203154 |
| preact_signals | deepPropagation | 91317 |
| preact_signals | diamond | 139073 |
| preact_signals | mux | 185388 |
| preact_signals | repeatedObservers | 20722 |
| preact_signals | triangle | 51654 |
| preact_signals | unstable | 33561 |
| preact_signals | molBench | 273737 |
| preact_signals | create_signals | 2087 |
| preact_signals | comp_0to1 | 7326 |
| preact_signals | comp_1to1 | 13343 |
| preact_signals | comp_2to1 | 1241 |
| preact_signals | comp_4to1 | 6746 |
| preact_signals | comp_1000to1 | 2 |
| preact_signals | comp_1to2 | 2571 |
| preact_signals | comp_1to4 | 16143 |
| preact_signals | comp_1to8 | 2999 |
| preact_signals | comp_1to1000 | 2311 |
| preact_signals | update_1to1 | 3929 |
| preact_signals | update_2to1 | 2140 |
| preact_signals | update_4to1 | 1025 |
| preact_signals | update_1000to1 | 13 |
| preact_signals | update_1to2 | 1915 |
| preact_signals | update_1to4 | 1034 |
| preact_signals | update_1to1000 | 17 |
| preact_signals | cellx 1000 | 3983 |
| preact_signals | cellx 2500 | 11351 |
| preact_signals | cellx 5000 | 36800 |
| preact_signals | 10x5 - 2 sources - read 20.0% (simple) | 211821 |
| preact_signals | 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 115744 |
| preact_signals | 1000x12 - 4 sources - dynamic (large) | 1775234 |
| preact_signals | 1000x5 - 25 sources (wide dense) | 1409078 |
| preact_signals | 5x500 - 3 sources (deep) | 97847 |
| preact_signals | 100x15 - 6 sources - dynamic (very dynamic) | 209015 |

- real	0m19.345s
- user	0m19.127s
- sys	0m0.175s


==================== solidart ====================
2024年12月19日 星期四 13时28分37秒 CST
| Framework | Test Case | Time (μs) |
| --- | --- | --- |
| solidart | avoidablePropagation | 1081790 |
| solidart | broadPropagation | 2614995 |
| solidart | deepPropagation | 981491 |
| solidart | diamond | 1700628 |
| solidart | mux | 975836 |
| solidart | repeatedObservers | 106999 |
| solidart | triangle | 567174 |
| solidart | unstable | 173787 |
| solidart | molBench | 961440 |
| solidart | create_signals | 31686 |
| solidart | comp_0to1 | 9628 |
| solidart | comp_1to1 | 14660 |
| solidart | comp_2to1 | 11231 |
| solidart | comp_4to1 | 8154 |
| solidart | comp_1000to1 | 1564 |
| solidart | comp_1to2 | 15977 |
| solidart | comp_1to4 | 10196 |
| solidart | comp_1to8 | 11822 |
| solidart | comp_1to1000 | 9403 |
| solidart | update_1to1 | 19264 |
| solidart | update_2to1 | 9474 |
| solidart | update_4to1 | 4720 |
| solidart | update_1000to1 | 52 |
| solidart | update_1to2 | 9282 |
| solidart | update_1to4 | 4905 |
| solidart | update_1to1000 | 106 |
| solidart | cellx 1000 | 75253 |
| solidart | cellx 2500 | 219548 |
| solidart | cellx 5000 | 492367 |
| solidart | 10x5 - 2 sources - read 20.0% (simple) | 1332087 |
[31mcount solidart simple result:4200119 expected:3180010[0m
| solidart | 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1281526 |
[31mcount solidart dynamic result:1626522 expected:1140004[0m
| solidart | 1000x12 - 4 sources - dynamic (large) | 2110417 |
[31mcount solidart large result:9228429 expected:1473789[0m
| solidart | 1000x5 - 25 sources (wide dense) | 2586234 |
[31mcount solidart wide dense result:3734737 expected:735756[0m
| solidart | 5x500 - 3 sources (deep) | 1036752 |
[31mcount solidart deep result:1999683 expected:1246502[0m
| solidart | 100x15 - 6 sources - dynamic (very dynamic) | 1534925 |
[31mcount solidart very dynamic result:1885314 expected:1078734[0m

- real 1m54.585s
- user	1m53.881s
- sys	0m2.150s

## Usage

```dart
dart run bin/[framework_name].dart
```
