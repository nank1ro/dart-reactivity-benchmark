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
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 27.61 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 20.74 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 19.42 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.18 |
| 5 | [solidart](https://pub.dev/packages/solidart) | 3.69 |
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
| kairo avoidablePropagation | 204.95ms | 213.38ms | 199.22ms | 2.1975s | 166.79ms (fail) |
| kairo broadPropagation | 410.11ms | 475.55ms | 420.29ms | 5.4295s | 7.80ms (fail) |
| kairo deepPropagation | 161.29ms | 172.62ms | 149.80ms | 2.0014s | 142.92ms (fail) |
| kairo diamond | 245.67ms | 283.21ms | 269.24ms | 3.4033s | 217.63ms (fail) |
| kairo mux | 395.49ms | 404.54ms | 382.37ms | 2.0305s | 195.61ms (fail) |
| kairo repeatedObservers | 22.55ms | 44.64ms | 40.33ms | 214.28ms | 53.57ms (fail) |
| kairo triangle | 97.92ms | 103.98ms | 95.23ms | 1.1279s | 79.40ms (fail) |
| kairo unstable | 43.63ms | 77.15ms | 68.39ms | 347.10ms | 338.30ms (fail) |
| molBench | 485.21ms | 486.76ms | 490.50ms | 1.7237s | 1.06ms |
| create_signals | 34.45ms | 29.91ms | 4.62ms | 66.75ms | 63.13ms |
| comp_0to1 | 9.28ms | 15.21ms | 16.43ms | 32.83ms | 54.43ms |
| comp_1to1 | 16.34ms | 19.28ms | 34.52ms | 50.75ms | 51.93ms |
| comp_2to1 | 9.45ms | 13.59ms | 5.91ms | 34.01ms | 33.18ms |
| comp_4to1 | 9.16ms | 2.00ms | 15.73ms | 31.24ms | 17.29ms |
| comp_1000to1 | 4μs | 9μs | 4μs | 2.46ms | 44μs |
| comp_1to2 | 12.41ms | 20.09ms | 7.84ms | 33.60ms | 48.84ms |
| comp_1to4 | 12.79ms | 8.36ms | 26.32ms | 29.24ms | 44.81ms |
| comp_1to8 | 5.52ms | 6.71ms | 12.49ms | 21.61ms | 44.65ms |
| comp_1to1000 | 3.59ms | 4.60ms | 6.04ms | 18.10ms | 40.33ms |
| update_1to1 | 3.91ms | 9.35ms | 8.86ms | 43.97ms | 7.68ms |
| update_2to1 | 3.97ms | 4.68ms | 4.34ms | 21.82ms | 2.89ms |
| update_4to1 | 1.03ms | 2.36ms | 2.20ms | 10.85ms | 2.22ms |
| update_1000to1 | 16μs | 23μs | 21μs | 117μs | 15μs |
| update_1to2 | 1.93ms | 4.73ms | 4.38ms | 22.33ms | 4.51ms |
| update_1to4 | 934μs | 2.36ms | 2.20ms | 10.83ms | 1.50ms |
| update_1to1000 | 36μs | 46μs | 55μs | 211μs | 416μs |
| cellx1000 | 9.02ms | 11.00ms | 9.39ms | 144.01ms | 5.12ms |
| cellx2500 | 28.63ms | 39.64ms | 27.09ms | 455.68ms | 18.51ms |
| cellx5000 | 82.22ms | 85.28ms | 80.84ms | 1.0158s | 54.12ms |
| 10x5 - 2 sources - read 20.0% (simple) | 265.11ms | 503.20ms | 417.99ms | 2.6414s (half) | 274.64ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 204.49ms | 279.58ms | 253.59ms | 2.4095s (half) | 212.81ms |
| 1000x12 - 4 sources - dynamic (large) | 289.06ms | 3.9409s | 2.7777s | 4.1694s (half) | 340.90ms |
| 1000x5 - 25 sources (wide dense) | 470.27ms | 3.4391s | 2.4455s | 5.0738s (half) | 517.17ms |
| 5x500 - 3 sources (deep) | 232.64ms | 228.24ms | 208.37ms | 2.0600s (half) | 235.44ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 271.48ms | 481.08ms | 434.90ms | 2.8109s (half) | 270.43ms |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed
