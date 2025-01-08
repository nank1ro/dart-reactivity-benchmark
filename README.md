# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.13 | 4.04s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.20 | 11.03s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.36 | 9.75s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.54 | 3.51s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.66 | 27.10s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.13 | 39.74s | 3.0 |
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
| avoidablePropagation | 207.03ms | 207.85ms | 211.00ms | 2.23s | 167.53ms (fail) | 2.30s |
| broadPropagation | 394.14ms | 469.59ms | 454.12ms | 5.59s | 6.80ms (fail) | 4.31s |
| deepPropagation | 153.69ms | 171.46ms | 173.32ms | 2.04s | 137.91ms (fail) | 1.54s |
| diamond | 252.13ms | 284.03ms | 273.77ms | 3.49s | 194.92ms (fail) | 2.42s |
| mux | 378.22ms | 406.95ms | 381.01ms | 2.07s | 196.36ms (fail) | 1.82s |
| repeatedObservers | 21.81ms | 44.53ms | 41.34ms | 218.58ms | 53.92ms (fail) | 233.96ms |
| triangle | 93.97ms | 100.34ms | 98.68ms | 1.14s | 80.81ms (fail) | 780.35ms |
| unstable | 42.32ms | 77.83ms | 70.27ms | 352.44ms | 333.10ms (fail) | 354.55ms |
| molBench | 490.82ms | 486.29ms | 483.59ms | 1.69s | 933μs | 585.84ms |
| create_signals | 21.51ms | 29.22ms | 4.69ms | 84.36ms | 72.60ms | 64.68ms |
| comp_0to1 | 4.53ms | 14.82ms | 17.09ms | 32.34ms | 58.28ms | 26.64ms |
| comp_1to1 | 17.19ms | 23.24ms | 16.16ms | 45.81ms | 52.99ms | 24.16ms |
| comp_2to1 | 16.70ms | 20.49ms | 19.35ms | 25.93ms | 33.86ms | 9.52ms |
| comp_4to1 | 16.44ms | 1.81ms | 10.97ms | 19.56ms | 17.77ms | 23.44ms |
| comp_1000to1 | 5μs | 5μs | 4μs | 1.82ms | 44μs | 16μs |
| comp_1to2 | 9.57ms | 17.40ms | 24.96ms | 21.20ms | 49.49ms | 36.00ms |
| comp_1to4 | 8.86ms | 7.21ms | 27.94ms | 37.29ms | 44.08ms | 28.72ms |
| comp_1to8 | 4.03ms | 6.57ms | 7.49ms | 27.21ms | 44.56ms | 19.78ms |
| comp_1to1000 | 3.83ms | 4.68ms | 5.60ms | 18.94ms | 40.83ms | 15.43ms |
| update_1to1 | 3.61ms | 9.37ms | 8.78ms | 42.88ms | 8.69ms | 27.77ms |
| update_2to1 | 4.66ms | 4.65ms | 4.39ms | 22.01ms | 2.92ms | 13.87ms |
| update_4to1 | 941μs | 2.40ms | 2.50ms | 10.75ms | 1.94ms | 7.17ms |
| update_1000to1 | 23μs | 23μs | 21μs | 115μs | 15μs | 81μs |
| update_1to2 | 4.66ms | 4.72ms | 4.36ms | 21.45ms | 4.89ms | 14.04ms |
| update_1to4 | 940μs | 2.36ms | 2.19ms | 10.91ms | 1.49ms | 6.94ms |
| update_1to1000 | 44μs | 46μs | 885μs | 217μs | 404μs | 181μs |
| cellx1000 | 8.21ms | 9.72ms | 9.72ms | 154.46ms | 5.31ms | 76.16ms |
| cellx2500 | 20.20ms | 31.17ms | 25.98ms | 478.26ms | 20.17ms | 227.81ms |
| cellx5000 | 43.55ms | 59.76ms | 64.99ms | 1.09s | 60.43ms | 562.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 267.41ms | 502.51ms | 425.34ms | 2.64s (half) | 261.79ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 227.73ms | 278.48ms | 277.29ms | 2.35s (half) | 210.51ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 303.51ms | 3.68s | 3.41s | 4.12s (half) | 338.18ms | 1.84s |
| 1000x5 - 25 sources (wide dense) | 508.42ms | 3.35s | 2.52s | 4.92s (half) | 506.04ms | 3.46s |
| 5x500 - 3 sources (deep) | 220.06ms | 230.21ms | 230.73ms | 1.98s (half) | 238.96ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 287.58ms | 484.97ms | 450.65ms | 2.77s (half) | 263.87ms | 1.68s |
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
