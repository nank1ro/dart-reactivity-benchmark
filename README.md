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
| Rank | Framework | Score | Total Time |
|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 29.49 | 3.88s |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 23.62 | 8.91s |
| 🥉 | [signals](https://pub.dev/packages/signals) | 22.46 | 11.32s |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.11 | 3.55s |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.36 | 26.96s |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.17 | 39.73s |
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
| kairo avoidablePropagation | 200.17ms | 2.33s | 201.70ms | 2.20s | 207.61ms | 178.07ms (fail) |
| kairo broadPropagation | 419.02ms | 4.27s | 390.04ms | 5.36s | 470.32ms | 7.21ms (fail) |
| kairo deepPropagation | 145.62ms | 1.52s | 151.75ms | 1.99s | 171.87ms | 141.39ms (fail) |
| kairo diamond | 266.20ms | 2.41s | 234.45ms | 3.43s | 289.45ms | 196.37ms (fail) |
| kairo mux | 383.30ms | 1.78s | 388.38ms | 2.03s | 405.58ms | 191.00ms (fail) |
| kairo repeatedObservers | 40.06ms | 234.88ms | 21.94ms | 211.29ms | 44.97ms | 54.12ms (fail) |
| kairo triangle | 96.96ms | 771.05ms | 92.45ms | 1.12s | 101.97ms | 82.44ms (fail) |
| kairo unstable | 68.29ms | 348.31ms | 42.66ms | 354.03ms | 77.72ms | 342.06ms (fail) |
| molBench | 490.12ms | 589.55ms | 482.76ms | 1.70s | 486.09ms | 1.13ms |
| create_signals | 4.52ms | 69.56ms | 25.41ms | 70.89ms | 30.94ms | 72.78ms |
| comp_0to1 | 16.39ms | 17.99ms | 4.50ms | 40.64ms | 11.40ms | 53.19ms |
| comp_1to1 | 26.00ms | 30.94ms | 18.36ms | 46.52ms | 15.86ms | 52.62ms |
| comp_2to1 | 5.07ms | 30.01ms | 8.95ms | 27.14ms | 8.83ms | 33.59ms |
| comp_4to1 | 14.39ms | 11.61ms | 19.85ms | 20.32ms | 2.02ms | 17.50ms |
| comp_1000to1 | 4μs | 19μs | 4μs | 2.10ms | 5μs | 51μs |
| comp_1to2 | 13.23ms | 29.67ms | 6.66ms | 30.04ms | 24.55ms | 45.76ms |
| comp_1to4 | 31.36ms | 24.23ms | 8.83ms | 18.36ms | 15.87ms | 44.24ms |
| comp_1to8 | 10.66ms | 18.32ms | 5.59ms | 24.01ms | 6.56ms | 43.63ms |
| comp_1to1000 | 3.20ms | 14.44ms | 3.44ms | 17.94ms | 4.62ms | 40.78ms |
| update_1to1 | 9.51ms | 25.31ms | 10.62ms | 43.55ms | 9.37ms | 12.66ms |
| update_2to1 | 4.48ms | 11.90ms | 1.99ms | 21.81ms | 4.67ms | 2.90ms |
| update_4to1 | 2.22ms | 6.55ms | 2.48ms | 10.81ms | 2.35ms | 1.60ms |
| update_1000to1 | 21μs | 64μs | 18μs | 117μs | 23μs | 15μs |
| update_1to2 | 4.38ms | 11.69ms | 4.39ms | 21.74ms | 4.73ms | 3.15ms |
| update_1to4 | 2.22ms | 6.57ms | 2.60ms | 10.81ms | 2.35ms | 1.49ms |
| update_1to1000 | 56μs | 159μs | 59μs | 226μs | 45μs | 415μs |
| cellx1000 | 9.28ms | 68.01ms | 8.00ms | 155.89ms | 9.69ms | 5.38ms |
| cellx2500 | 26.73ms | 222.71ms | 21.90ms | 485.80ms | 31.21ms | 19.95ms |
| cellx5000 | 69.48ms | 535.08ms | 46.79ms | 1.11s | 63.81ms | 58.10ms |
| 10x5 - 2 sources - read 20.0% (simple) | 406.42ms | 1.99s | 260.97ms | 2.64s (half) | 511.96ms | 262.19ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 255.88ms | 1.51s | 198.26ms | 2.41s (half) | 285.03ms | 217.33ms |
| 1000x12 - 4 sources - dynamic (large) | 2.79s | 1.76s | 275.43ms | 4.32s (half) | 3.80s | 340.40ms |
| 1000x5 - 25 sources (wide dense) | 2.45s | 3.53s | 460.14ms | 5.07s (half) | 3.52s | 521.65ms |
| 5x500 - 3 sources (deep) | 203.24ms | 1.11s | 222.78ms | 1.97s (half) | 227.61ms | 235.26ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 439.11ms | 1.67s | 256.72ms | 2.76s (half) | 473.96ms | 266.88ms |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed
