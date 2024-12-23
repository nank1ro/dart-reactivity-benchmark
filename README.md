# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.70 | 3.83s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 23.34 | 11.20s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 22.07 | 9.67s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.60 | 3.44s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.20 | 27.12s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.43 | 39.61s | 3.0 |
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
| avoidablePropagation | 198.38ms | 209.54ms | 209.54ms | 2.21s | 148.62ms (fail) | 2.30s |
| broadPropagation | 386.39ms | 461.00ms | 452.18ms | 5.49s | 6.55ms (fail) | 4.32s |
| deepPropagation | 145.46ms | 177.66ms | 174.74ms | 2.03s | 143.73ms (fail) | 1.53s |
| diamond | 216.32ms | 286.93ms | 278.76ms | 3.45s | 195.88ms (fail) | 2.41s |
| mux | 384.65ms | 410.53ms | 386.81ms | 2.06s | 194.56ms (fail) | 1.81s |
| repeatedObservers | 21.94ms | 44.92ms | 41.43ms | 212.48ms | 53.58ms (fail) | 235.54ms |
| triangle | 92.44ms | 101.29ms | 98.71ms | 1.14s | 79.27ms (fail) | 764.04ms |
| unstable | 41.04ms | 77.69ms | 70.31ms | 342.88ms | 336.62ms (fail) | 344.88ms |
| molBench | 479.26ms | 485.72ms | 470.18ms | 1.76s | 1.04ms | 584.44ms |
| create_signals | 22.61ms | 30.14ms | 4.57ms | 76.84ms | 67.70ms | 67.11ms |
| comp_0to1 | 4.51ms | 11.02ms | 16.58ms | 30.49ms | 49.33ms | 19.02ms |
| comp_1to1 | 16.80ms | 19.33ms | 15.10ms | 44.97ms | 52.06ms | 35.67ms |
| comp_2to1 | 8.72ms | 10.39ms | 14.46ms | 20.34ms | 33.05ms | 26.24ms |
| comp_4to1 | 16.31ms | 2.06ms | 11.83ms | 11.89ms | 16.81ms | 17.35ms |
| comp_1000to1 | 4μs | 5μs | 4μs | 1.99ms | 44μs | 33μs |
| comp_1to2 | 6.53ms | 17.73ms | 28.02ms | 28.70ms | 45.90ms | 35.75ms |
| comp_1to4 | 8.57ms | 9.70ms | 20.50ms | 29.06ms | 43.94ms | 19.94ms |
| comp_1to8 | 5.56ms | 7.08ms | 10.53ms | 22.73ms | 43.92ms | 21.26ms |
| comp_1to1000 | 3.37ms | 4.58ms | 9.17ms | 18.74ms | 41.82ms | 15.37ms |
| update_1to1 | 7.38ms | 9.37ms | 8.82ms | 42.74ms | 7.64ms | 27.50ms |
| update_2to1 | 4.70ms | 4.67ms | 4.36ms | 21.65ms | 2.89ms | 13.92ms |
| update_4to1 | 2.39ms | 2.36ms | 2.20ms | 10.68ms | 2.50ms | 7.25ms |
| update_1000to1 | 14μs | 23μs | 21μs | 115μs | 15μs | 66μs |
| update_1to2 | 5.24ms | 4.73ms | 4.37ms | 21.79ms | 5.38ms | 14.44ms |
| update_1to4 | 2.53ms | 2.38ms | 2.20ms | 10.96ms | 1.45ms | 6.92ms |
| update_1to1000 | 46μs | 46μs | 1.52ms | 229μs | 411μs | 164μs |
| cellx1000 | 7.69ms | 9.42ms | 9.43ms | 149.62ms | 5.17ms | 71.06ms |
| cellx2500 | 20.67ms | 30.19ms | 25.22ms | 463.75ms | 18.48ms | 267.15ms |
| cellx5000 | 44.42ms | 58.47ms | 61.59ms | 1.04s | 56.48ms | 528.36ms |
| 10x5 - 2 sources - read 20.0% (simple) | 256.62ms | 503.59ms | 426.44ms | 2.64s (half) | 247.23ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 203.44ms | 275.18ms | 269.63ms | 2.39s (half) | 206.13ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 274.69ms | 3.89s | 3.37s | 4.08s (half) | 338.77ms | 1.79s |
| 1000x5 - 25 sources (wide dense) | 463.58ms | 3.35s | 2.51s | 4.97s (half) | 489.93ms | 3.51s |
| 5x500 - 3 sources (deep) | 221.91ms | 224.74ms | 222.90ms | 1.99s (half) | 232.37ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 251.44ms | 473.50ms | 446.74ms | 2.80s (half) | 265.84ms | 1.67s |
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
