# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 29.94 | 3.96s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.91 | 11.32s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.43 | 9.78s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 14.82 | 3.66s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 5.53 | 28.60s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.07 | 39.61s | 3.0 |
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
| avoidablePropagation | 195.05ms | 210.76ms | 209.19ms | 2.20s | 153.83ms (fail) | 2.37s |
| broadPropagation | 380.81ms | 460.11ms | 459.82ms | 5.50s | 6.69ms (fail) | 4.40s |
| deepPropagation | 149.41ms | 172.57ms | 175.45ms | 2.01s | 147.03ms (fail) | 1.57s |
| diamond | 238.38ms | 287.77ms | 277.94ms | 3.46s | 196.85ms (fail) | 2.60s |
| mux | 378.26ms | 409.21ms | 387.76ms | 2.06s | 202.69ms (fail) | 1.91s |
| repeatedObservers | 21.53ms | 46.55ms | 41.29ms | 209.77ms | 54.62ms (fail) | 245.85ms |
| triangle | 92.65ms | 101.38ms | 99.75ms | 1.15s | 78.05ms (fail) | 791.72ms |
| unstable | 41.24ms | 77.40ms | 71.55ms | 343.48ms | 348.55ms (fail) | 361.62ms |
| molBench | 492.38ms | 485.61ms | 483.25ms | 1.74s | 938μs | 593.13ms |
| create_signals | 21.73ms | 30.40ms | 4.65ms | 68.02ms | 75.02ms | 74.40ms |
| comp_0to1 | 5.07ms | 16.30ms | 16.93ms | 34.06ms | 59.09ms | 16.31ms |
| comp_1to1 | 15.90ms | 17.93ms | 16.47ms | 44.26ms | 54.45ms | 48.92ms |
| comp_2to1 | 18.84ms | 8.25ms | 11.74ms | 21.66ms | 35.59ms | 28.73ms |
| comp_4to1 | 10.67ms | 2.19ms | 13.47ms | 18.63ms | 18.06ms | 17.14ms |
| comp_1000to1 | 5μs | 5μs | 4μs | 2.02ms | 86μs | 17μs |
| comp_1to2 | 9.15ms | 21.41ms | 20.29ms | 33.45ms | 47.92ms | 41.53ms |
| comp_1to4 | 11.04ms | 7.42ms | 20.08ms | 30.96ms | 45.88ms | 20.54ms |
| comp_1to8 | 5.70ms | 6.83ms | 8.03ms | 25.10ms | 46.39ms | 23.60ms |
| comp_1to1000 | 4.35ms | 4.53ms | 6.55ms | 20.69ms | 40.63ms | 17.11ms |
| update_1to1 | 4.40ms | 9.37ms | 8.77ms | 43.10ms | 9.85ms | 30.02ms |
| update_2to1 | 4.64ms | 4.66ms | 4.39ms | 21.86ms | 2.92ms | 16.12ms |
| update_4to1 | 952μs | 2.35ms | 2.20ms | 10.75ms | 2.75ms | 8.17ms |
| update_1000to1 | 9μs | 23μs | 21μs | 116μs | 15μs | 80μs |
| update_1to2 | 4.77ms | 4.72ms | 4.36ms | 21.83ms | 3.13ms | 15.61ms |
| update_1to4 | 2.30ms | 2.34ms | 2.20ms | 11.03ms | 1.50ms | 8.02ms |
| update_1to1000 | 48μs | 45μs | 524μs | 271μs | 401μs | 210μs |
| cellx1000 | 7.61ms | 9.83ms | 10.17ms | 158.08ms | 5.89ms | 91.58ms |
| cellx2500 | 20.61ms | 30.76ms | 28.42ms | 477.42ms | 27.50ms | 308.10ms |
| cellx5000 | 44.77ms | 58.23ms | 74.34ms | 1.07s | 83.47ms | 634.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 257.00ms | 512.84ms | 428.16ms | 2.70s (half) | 253.19ms | 2.06s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 210.34ms | 277.58ms | 284.18ms | 2.39s (half) | 220.32ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 297.21ms | 3.87s | 3.41s | 4.09s (half) | 396.06ms | 1.88s |
| 1000x5 - 25 sources (wide dense) | 508.64ms | 3.45s | 2.52s | 4.88s (half) | 538.15ms | 3.65s |
| 5x500 - 3 sources (deep) | 227.74ms | 231.07ms | 226.64ms | 2.04s (half) | 236.82ms | 1.36s |
| 100x15 - 6 sources - dynamic (very dynamic) | 275.22ms | 479.88ms | 455.11ms | 2.76s (half) | 269.04ms | 1.88s |
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
