# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 29.86 | 3.94s | 0.0 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 23.56 | 9.72s | 0.0 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 21.67 | 11.18s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.94 | 3.51s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 7.02 | 27.83s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.73 | 41.58s | 3.0 |
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
| avoidablePropagation | 193.95ms | 207.16ms | 211.77ms | 2.33s | 158.01ms (fail) | 2.30s |
| broadPropagation | 384.45ms | 456.38ms | 456.03ms | 5.92s | 6.13ms (fail) | 4.38s |
| deepPropagation | 145.40ms | 173.90ms | 178.19ms | 2.17s | 138.28ms (fail) | 1.55s |
| diamond | 238.71ms | 283.80ms | 274.62ms | 3.69s | 184.24ms (fail) | 2.41s |
| mux | 373.88ms | 411.52ms | 382.79ms | 2.17s | 194.67ms (fail) | 1.90s |
| repeatedObservers | 21.64ms | 44.83ms | 41.42ms | 225.89ms | 53.58ms (fail) | 237.28ms |
| triangle | 96.17ms | 99.94ms | 98.69ms | 1.22s | 79.44ms (fail) | 766.80ms |
| unstable | 41.31ms | 77.01ms | 67.68ms | 361.98ms | 339.70ms (fail) | 347.86ms |
| molBench | 490.84ms | 487.56ms | 484.11ms | 1.76s | 928μs | 588.30ms |
| create_signals | 24.07ms | 29.38ms | 4.71ms | 72.33ms | 73.82ms | 66.06ms |
| comp_0to1 | 4.52ms | 14.66ms | 16.67ms | 32.36ms | 57.21ms | 19.04ms |
| comp_1to1 | 15.81ms | 24.52ms | 14.61ms | 45.04ms | 55.92ms | 33.31ms |
| comp_2to1 | 15.78ms | 7.92ms | 18.03ms | 20.13ms | 35.31ms | 12.56ms |
| comp_4to1 | 12.77ms | 9.07ms | 10.79ms | 12.81ms | 18.41ms | 17.88ms |
| comp_1000to1 | 4μs | 5μs | 7μs | 2.00ms | 58μs | 20μs |
| comp_1to2 | 6.63ms | 13.59ms | 12.41ms | 28.41ms | 49.86ms | 43.81ms |
| comp_1to4 | 10.26ms | 14.53ms | 17.61ms | 31.07ms | 46.95ms | 18.93ms |
| comp_1to8 | 6.79ms | 12.60ms | 6.05ms | 24.70ms | 47.66ms | 22.21ms |
| comp_1to1000 | 6.39ms | 10.23ms | 3.54ms | 18.96ms | 43.55ms | 15.97ms |
| update_1to1 | 3.79ms | 9.46ms | 8.75ms | 43.23ms | 8.97ms | 23.32ms |
| update_2to1 | 4.75ms | 4.66ms | 4.34ms | 21.22ms | 2.90ms | 11.54ms |
| update_4to1 | 1.43ms | 2.38ms | 2.21ms | 10.79ms | 2.09ms | 6.16ms |
| update_1000to1 | 9μs | 23μs | 21μs | 115μs | 14μs | 55μs |
| update_1to2 | 6.15ms | 4.72ms | 4.36ms | 21.36ms | 4.26ms | 11.12ms |
| update_1to4 | 2.26ms | 2.36ms | 2.22ms | 10.94ms | 1.45ms | 5.92ms |
| update_1to1000 | 71μs | 46μs | 51μs | 217μs | 453μs | 158μs |
| cellx1000 | 9.49ms | 9.51ms | 12.17ms | 168.15ms | 5.57ms | 73.53ms |
| cellx2500 | 20.59ms | 30.78ms | 26.39ms | 510.15ms | 21.66ms | 244.07ms |
| cellx5000 | 44.22ms | 60.95ms | 69.18ms | 1.11s | 69.36ms | 541.54ms |
| 10x5 - 2 sources - read 20.0% (simple) | 261.99ms | 509.87ms | 426.16ms | 2.82s (half) | 251.38ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 200.59ms | 299.38ms | 270.79ms | 2.47s (half) | 206.81ms | 1.57s |
| 1000x12 - 4 sources - dynamic (large) | 292.49ms | 3.65s | 3.42s | 4.24s (half) | 339.09ms | 1.97s |
| 1000x5 - 25 sources (wide dense) | 489.85ms | 3.50s | 2.51s | 4.98s (half) | 510.85ms | 3.69s |
| 5x500 - 3 sources (deep) | 227.65ms | 228.97ms | 226.09ms | 2.10s (half) | 234.63ms | 1.19s |
| 100x15 - 6 sources - dynamic (very dynamic) | 282.47ms | 483.27ms | 447.13ms | 2.92s (half) | 266.34ms | 1.74s |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed

## Integrate into your project

You can easily integrate Dart reactivity benchmark into your project to provide benchmarking.

### Install it

```bash
dart pub add dev:reactivity_benchmark
```

### Writing Tests

```dart
class YourReactiveFramework extends ReactiveFramework {
  ...
}

void main() {
  final framework = YourReactiveFramework();
  runFrameworkBench(framework);
}
```

## Local run benchmarks

Dart VM
```bash
dart run frameworks/[framework_name].dart
```

Run all benchamrks
```bash
bash bench.sh
```
