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
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 27.60 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.82 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 20.81 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.11 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.12 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 3.97 |
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
| kairo avoidablePropagation | 201.70ms | 207.61ms | 200.17ms | 2.2026s | 178.07ms (fail) | 2.3350s |
| kairo broadPropagation | 390.04ms | 470.32ms | 419.02ms | 5.3634s | 7.21ms (fail) | 4.2668s |
| kairo deepPropagation | 151.75ms | 171.87ms | 145.62ms | 1.9878s | 141.39ms (fail) | 1.5243s |
| kairo diamond | 234.45ms | 289.45ms | 266.20ms | 3.4263s | 196.37ms (fail) | 2.4075s |
| kairo mux | 388.38ms | 405.58ms | 383.30ms | 2.0296s | 191.00ms (fail) | 1.7811s |
| kairo repeatedObservers | 21.94ms | 44.97ms | 40.06ms | 211.29ms | 54.12ms (fail) | 234.88ms |
| kairo triangle | 92.45ms | 101.97ms | 96.96ms | 1.1206s | 82.44ms (fail) | 771.05ms |
| kairo unstable | 42.66ms | 77.72ms | 68.29ms | 354.03ms | 342.06ms (fail) | 348.31ms |
| molBench | 482.76ms | 486.09ms | 490.12ms | 1.7048s | 1.13ms | 589.55ms |
| create_signals | 25.41ms | 30.94ms | 4.52ms | 70.89ms | 72.78ms | 69.56ms |
| comp_0to1 | 4.50ms | 11.40ms | 16.39ms | 40.64ms | 53.19ms | 17.99ms |
| comp_1to1 | 18.36ms | 15.86ms | 26.00ms | 46.52ms | 52.62ms | 30.94ms |
| comp_2to1 | 8.95ms | 8.83ms | 5.07ms | 27.14ms | 33.59ms | 30.01ms |
| comp_4to1 | 19.85ms | 2.02ms | 14.39ms | 20.32ms | 17.50ms | 11.61ms |
| comp_1000to1 | 4μs | 5μs | 4μs | 2.10ms | 51μs | 19μs |
| comp_1to2 | 6.66ms | 24.55ms | 13.23ms | 30.04ms | 45.76ms | 29.67ms |
| comp_1to4 | 8.83ms | 15.87ms | 31.36ms | 18.36ms | 44.24ms | 24.23ms |
| comp_1to8 | 5.59ms | 6.56ms | 10.66ms | 24.01ms | 43.63ms | 18.32ms |
| comp_1to1000 | 3.44ms | 4.62ms | 3.20ms | 17.94ms | 40.78ms | 14.44ms |
| update_1to1 | 10.62ms | 9.37ms | 9.51ms | 43.55ms | 12.66ms | 25.31ms |
| update_2to1 | 1.99ms | 4.67ms | 4.48ms | 21.81ms | 2.90ms | 11.90ms |
| update_4to1 | 2.48ms | 2.35ms | 2.22ms | 10.81ms | 1.60ms | 6.55ms |
| update_1000to1 | 18μs | 23μs | 21μs | 117μs | 15μs | 64μs |
| update_1to2 | 4.39ms | 4.73ms | 4.38ms | 21.74ms | 3.15ms | 11.69ms |
| update_1to4 | 2.60ms | 2.35ms | 2.22ms | 10.81ms | 1.49ms | 6.57ms |
| update_1to1000 | 59μs | 45μs | 56μs | 226μs | 415μs | 159μs |
| cellx1000 | 8.00ms | 9.69ms | 9.28ms | 155.89ms | 5.38ms | 68.01ms |
| cellx2500 | 21.90ms | 31.21ms | 26.73ms | 485.80ms | 19.95ms | 222.71ms |
| cellx5000 | 46.79ms | 63.81ms | 69.48ms | 1.1125s | 58.10ms | 535.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 260.97ms | 511.96ms | 406.42ms | 2.6385s (half) | 262.19ms | 1.9917s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.26ms | 285.03ms | 255.88ms | 2.4091s (half) | 217.33ms | 1.5063s |
| 1000x12 - 4 sources - dynamic (large) | 275.43ms | 3.8013s | 2.7891s | 4.3157s (half) | 340.40ms | 1.7601s |
| 1000x5 - 25 sources (wide dense) | 460.14ms | 3.5199s | 2.4544s | 5.0712s (half) | 521.65ms | 3.5288s |
| 5x500 - 3 sources (deep) | 222.78ms | 227.61ms | 203.24ms | 1.9708s (half) | 235.26ms | 1.1102s |
| 100x15 - 6 sources - dynamic (very dynamic) | 256.72ms | 473.96ms | 439.11ms | 2.7645s (half) | 266.88ms | 1.6744s |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed
