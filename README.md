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
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 28.68 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.34 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 19.43 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.00 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.08 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.05 |
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
| kairo avoidablePropagation | 214.89ms | 209.34ms | 202.09ms | 2.2282s | 171.12ms (fail) | 2.3648s |
| kairo broadPropagation | 408.29ms | 462.03ms | 424.79ms | 5.4789s | 6.28ms (fail) | 4.3776s |
| kairo deepPropagation | 161.49ms | 179.49ms | 147.07ms | 2.0431s | 144.02ms (fail) | 1.5541s |
| kairo diamond | 247.75ms | 284.30ms | 270.21ms | 3.4694s | 196.05ms (fail) | 2.4317s |
| kairo mux | 390.77ms | 408.67ms | 382.31ms | 2.0437s | 193.17ms (fail) | 1.8296s |
| kairo repeatedObservers | 22.11ms | 45.80ms | 40.67ms | 215.88ms | 53.84ms (fail) | 235.63ms |
| kairo triangle | 96.04ms | 102.42ms | 95.37ms | 1.1436s | 83.67ms (fail) | 785.02ms |
| kairo unstable | 43.72ms | 77.53ms | 68.90ms | 347.88ms | 342.34ms (fail) | 351.95ms |
| molBench | 491.14ms | 485.23ms | 490.39ms | 1.7269s | 921μs | 585.80ms |
| create_signals | 22.64ms | 29.28ms | 4.60ms | 81.65ms | 73.13ms | 81.74ms |
| comp_0to1 | 4.57ms | 14.78ms | 17.37ms | 31.86ms | 54.48ms | 15.73ms |
| comp_1to1 | 17.76ms | 22.92ms | 27.24ms | 42.06ms | 53.71ms | 54.93ms |
| comp_2to1 | 15.13ms | 11.03ms | 4.79ms | 16.07ms | 34.13ms | 23.30ms |
| comp_4to1 | 1.68ms | 5.77ms | 16.28ms | 20.76ms | 17.50ms | 13.08ms |
| comp_1000to1 | 4μs | 5μs | 5μs | 2.25ms | 46μs | 15μs |
| comp_1to2 | 8.96ms | 21.49ms | 8.64ms | 30.38ms | 46.63ms | 20.76ms |
| comp_1to4 | 14.08ms | 14.88ms | 19.70ms | 29.80ms | 44.27ms | 22.76ms |
| comp_1to8 | 7.33ms | 6.84ms | 8.50ms | 24.50ms | 44.46ms | 21.10ms |
| comp_1to1000 | 6.57ms | 4.55ms | 6.32ms | 18.45ms | 40.65ms | 15.66ms |
| update_1to1 | 3.83ms | 9.34ms | 8.80ms | 43.87ms | 10.27ms | 24.95ms |
| update_2to1 | 5.36ms | 4.67ms | 4.36ms | 21.63ms | 2.92ms | 10.97ms |
| update_4to1 | 944μs | 2.33ms | 2.22ms | 10.88ms | 2.62ms | 6.26ms |
| update_1000to1 | 24μs | 23μs | 22μs | 119μs | 15μs | 68μs |
| update_1to2 | 1.89ms | 4.73ms | 4.37ms | 21.56ms | 3.66ms | 11.63ms |
| update_1to4 | 1.00ms | 2.35ms | 2.21ms | 10.99ms | 1.48ms | 5.48ms |
| update_1to1000 | 32μs | 46μs | 60μs | 211μs | 403μs | 152μs |
| cellx1000 | 8.56ms | 9.77ms | 9.33ms | 160.62ms | 5.72ms | 75.34ms |
| cellx2500 | 22.87ms | 31.32ms | 25.31ms | 483.47ms | 21.65ms | 246.91ms |
| cellx5000 | 58.07ms | 63.27ms | 75.23ms | 1.0985s | 60.45ms | 597.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 250.23ms | 512.02ms | 399.94ms | 2.6542s (half) | 252.87ms | 2.0386s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 197.22ms | 276.27ms | 254.78ms | 2.3911s (half) | 213.16ms | 1.5367s |
| 1000x12 - 4 sources - dynamic (large) | 274.90ms | 3.8240s | 2.8386s | 4.0290s (half) | 345.45ms | 1.7869s |
| 1000x5 - 25 sources (wide dense) | 452.68ms | 3.5056s | 2.4554s | 5.0469s (half) | 503.77ms | 3.5571s |
| 5x500 - 3 sources (deep) | 225.87ms | 233.13ms | 208.63ms | 1.9996s (half) | 236.87ms | 1.1116s |
| 100x15 - 6 sources - dynamic (very dynamic) | 261.41ms | 478.88ms | 434.44ms | 2.8280s (half) | 268.15ms | 1.7233s |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed
