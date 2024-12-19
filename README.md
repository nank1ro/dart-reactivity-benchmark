# Dart Reactivity Benchmark

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Usage

Dart VM
```bash
dart run bin/[framework_name].dart
```

Run all benchamrks
```bash
bash bench.sh
```

## Test System Information:
  - Operating System: macOS 15.2 24C101
  - Model: Mac15,10
  - Memory: 36.00 GB
  - CPU: Apple M3 Max

## Score Ranking

| Rank | Framework | Score |
|---|---|---|
| 1 | state_beacon | 28.56 |
| 2 | alien_signals | 26.03 |
| 3 | preact_signals | 18.78 |
| 4 | signals | 17.25 |
| 5 | solidart | 6.38 |

> Ranking algorithm
>
> 1. In the same test case, the fastest framework gets 1 point, and other frameworks get relative scores by dividing this score by their own scores
> 2. `Relative score = benchmark time / execution time of the framework`
> 3. In order to get the overall performance of each framework, I add up the relative scores of the framework in all test cases to get a "comprehensive score". The higher the comprehensive score, the better the overall performance of the framework.
## Performance benchmark results of each framework (unit: microsecond μs)

| Test Case | alien_signals (μs) | preact_signals (μs) | signals (μs) | solidart (μs) | state_beacon (μs) |
|---|---|---|---|---|---|
| avoidablePropagation | 87183 | 90636 | 98570 | 1045651 | 89352 |
| broadPropagation | 180404 | 198829 | 207982 | 2527207 | 3014 |
| deepPropagation | 68828 | 89167 | 93334 | 936287 | 90915 |
| diamond | 106510 | 136470 | 146623 | 1646753 | 87436 |
| mux | 182640 | 185322 | 189356 | 968107 | 92272 |
| repeatedObservers | 10703 | 19957 | 23483 | 106056 | 24701 |
| triangle | 45782 | 52760 | 53529 | 552774 | 41389 |
| unstable | 21396 | 32230 | 39736 | 164429 | 6060 |
| molBench | 273806 | 273867 | 276555 | 956213 | 409 |
| create_signals | 9312 | 2036 | 16976 | 28952 | 27562 |
| comp_0to1 | 2183 | 7351 | 6562 | 9330 | 23123 |
| comp_1to1 | 7853 | 7541 | 10546 | 16013 | 19276 |
| comp_2to1 | 9439 | 1152 | 3707 | 18074 | 12546 |
| comp_4to1 | 6854 | 6580 | 1069 | 8066 | 7140 |
| comp_1000to1 | 2 | 2 | 2 | 1983 | 18 |
| comp_1to2 | 5481 | 3861 | 9006 | 16981 | 20799 |
| comp_1to4 | 5918 | 10506 | 4777 | 10043 | 19945 |
| comp_1to8 | 2214 | 3973 | 3820 | 11254 | 20304 |
| comp_1to1000 | 1623 | 1600 | 1969 | 8932 | 18627 |
| update_1to1 | 1687 | 3820 | 4063 | 18745 | 2959 |
| update_2to1 | 858 | 1879 | 2088 | 9474 | 1406 |
| update_4to1 | 480 | 958 | 1074 | 4729 | 710 |
| update_1000to1 | 6 | 11 | 10 | 54 | 8 |
| update_1to2 | 939 | 1911 | 2238 | 9654 | 1462 |
| update_1to4 | 469 | 1071 | 1086 | 4698 | 796 |
| update_1to1000 | 19 | 19 | 28 | 116 | 189 |
| cellx1000 | 3861 | 3937 | 4293 | 71858 | 2732 |
| cellx2500 | 11204 | 10840 | 14391 | 212547 | 10051 |
| cellx5000 | 26803 | 32268 | 39837 | 547031 | 38313 |
| 10x5 - 2 sources | 141057 | 208999 | 241904 | 1290003 | 140556 |
| 10x10 - 6 sources | 96622 | 114237 | 122867 | 1255346 | 99489 |
| 1000x12 - 4 sources | 146678 | 1777127 | 2532554 | 2016302 | 181762 |
| 1000x5 - 25 sources | 230729 | 1311223 | 2246103 | 2572250 | 241096 |
| 5x500 - 3 sources | 119628 | 98145 | 106259 | 970439 | 117765 |
| 100x15 - 6 sources | 141975 | 201107 | 260535 | 1397397 | 138507 |
