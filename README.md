# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 31.40 | 4.00s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 21.12 | 11.31s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 20.46 | 9.81s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.49 | 3.57s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 5.88 | 27.90s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.18 | 40.15s | 3.0 |
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
| avoidablePropagation | 193.81ms | 208.59ms | 210.59ms | 2.20s | 161.71ms (fail) | 2.33s |
| broadPropagation | 385.23ms | 470.86ms | 453.29ms | 5.51s | 6.28ms (fail) | 4.39s |
| deepPropagation | 137.94ms | 172.91ms | 177.15ms | 2.04s | 141.75ms (fail) | 1.57s |
| diamond | 228.31ms | 287.55ms | 274.27ms | 3.54s | 202.78ms (fail) | 2.46s |
| mux | 383.51ms | 419.54ms | 397.40ms | 2.03s | 201.84ms (fail) | 1.81s |
| repeatedObservers | 21.76ms | 44.99ms | 41.05ms | 211.82ms | 55.01ms (fail) | 237.34ms |
| triangle | 92.39ms | 106.84ms | 99.54ms | 1.15s | 80.32ms (fail) | 796.61ms |
| unstable | 40.41ms | 77.25ms | 68.50ms | 341.54ms | 339.61ms (fail) | 349.77ms |
| molBench | 491.26ms | 491.38ms | 488.60ms | 1.78s | 1.78ms | 598.49ms |
| create_signals | 22.73ms | 30.22ms | 5.07ms | 73.54ms | 65.60ms | 72.46ms |
| comp_0to1 | 5.08ms | 14.93ms | 18.36ms | 39.29ms | 56.37ms | 34.78ms |
| comp_1to1 | 17.78ms | 28.09ms | 16.23ms | 52.14ms | 54.22ms | 24.98ms |
| comp_2to1 | 9.12ms | 14.68ms | 19.41ms | 38.97ms | 35.66ms | 19.99ms |
| comp_4to1 | 16.28ms | 4.67ms | 15.09ms | 14.79ms | 20.53ms | 15.32ms |
| comp_1000to1 | 4μs | 5μs | 6μs | 2.11ms | 50μs | 31μs |
| comp_1to2 | 7.24ms | 25.52ms | 18.86ms | 26.40ms | 48.68ms | 43.17ms |
| comp_1to4 | 9.48ms | 11.71ms | 31.95ms | 27.05ms | 43.34ms | 26.09ms |
| comp_1to8 | 5.90ms | 7.41ms | 8.16ms | 21.08ms | 44.12ms | 22.95ms |
| comp_1to1000 | 3.68ms | 4.80ms | 6.47ms | 19.33ms | 40.83ms | 15.70ms |
| update_1to1 | 4.45ms | 9.34ms | 8.87ms | 43.31ms | 6.49ms | 37.80ms |
| update_2to1 | 5.30ms | 4.66ms | 4.38ms | 21.34ms | 3.15ms | 13.84ms |
| update_4to1 | 1.20ms | 2.34ms | 2.26ms | 10.68ms | 1.69ms | 9.49ms |
| update_1000to1 | 10μs | 23μs | 21μs | 114μs | 27μs | 75μs |
| update_1to2 | 1.94ms | 4.87ms | 4.36ms | 21.49ms | 3.54ms | 14.44ms |
| update_1to4 | 986μs | 2.34ms | 2.20ms | 10.88ms | 1.51ms | 9.29ms |
| update_1to1000 | 47μs | 51μs | 940μs | 228μs | 400μs | 210μs |
| cellx1000 | 7.67ms | 10.05ms | 10.38ms | 161.34ms | 5.17ms | 82.77ms |
| cellx2500 | 23.38ms | 32.92ms | 34.06ms | 532.64ms | 19.83ms | 301.30ms |
| cellx5000 | 62.11ms | 77.64ms | 72.73ms | 1.24s | 62.74ms | 638.23ms |
| 10x5 - 2 sources - read 20.0% (simple) | 265.09ms | 500.92ms | 433.45ms | 2.65s (half) | 267.29ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 221.62ms | 276.02ms | 269.94ms | 2.40s (half) | 207.09ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 308.47ms | 3.91s | 3.42s | 4.11s (half) | 356.56ms | 1.86s |
| 1000x5 - 25 sources (wide dense) | 511.84ms | 3.35s | 2.52s | 4.96s (half) | 533.43ms | 3.60s |
| 5x500 - 3 sources (deep) | 228.51ms | 228.50ms | 229.13ms | 2.06s (half) | 232.03ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 287.57ms | 478.19ms | 451.10ms | 2.81s (half) | 265.99ms | 1.81s |
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
