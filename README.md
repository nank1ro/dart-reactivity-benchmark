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

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 31.29 | 1.90s | 0.0 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.05 | 5.04s | 0.0 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 20.91 | 6.78s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.32 | 1.79s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.02 | 13.61s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.26 | 19.66s | 3.0 |
<!-- Rank Table End -->

> [!TIP]
> ## Ranking algorithm
>
> 1. The score of the test with the shortest test time is 1.0, and the score of the other frameworks is the time of the same test divided by the shortest time. For example, if the shortest time is 100ms and the time of other frameworks is 200ms, the scores of the others are 0.5
> 2. If the test case status is fail, the score is 0
> 3. If the test case status contains sun and count, and both count and sum are pass, the score is calculated as 1 algorithm. If only one of them is fail, the score is divided by 2, and if all fail, the score is 0
> 4. The total score of each framework is the sum of the total scores of all test cases.

## Benchmark results of each framework

<!-- Benchmark Table -->
| Test Case | preact_signals | mobx | alien_signals | solidart | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 100.69ms | 1.15s | 82.56ms | 1.08s | 94.06ms | 88.32ms (fail) |
| broadPropagation | 210.82ms | 2.12s | 169.81ms | 2.55s | 209.22ms | 2.88ms (fail) |
| deepPropagation | 94.72ms | 769.94ms | 68.38ms | 976.44ms | 92.47ms | 90.16ms (fail) |
| diamond | 150.29ms | 1.15s | 98.64ms | 1.66s | 145.39ms | 85.13ms (fail) |
| mux | 186.06ms | 888.39ms | 177.49ms | 960.85ms | 190.57ms | 95.40ms (fail) |
| repeatedObservers | 21.14ms | 112.72ms | 10.40ms | 102.51ms | 23.46ms | 24.13ms (fail) |
| triangle | 56.02ms | 385.69ms | 43.12ms | 548.71ms | 53.19ms | 41.01ms (fail) |
| unstable | 33.60ms | 160.43ms | 21.31ms | 161.48ms | 40.98ms | 180.74ms (fail) |
| molBench | 275.97ms | 323.41ms | 272.07ms | 953.76ms | 275.89ms | 428μs |
| create_signals | 2.10ms | 22.98ms | 8.96ms | 16.81ms | 12.93ms | 29.81ms |
| comp_0to1 | 7.58ms | 19.17ms | 2.21ms | 23.53ms | 4.92ms | 24.18ms |
| comp_1to1 | 3.73ms | 19.20ms | 7.44ms | 22.16ms | 7.09ms | 23.41ms |
| comp_2to1 | 5.63ms | 9.50ms | 6.55ms | 13.50ms | 3.24ms | 14.35ms |
| comp_4to1 | 6.59ms | 9.00ms | 10.20ms | 6.76ms | 3.76ms | 7.92ms |
| comp_1000to1 | 2μs | 10μs | 1μs | 2.70ms | 3μs | 19μs |
| comp_1to2 | 7.30ms | 17.98ms | 4.43ms | 14.65ms | 5.09ms | 20.67ms |
| comp_1to4 | 18.32ms | 8.29ms | 4.84ms | 11.70ms | 7.59ms | 19.33ms |
| comp_1to8 | 3.33ms | 9.88ms | 2.29ms | 10.53ms | 4.33ms | 19.43ms |
| comp_1to1000 | 2.46ms | 7.56ms | 1.61ms | 9.38ms | 1.98ms | 18.21ms |
| update_1to1 | 3.96ms | 9.47ms | 1.69ms | 18.43ms | 4.13ms | 2.80ms |
| update_2to1 | 1.95ms | 4.68ms | 856μs | 8.99ms | 2.04ms | 1.29ms |
| update_4to1 | 1.01ms | 2.43ms | 474μs | 4.45ms | 1.08ms | 700μs |
| update_1000to1 | 10μs | 22μs | 6μs | 52μs | 12μs | 6μs |
| update_1to2 | 2.04ms | 4.60ms | 868μs | 9.46ms | 2.17ms | 1.31ms |
| update_1to4 | 978μs | 2.38ms | 442μs | 4.42ms | 1.05ms | 665μs |
| update_1to1000 | 25μs | 81μs | 21μs | 112μs | 25μs | 174μs |
| cellx1000 | 4.62ms | 36.61ms | 3.94ms | 75.38ms | 4.19ms | 3.09ms |
| cellx2500 | 13.52ms | 118.75ms | 9.90ms | 218.96ms | 11.62ms | 10.54ms |
| cellx5000 | 37.58ms | 258.82ms | 25.31ms | 484.05ms | 33.81ms | 30.55ms |
| 10x5 - 2 sources - read 20.0% (simple) | 222.67ms | 1.02s | 134.39ms | 1.32s (half) | 244.38ms | 139.71ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 114.98ms | 831.18ms | 91.30ms | 1.24s (half) | 120.02ms | 100.96ms |
| 1000x12 - 4 sources - dynamic (large) | 1.79s | 855.72ms | 141.99ms | 2.08s (half) | 2.53s | 191.51ms |
| 1000x5 - 25 sources (wide dense) | 1.33s | 1.85s | 233.06ms | 2.67s (half) | 2.29s | 248.53ms |
| 5x500 - 3 sources (deep) | 108.83ms | 582.66ms | 119.97ms | 998.89ms (half) | 110.59ms | 124.99ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 214.71ms | 849.96ms | 142.26ms | 1.40s (half) | 253.74ms | 142.89ms |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed
