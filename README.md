# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.22 | 4.16s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 23.86 | 11.18s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 22.73 | 9.78s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.52 | 3.50s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.39 | 27.33s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.53 | 39.93s | 3.0 |
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
| avoidablePropagation | 206.38ms | 207.15ms | 208.32ms | 2.21s | 155.05ms (fail) | 2.38s |
| broadPropagation | 409.59ms | 462.88ms | 455.08ms | 5.53s | 5.92ms (fail) | 4.30s |
| deepPropagation | 153.20ms | 170.44ms | 173.26ms | 2.03s | 139.24ms (fail) | 1.54s |
| diamond | 263.21ms | 282.33ms | 272.85ms | 3.51s | 187.31ms (fail) | 2.44s |
| mux | 397.52ms | 415.38ms | 399.32ms | 2.09s | 197.57ms (fail) | 1.82s |
| repeatedObservers | 38.22ms | 44.81ms | 41.19ms | 213.27ms | 56.90ms (fail) | 242.44ms |
| triangle | 101.42ms | 101.43ms | 98.00ms | 1.14s | 75.83ms (fail) | 766.39ms |
| unstable | 90.43ms | 77.93ms | 70.05ms | 355.88ms | 337.57ms (fail) | 360.89ms |
| molBench | 493.76ms | 486.37ms | 485.29ms | 1.74s | 880μs | 589.71ms |
| create_signals | 20.83ms | 30.04ms | 4.57ms | 76.27ms | 75.72ms | 77.15ms |
| comp_0to1 | 4.57ms | 11.47ms | 16.73ms | 33.45ms | 53.61ms | 15.90ms |
| comp_1to1 | 17.04ms | 18.75ms | 14.10ms | 45.28ms | 52.72ms | 38.93ms |
| comp_2to1 | 11.24ms | 14.69ms | 19.33ms | 24.49ms | 33.61ms | 41.38ms |
| comp_4to1 | 15.73ms | 2.08ms | 10.82ms | 19.42ms | 17.47ms | 15.82ms |
| comp_1000to1 | 3μs | 5μs | 4μs | 2.14ms | 46μs | 32μs |
| comp_1to2 | 8.94ms | 19.99ms | 22.13ms | 29.60ms | 45.64ms | 33.70ms |
| comp_1to4 | 10.41ms | 9.94ms | 28.36ms | 30.90ms | 43.47ms | 18.17ms |
| comp_1to8 | 7.67ms | 6.61ms | 7.65ms | 23.58ms | 44.18ms | 22.50ms |
| comp_1to1000 | 3.38ms | 5.27ms | 6.32ms | 18.84ms | 40.17ms | 15.44ms |
| update_1to1 | 9.57ms | 9.36ms | 8.83ms | 43.14ms | 8.76ms | 23.24ms |
| update_2to1 | 1.95ms | 4.81ms | 4.35ms | 22.03ms | 2.90ms | 12.76ms |
| update_4to1 | 2.62ms | 2.35ms | 2.19ms | 10.78ms | 1.48ms | 7.26ms |
| update_1000to1 | 23μs | 23μs | 22μs | 115μs | 15μs | 70μs |
| update_1to2 | 3.91ms | 4.75ms | 4.35ms | 21.58ms | 4.13ms | 13.83ms |
| update_1to4 | 1.16ms | 2.34ms | 2.19ms | 10.98ms | 1.45ms | 6.93ms |
| update_1to1000 | 36μs | 45μs | 807μs | 233μs | 403μs | 175μs |
| cellx1000 | 8.54ms | 9.80ms | 11.48ms | 166.73ms | 5.61ms | 79.68ms |
| cellx2500 | 23.40ms | 33.33ms | 37.02ms | 551.30ms | 24.81ms | 271.08ms |
| cellx5000 | 50.74ms | 74.50ms | 95.73ms | 1.13s | 72.45ms | 578.55ms |
| 10x5 - 2 sources - read 20.0% (simple) | 268.67ms | 501.25ms | 426.62ms | 2.69s (half) | 244.63ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 221.17ms | 274.44ms | 272.58ms | 2.35s (half) | 205.84ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 300.86ms | 3.68s | 3.37s | 4.07s (half) | 348.89ms | 1.83s |
| 1000x5 - 25 sources (wide dense) | 489.56ms | 3.51s | 2.54s | 4.93s (half) | 515.80ms | 3.46s |
| 5x500 - 3 sources (deep) | 246.93ms | 226.12ms | 227.58ms | 2.03s (half) | 234.28ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 282.30ms | 473.70ms | 449.39ms | 2.79s (half) | 264.31ms | 1.68s |
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
