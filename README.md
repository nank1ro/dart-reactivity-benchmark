# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.63 | 3.97s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 21.40 | 11.12s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.22 | 9.80s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.90 | 3.57s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.05 | 27.67s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.38 | 40.29s | 3.0 |
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
| avoidablePropagation | 196.85ms | 212.22ms | 210.04ms | 2.21s | 175.36ms (fail) | 2.36s |
| broadPropagation | 384.77ms | 464.06ms | 451.94ms | 5.56s | 7.64ms (fail) | 4.37s |
| deepPropagation | 151.31ms | 175.40ms | 177.49ms | 2.08s | 140.94ms (fail) | 1.58s |
| diamond | 238.73ms | 286.71ms | 281.00ms | 3.51s | 203.12ms (fail) | 2.48s |
| mux | 386.86ms | 420.79ms | 390.54ms | 2.10s | 193.39ms (fail) | 1.80s |
| repeatedObservers | 21.52ms | 45.14ms | 41.64ms | 210.94ms | 54.70ms (fail) | 236.81ms |
| triangle | 94.85ms | 103.38ms | 98.00ms | 1.14s | 84.44ms (fail) | 782.36ms |
| unstable | 41.70ms | 76.27ms | 67.54ms | 342.95ms | 336.91ms (fail) | 354.80ms |
| molBench | 492.99ms | 491.20ms | 485.22ms | 1.78s | 925μs | 599.78ms |
| create_signals | 22.01ms | 34.99ms | 4.86ms | 70.65ms | 76.18ms | 67.70ms |
| comp_0to1 | 4.68ms | 15.23ms | 17.60ms | 32.68ms | 55.08ms | 25.18ms |
| comp_1to1 | 16.22ms | 33.81ms | 15.04ms | 33.55ms | 55.65ms | 25.04ms |
| comp_2to1 | 11.23ms | 11.05ms | 19.21ms | 34.53ms | 37.37ms | 22.78ms |
| comp_4to1 | 18.09ms | 2.13ms | 8.50ms | 12.19ms | 19.32ms | 15.51ms |
| comp_1000to1 | 4μs | 9μs | 6μs | 3.04ms | 71μs | 21μs |
| comp_1to2 | 6.75ms | 18.95ms | 17.19ms | 19.69ms | 48.31ms | 49.82ms |
| comp_1to4 | 8.82ms | 16.14ms | 28.40ms | 24.70ms | 45.59ms | 26.97ms |
| comp_1to8 | 5.54ms | 9.66ms | 8.87ms | 24.02ms | 45.09ms | 21.17ms |
| comp_1to1000 | 3.40ms | 5.06ms | 9.22ms | 19.32ms | 41.39ms | 15.55ms |
| update_1to1 | 3.64ms | 9.40ms | 8.82ms | 43.42ms | 6.69ms | 27.77ms |
| update_2to1 | 4.67ms | 4.67ms | 4.37ms | 21.89ms | 3.59ms | 13.74ms |
| update_4to1 | 944μs | 2.36ms | 2.20ms | 10.95ms | 1.81ms | 7.04ms |
| update_1000to1 | 26μs | 23μs | 21μs | 137μs | 16μs | 70μs |
| update_1to2 | 4.86ms | 4.74ms | 4.35ms | 21.57ms | 3.12ms | 14.80ms |
| update_1to4 | 2.29ms | 2.35ms | 2.20ms | 10.86ms | 1.53ms | 6.89ms |
| update_1to1000 | 44μs | 49μs | 1.95ms | 223μs | 418μs | 206μs |
| cellx1000 | 7.66ms | 9.73ms | 9.53ms | 170.82ms | 5.69ms | 94.33ms |
| cellx2500 | 20.48ms | 25.64ms | 25.51ms | 514.96ms | 22.33ms | 297.81ms |
| cellx5000 | 43.97ms | 60.31ms | 63.43ms | 1.20s | 74.94ms | 662.21ms |
| 10x5 - 2 sources - read 20.0% (simple) | 255.01ms | 498.31ms | 438.39ms | 2.66s (half) | 252.68ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 214.55ms | 277.93ms | 271.12ms | 2.39s (half) | 209.93ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 300.22ms | 3.72s | 3.43s | 4.21s (half) | 344.01ms | 1.74s |
| 1000x5 - 25 sources (wide dense) | 498.81ms | 3.36s | 2.53s | 4.98s (half) | 513.13ms | 3.61s |
| 5x500 - 3 sources (deep) | 228.88ms | 231.96ms | 228.98ms | 2.04s (half) | 239.26ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 275.31ms | 487.17ms | 452.99ms | 2.80s (half) | 266.94ms | 1.70s |
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
