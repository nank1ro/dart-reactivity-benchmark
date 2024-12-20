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
| Rank | Framework | Score |
|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 27.09 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.96 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 20.38 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.24 |
| 5 | [solidart](https://pub.dev/packages/solidart) | 4.08 |
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
| Test Case | alien_signals | signals | preact_signals | solidart | state_beacon |
|---|---|---|---|---|---|
| kairo avoidablePropagation | 212.25ms | 211.66ms | 191.68ms | 2.1947s | 153.99ms (fail) |
| kairo broadPropagation | 415.49ms | 469.99ms | 417.88ms | 5.5204s | 6.13ms (fail) |
| kairo deepPropagation | 161.39ms | 180.41ms | 145.69ms | 2.0018s | 139.75ms (fail) |
| kairo diamond | 248.60ms | 288.71ms | 266.92ms | 3.3831s | 194.13ms (fail) |
| kairo mux | 390.52ms | 410.74ms | 387.52ms | 2.0155s | 192.66ms (fail) |
| kairo repeatedObservers | 22.67ms | 45.19ms | 40.36ms | 209.32ms | 54.02ms (fail) |
| kairo triangle | 96.52ms | 102.91ms | 97.52ms | 1.1435s | 88.11ms (fail) |
| kairo unstable | 44.78ms | 78.34ms | 68.38ms | 347.63ms | 340.73ms (fail) |
| molBench | 489.37ms | 487.33ms | 491.03ms | 1.7210s | 2.05ms |
| create_signals | 21.28ms | 31.65ms | 4.57ms | 64.80ms | 63.11ms |
| comp_0to1 | 5.47ms | 15.01ms | 16.52ms | 36.41ms | 55.48ms |
| comp_1to1 | 17.91ms | 18.77ms | 26.47ms | 36.96ms | 52.75ms |
| comp_2to1 | 18.91ms | 13.44ms | 8.33ms | 18.23ms | 34.08ms |
| comp_4to1 | 1.56ms | 2.39ms | 19.54ms | 20.02ms | 17.85ms |
| comp_1000to1 | 7μs | 5μs | 6μs | 2.05ms | 45μs |
| comp_1to2 | 9.97ms | 13.10ms | 4.52ms | 42.21ms | 46.97ms |
| comp_1to4 | 17.28ms | 11.58ms | 24.93ms | 29.55ms | 43.83ms |
| comp_1to8 | 8.98ms | 6.82ms | 5.94ms | 21.73ms | 44.88ms |
| comp_1to1000 | 7.27ms | 4.62ms | 3.72ms | 17.81ms | 47.18ms |
| update_1to1 | 3.85ms | 9.39ms | 8.79ms | 43.92ms | 7.79ms |
| update_2to1 | 5.35ms | 4.67ms | 4.46ms | 21.85ms | 2.89ms |
| update_4to1 | 1.44ms | 2.34ms | 2.22ms | 10.85ms | 2.64ms |
| update_1000to1 | 16μs | 23μs | 21μs | 119μs | 15μs |
| update_1to2 | 2.00ms | 4.72ms | 4.36ms | 22.00ms | 4.52ms |
| update_1to4 | 1.00ms | 2.35ms | 2.30ms | 10.90ms | 1.56ms |
| update_1to1000 | 52μs | 44μs | 59μs | 236μs | 400μs |
| cellx1000 | 8.23ms | 9.65ms | 9.19ms | 147.68ms | 5.27ms |
| cellx2500 | 22.30ms | 31.49ms | 25.08ms | 476.86ms | 19.26ms |
| cellx5000 | 51.11ms | 64.30ms | 74.60ms | 1.0648s | 60.85ms |
| 10x5 - 2 sources - read 20.0% (simple) | 268.24ms | 503.88ms | 401.14ms | 2.6282s (half) | 248.21ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 209.26ms | 275.80ms | 254.62ms | 2.3961s (half) | 206.57ms |
| 1000x12 - 4 sources - dynamic (large) | 288.56ms | 3.6395s | 2.8004s | 4.1734s (half) | 345.94ms |
| 1000x5 - 25 sources (wide dense) | 460.54ms | 3.3495s | 2.4391s | 5.0552s (half) | 498.59ms |
| 5x500 - 3 sources (deep) | 228.25ms | 229.21ms | 206.72ms | 1.9473s (half) | 234.76ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 272.41ms | 470.84ms | 440.04ms | 2.7913s (half) | 267.71ms |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed
