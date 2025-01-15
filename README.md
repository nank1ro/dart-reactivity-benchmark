# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.53 | 4.18s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 23.75 | 11.40s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 23.53 | 9.73s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.05 | 3.52s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.26 | 27.55s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.31 | 39.88s | 3.0 |
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
| avoidablePropagation | 204.46ms | 208.60ms | 209.88ms | 2.23s | 154.59ms (fail) | 2.33s |
| broadPropagation | 423.30ms | 461.54ms | 455.15ms | 5.57s | 6.58ms (fail) | 4.36s |
| deepPropagation | 153.38ms | 177.12ms | 171.93ms | 2.05s | 143.14ms (fail) | 1.56s |
| diamond | 271.48ms | 282.55ms | 277.09ms | 3.48s | 192.17ms (fail) | 2.47s |
| mux | 391.29ms | 409.66ms | 385.09ms | 2.06s | 191.58ms (fail) | 1.81s |
| repeatedObservers | 38.64ms | 45.19ms | 40.94ms | 214.83ms | 53.68ms (fail) | 235.55ms |
| triangle | 103.08ms | 103.47ms | 97.78ms | 1.14s | 88.70ms (fail) | 774.42ms |
| unstable | 91.79ms | 77.36ms | 69.55ms | 348.60ms | 334.85ms (fail) | 357.94ms |
| molBench | 495.73ms | 486.22ms | 484.24ms | 1.75s | 860μs | 586.42ms |
| create_signals | 21.00ms | 30.67ms | 4.68ms | 93.22ms | 72.80ms | 73.40ms |
| comp_0to1 | 4.66ms | 14.92ms | 17.04ms | 35.48ms | 50.61ms | 16.68ms |
| comp_1to1 | 17.50ms | 18.72ms | 14.33ms | 45.62ms | 53.99ms | 44.33ms |
| comp_2to1 | 11.70ms | 10.95ms | 15.55ms | 22.57ms | 34.14ms | 26.44ms |
| comp_4to1 | 16.48ms | 2.11ms | 10.85ms | 15.63ms | 17.91ms | 14.05ms |
| comp_1000to1 | 4μs | 6μs | 4μs | 2.29ms | 44μs | 15μs |
| comp_1to2 | 6.38ms | 24.47ms | 22.45ms | 35.46ms | 46.97ms | 36.05ms |
| comp_1to4 | 8.53ms | 13.19ms | 30.92ms | 31.29ms | 43.76ms | 31.07ms |
| comp_1to8 | 5.68ms | 6.68ms | 7.42ms | 28.48ms | 43.91ms | 20.89ms |
| comp_1to1000 | 3.53ms | 4.63ms | 5.81ms | 23.20ms | 40.18ms | 18.39ms |
| update_1to1 | 8.33ms | 9.37ms | 8.80ms | 43.52ms | 8.94ms | 27.77ms |
| update_2to1 | 1.98ms | 4.66ms | 4.35ms | 21.78ms | 2.92ms | 13.86ms |
| update_4to1 | 1.90ms | 2.41ms | 2.21ms | 10.79ms | 2.41ms | 6.97ms |
| update_1000to1 | 18μs | 23μs | 21μs | 116μs | 14μs | 70μs |
| update_1to2 | 2.56ms | 4.73ms | 4.36ms | 21.78ms | 5.72ms | 14.37ms |
| update_1to4 | 2.37ms | 2.36ms | 2.20ms | 10.93ms | 1.46ms | 6.91ms |
| update_1to1000 | 47μs | 45μs | 723μs | 261μs | 400μs | 167μs |
| cellx1000 | 8.61ms | 9.55ms | 9.45ms | 164.04ms | 5.40ms | 80.94ms |
| cellx2500 | 23.31ms | 32.35ms | 25.28ms | 502.20ms | 22.11ms | 231.31ms |
| cellx5000 | 54.44ms | 65.73ms | 71.62ms | 1.10s | 67.89ms | 570.38ms |
| 10x5 - 2 sources - read 20.0% (simple) | 276.89ms | 501.93ms | 425.94ms | 2.66s (half) | 252.72ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 216.19ms | 287.58ms | 270.97ms | 2.39s (half) | 210.18ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 296.45ms | 3.89s | 3.39s | 4.07s (half) | 343.09ms | 1.81s |
| 1000x5 - 25 sources (wide dense) | 499.05ms | 3.51s | 2.53s | 4.95s (half) | 524.90ms | 3.60s |
| 5x500 - 3 sources (deep) | 237.21ms | 227.46ms | 227.88ms | 1.99s (half) | 234.13ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 280.58ms | 476.65ms | 444.70ms | 2.76s (half) | 268.49ms | 1.72s |
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
