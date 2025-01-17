# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.46 | 4.09s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 24.32 | 10.98s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 24.15 | 9.76s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 17.04 | 3.54s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.82 | 27.11s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.90 | 39.84s | 3.0 |
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
| avoidablePropagation | 202.90ms | 208.81ms | 211.02ms | 2.18s | 164.54ms (fail) | 2.27s |
| broadPropagation | 412.81ms | 471.62ms | 457.21ms | 5.49s | 6.63ms (fail) | 4.34s |
| deepPropagation | 148.52ms | 174.69ms | 173.18ms | 2.01s | 142.43ms (fail) | 1.53s |
| diamond | 250.69ms | 291.23ms | 277.90ms | 3.48s | 199.28ms (fail) | 2.40s |
| mux | 390.45ms | 412.64ms | 386.43ms | 2.06s | 192.99ms (fail) | 1.81s |
| repeatedObservers | 37.20ms | 44.99ms | 41.71ms | 210.86ms | 53.71ms (fail) | 234.29ms |
| triangle | 101.36ms | 102.41ms | 99.80ms | 1.15s | 80.44ms (fail) | 762.02ms |
| unstable | 88.85ms | 78.58ms | 70.20ms | 343.36ms | 337.04ms (fail) | 344.01ms |
| molBench | 493.59ms | 486.19ms | 483.75ms | 1.74s | 1.39ms | 586.59ms |
| create_signals | 21.22ms | 30.45ms | 4.82ms | 73.53ms | 63.90ms | 75.69ms |
| comp_0to1 | 4.56ms | 11.25ms | 17.05ms | 28.62ms | 50.95ms | 28.03ms |
| comp_1to1 | 17.32ms | 15.42ms | 14.84ms | 42.06ms | 52.90ms | 40.05ms |
| comp_2to1 | 16.41ms | 13.78ms | 15.45ms | 26.09ms | 33.62ms | 23.96ms |
| comp_4to1 | 15.92ms | 8.04ms | 11.30ms | 21.10ms | 17.49ms | 24.25ms |
| comp_1000to1 | 6μs | 5μs | 4μs | 2.16ms | 50μs | 15μs |
| comp_1to2 | 9.94ms | 18.74ms | 16.81ms | 29.46ms | 50.00ms | 36.21ms |
| comp_1to4 | 10.28ms | 10.19ms | 20.33ms | 27.75ms | 43.90ms | 18.49ms |
| comp_1to8 | 4.05ms | 6.82ms | 7.39ms | 24.57ms | 44.54ms | 21.16ms |
| comp_1to1000 | 3.81ms | 4.59ms | 5.89ms | 18.91ms | 40.55ms | 15.47ms |
| update_1to1 | 7.14ms | 9.36ms | 8.82ms | 43.96ms | 8.22ms | 27.14ms |
| update_2to1 | 1.97ms | 4.66ms | 4.37ms | 21.66ms | 2.90ms | 13.98ms |
| update_4to1 | 2.54ms | 2.37ms | 2.17ms | 10.97ms | 1.92ms | 7.63ms |
| update_1000to1 | 18μs | 23μs | 22μs | 119μs | 14μs | 69μs |
| update_1to2 | 2.69ms | 4.73ms | 4.37ms | 21.68ms | 2.98ms | 12.53ms |
| update_1to4 | 2.36ms | 2.36ms | 2.17ms | 11.14ms | 1.45ms | 7.04ms |
| update_1to1000 | 40μs | 44μs | 531μs | 219μs | 403μs | 165μs |
| cellx1000 | 8.89ms | 9.37ms | 9.44ms | 192.83ms | 5.50ms | 72.64ms |
| cellx2500 | 22.44ms | 30.07ms | 25.32ms | 567.37ms | 20.82ms | 263.82ms |
| cellx5000 | 48.21ms | 60.15ms | 65.16ms | 1.18s | 61.82ms | 570.44ms |
| 10x5 - 2 sources - read 20.0% (simple) | 258.98ms | 504.78ms | 438.02ms | 2.64s (half) | 262.98ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 209.84ms | 275.69ms | 278.57ms | 2.37s (half) | 213.00ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 291.86ms | 3.68s | 3.40s | 4.03s (half) | 340.26ms | 1.79s |
| 1000x5 - 25 sources (wide dense) | 489.39ms | 3.30s | 2.51s | 4.98s (half) | 542.40ms | 3.49s |
| 5x500 - 3 sources (deep) | 231.16ms | 226.29ms | 232.16ms | 2.01s (half) | 233.45ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 285.71ms | 476.14ms | 456.10ms | 2.78s (half) | 268.24ms | 1.69s |
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
