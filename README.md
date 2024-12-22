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
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 28.71 | 3.91s | 0.0 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 25.22 | 8.92s | 0.0 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 22.53 | 10.95s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.96 | 3.58s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.20 | 27.39s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.10 | 40.19s | 3.0 |
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
| Test Case | alien_signals | signals | preact_signals | solidart | state_beacon | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 195.91ms | 210.00ms | 191.48ms | 2.20s | 176.04ms (fail) | 2.35s |
| broadPropagation | 392.34ms | 457.48ms | 424.99ms | 5.68s | 6.92ms (fail) | 4.39s |
| deepPropagation | 152.73ms | 177.45ms | 150.41ms | 2.03s | 140.79ms (fail) | 1.54s |
| diamond | 232.51ms | 285.51ms | 262.14ms | 3.46s | 196.33ms (fail) | 2.40s |
| mux | 392.50ms | 408.40ms | 380.43ms | 2.04s | 192.51ms (fail) | 1.83s |
| repeatedObservers | 21.95ms | 44.90ms | 42.16ms | 212.49ms | 55.59ms (fail) | 234.44ms |
| triangle | 89.72ms | 100.20ms | 97.55ms | 1.15s | 79.97ms (fail) | 751.83ms |
| unstable | 40.65ms | 77.35ms | 67.64ms | 348.50ms | 338.53ms (fail) | 356.00ms |
| molBench | 480.24ms | 487.42ms | 491.64ms | 1.71s | 1.01ms | 585.81ms |
| create_signals | 21.94ms | 28.93ms | 4.52ms | 70.12ms | 74.03ms | 71.35ms |
| comp_0to1 | 4.53ms | 14.86ms | 16.27ms | 37.03ms | 59.17ms | 18.74ms |
| comp_1to1 | 17.23ms | 17.52ms | 25.66ms | 40.69ms | 54.78ms | 40.74ms |
| comp_2to1 | 13.42ms | 18.18ms | 5.45ms | 17.11ms | 35.04ms | 33.80ms |
| comp_4to1 | 13.57ms | 1.83ms | 22.02ms | 28.11ms | 17.95ms | 12.32ms |
| comp_1000to1 | 4μs | 5μs | 5μs | 2.01ms | 44μs | 15μs |
| comp_1to2 | 6.80ms | 18.30ms | 4.41ms | 37.89ms | 46.29ms | 43.10ms |
| comp_1to4 | 10.71ms | 13.32ms | 24.24ms | 32.16ms | 43.87ms | 23.39ms |
| comp_1to8 | 7.28ms | 7.66ms | 5.74ms | 23.63ms | 43.74ms | 21.65ms |
| comp_1to1000 | 7.92ms | 4.68ms | 3.59ms | 18.47ms | 40.33ms | 15.77ms |
| update_1to1 | 6.62ms | 9.44ms | 8.73ms | 44.20ms | 8.92ms | 24.82ms |
| update_2to1 | 3.77ms | 4.66ms | 4.36ms | 21.94ms | 2.89ms | 11.71ms |
| update_4to1 | 2.37ms | 2.33ms | 2.18ms | 11.08ms | 1.84ms | 5.99ms |
| update_1000to1 | 9μs | 23μs | 21μs | 118μs | 15μs | 67μs |
| update_1to2 | 6.58ms | 4.73ms | 4.39ms | 22.06ms | 3.64ms | 11.65ms |
| update_1to4 | 2.57ms | 2.34ms | 2.17ms | 11.19ms | 1.47ms | 6.79ms |
| update_1to1000 | 49μs | 46μs | 48μs | 214μs | 395μs | 158μs |
| cellx1000 | 8.54ms | 9.79ms | 9.20ms | 167.88ms | 6.04ms | 82.87ms |
| cellx2500 | 26.25ms | 31.28ms | 24.51ms | 508.61ms | 27.87ms | 238.87ms |
| cellx5000 | 64.31ms | 62.95ms | 64.52ms | 1.17s | 75.31ms | 587.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 258.97ms | 507.22ms | 403.10ms | 2.65s (half) | 271.09ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 196.24ms | 277.43ms | 254.31ms | 2.39s (half) | 211.88ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 285.71ms | 3.70s | 2.84s | 4.10s (half) | 346.77ms | 1.80s |
| 1000x5 - 25 sources (wide dense) | 468.15ms | 3.25s | 2.45s | 5.11s (half) | 522.09ms | 3.59s |
| 5x500 - 3 sources (deep) | 224.17ms | 232.55ms | 203.90ms | 2.03s (half) | 235.86ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 256.13ms | 477.96ms | 428.74ms | 2.81s (half) | 265.93ms | 1.70s |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed
