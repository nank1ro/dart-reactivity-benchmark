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
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 27.31 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.40 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 19.27 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.25 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.03 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 3.79 |
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
| kairo avoidablePropagation | 216.93ms | 210.72ms | 202.11ms | 2.2028s | 166.99ms (fail) | 2.3387s |
| kairo broadPropagation | 408.98ms | 462.12ms | 436.87ms | 5.4751s | 7.01ms (fail) | 4.3645s |
| kairo deepPropagation | 160.71ms | 175.43ms | 149.95ms | 1.9833s | 148.19ms (fail) | 1.5360s |
| kairo diamond | 237.17ms | 287.83ms | 269.81ms | 3.4202s | 190.64ms (fail) | 2.3941s |
| kairo mux | 388.66ms | 417.36ms | 384.40ms | 2.0350s | 196.08ms (fail) | 1.8365s |
| kairo repeatedObservers | 22.09ms | 44.73ms | 40.64ms | 214.43ms | 53.80ms (fail) | 233.63ms |
| kairo triangle | 96.38ms | 100.43ms | 96.13ms | 1.1466s | 76.98ms (fail) | 760.85ms |
| kairo unstable | 43.86ms | 77.10ms | 68.65ms | 352.67ms | 337.99ms (fail) | 344.49ms |
| molBench | 491.69ms | 486.46ms | 490.89ms | 1.7278s | 971μs | 590.88ms |
| create_signals | 22.21ms | 30.50ms | 4.58ms | 66.13ms | 72.45ms | 83.16ms |
| comp_0to1 | 4.59ms | 15.13ms | 16.57ms | 40.05ms | 55.53ms | 15.73ms |
| comp_1to1 | 19.16ms | 22.58ms | 19.48ms | 39.20ms | 53.41ms | 45.30ms |
| comp_2to1 | 18.84ms | 9.25ms | 2.31ms | 22.06ms | 35.03ms | 16.26ms |
| comp_4to1 | 12.38ms | 2.33ms | 10.90ms | 30.06ms | 18.08ms | 11.58ms |
| comp_1000to1 | 4μs | 6μs | 5μs | 2.23ms | 87μs | 14μs |
| comp_1to2 | 16.04ms | 21.79ms | 12.31ms | 32.63ms | 50.08ms | 20.92ms |
| comp_1to4 | 16.16ms | 10.31ms | 20.79ms | 32.30ms | 43.87ms | 22.50ms |
| comp_1to8 | 5.82ms | 7.00ms | 7.51ms | 24.14ms | 44.33ms | 21.47ms |
| comp_1to1000 | 3.40ms | 4.68ms | 5.44ms | 17.92ms | 40.45ms | 16.36ms |
| update_1to1 | 3.77ms | 9.37ms | 8.87ms | 44.35ms | 7.28ms | 23.41ms |
| update_2to1 | 5.34ms | 4.69ms | 4.36ms | 22.14ms | 2.89ms | 11.03ms |
| update_4to1 | 1.05ms | 2.37ms | 2.21ms | 10.90ms | 1.54ms | 5.40ms |
| update_1000to1 | 9μs | 23μs | 22μs | 119μs | 15μs | 68μs |
| update_1to2 | 2.30ms | 4.73ms | 4.67ms | 22.07ms | 3.65ms | 18.20ms |
| update_1to4 | 1.04ms | 2.35ms | 2.22ms | 10.85ms | 1.46ms | 5.93ms |
| update_1to1000 | 50μs | 46μs | 59μs | 212μs | 399μs | 290μs |
| cellx1000 | 9.47ms | 13.59ms | 10.01ms | 227.60ms | 6.85ms | 89.02ms |
| cellx2500 | 40.03ms | 59.34ms | 35.42ms | 584.72ms | 28.59ms | 251.83ms |
| cellx5000 | 104.90ms | 136.24ms | 124.70ms | 1.3114s | 89.00ms | 598.53ms |
| 10x5 - 2 sources - read 20.0% (simple) | 264.36ms | 502.32ms | 400.10ms | 2.6457s (half) | 246.48ms | 1.9494s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 206.29ms | 277.71ms | 268.02ms | 2.4730s (half) | 210.41ms | 1.5170s |
| 1000x12 - 4 sources - dynamic (large) | 284.97ms | 3.6867s | 2.8190s | 4.4492s (half) | 360.80ms | 1.8866s |
| 1000x5 - 25 sources (wide dense) | 456.44ms | 3.5056s | 2.4804s | 5.1404s (half) | 516.91ms | 3.6201s |
| 5x500 - 3 sources (deep) | 234.60ms | 232.16ms | 208.56ms | 2.3977s (half) | 234.29ms | 1.1411s |
| 100x15 - 6 sources - dynamic (very dynamic) | 267.64ms | 480.46ms | 442.14ms | 2.8713s (half) | 266.68ms | 1.7285s |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed
