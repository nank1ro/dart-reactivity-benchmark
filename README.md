# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.90 | 3.98s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.17 | 11.07s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.50 | 9.68s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.85 | 3.50s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 5.88 | 27.38s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 3.95 | 39.87s | 3.0 |
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
| avoidablePropagation | 198.36ms | 211.34ms | 199.26ms | 2.18s | 153.63ms (fail) | 2.33s |
| broadPropagation | 396.39ms | 456.99ms | 452.27ms | 5.53s | 6.74ms (fail) | 4.38s |
| deepPropagation | 152.49ms | 175.71ms | 175.80ms | 2.03s | 139.10ms (fail) | 1.54s |
| diamond | 244.40ms | 281.37ms | 288.92ms | 3.50s | 190.72ms (fail) | 2.43s |
| mux | 391.94ms | 418.01ms | 386.96ms | 2.06s | 191.85ms (fail) | 1.77s |
| repeatedObservers | 21.69ms | 45.05ms | 41.25ms | 212.23ms | 53.48ms (fail) | 235.03ms |
| triangle | 93.38ms | 102.49ms | 98.14ms | 1.13s | 79.61ms (fail) | 769.92ms |
| unstable | 41.65ms | 77.84ms | 69.87ms | 360.44ms | 335.35ms (fail) | 351.33ms |
| molBench | 490.51ms | 485.84ms | 483.68ms | 1.75s | 935μs | 586.88ms |
| create_signals | 21.67ms | 31.00ms | 4.58ms | 79.36ms | 63.43ms | 74.47ms |
| comp_0to1 | 4.51ms | 14.78ms | 16.84ms | 31.15ms | 55.02ms | 20.35ms |
| comp_1to1 | 15.43ms | 18.39ms | 14.82ms | 43.40ms | 52.84ms | 31.74ms |
| comp_2to1 | 10.08ms | 8.85ms | 14.25ms | 37.51ms | 34.11ms | 23.02ms |
| comp_4to1 | 17.81ms | 2.19ms | 11.02ms | 13.18ms | 17.21ms | 17.90ms |
| comp_1000to1 | 4μs | 5μs | 4μs | 2.08ms | 47μs | 32μs |
| comp_1to2 | 6.29ms | 19.14ms | 16.82ms | 28.13ms | 49.11ms | 33.45ms |
| comp_1to4 | 8.55ms | 9.60ms | 22.38ms | 26.89ms | 43.77ms | 18.22ms |
| comp_1to8 | 5.21ms | 7.08ms | 8.84ms | 23.86ms | 43.37ms | 21.10ms |
| comp_1to1000 | 3.17ms | 4.55ms | 6.04ms | 19.15ms | 39.87ms | 16.15ms |
| update_1to1 | 3.63ms | 9.36ms | 8.86ms | 43.15ms | 8.81ms | 27.74ms |
| update_2to1 | 4.66ms | 4.67ms | 4.38ms | 21.31ms | 2.95ms | 13.77ms |
| update_4to1 | 908μs | 2.35ms | 2.22ms | 10.73ms | 1.68ms | 7.62ms |
| update_1000to1 | 13μs | 23μs | 22μs | 115μs | 14μs | 85μs |
| update_1to2 | 4.66ms | 4.73ms | 4.40ms | 21.36ms | 3.72ms | 14.06ms |
| update_1to4 | 2.28ms | 2.34ms | 2.23ms | 10.96ms | 1.51ms | 6.92ms |
| update_1to1000 | 35μs | 46μs | 466μs | 241μs | 391μs | 164μs |
| cellx1000 | 7.43ms | 9.71ms | 9.48ms | 169.32ms | 5.32ms | 74.17ms |
| cellx2500 | 20.83ms | 33.01ms | 26.72ms | 493.69ms | 21.33ms | 254.10ms |
| cellx5000 | 48.67ms | 69.74ms | 74.10ms | 1.09s | 66.53ms | 554.26ms |
| 10x5 - 2 sources - read 20.0% (simple) | 261.36ms | 502.95ms | 430.85ms | 2.64s (half) | 265.29ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 210.81ms | 276.91ms | 274.75ms | 2.43s (half) | 206.08ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 292.13ms | 3.64s | 3.32s | 4.12s (half) | 341.06ms | 1.85s |
| 1000x5 - 25 sources (wide dense) | 489.46ms | 3.43s | 2.53s | 4.98s (half) | 520.93ms | 3.52s |
| 5x500 - 3 sources (deep) | 224.63ms | 230.44ms | 229.17ms | 2.02s (half) | 234.81ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 281.30ms | 478.18ms | 452.65ms | 2.76s (half) | 266.98ms | 1.71s |
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
