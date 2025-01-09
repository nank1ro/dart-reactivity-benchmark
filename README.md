# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.71 | 4.00s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 23.52 | 11.02s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.45 | 9.66s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.89 | 3.57s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.88 | 27.88s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.70 | 40.19s | 3.0 |
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
| avoidablePropagation | 192.48ms | 210.54ms | 210.07ms | 2.24s | 166.69ms (fail) | 2.36s |
| broadPropagation | 388.80ms | 459.45ms | 462.36ms | 5.61s | 6.93ms (fail) | 4.49s |
| deepPropagation | 145.50ms | 174.97ms | 173.51ms | 2.04s | 143.78ms (fail) | 1.59s |
| diamond | 246.96ms | 284.77ms | 277.44ms | 3.53s | 203.64ms (fail) | 2.52s |
| mux | 381.18ms | 407.20ms | 391.74ms | 2.09s | 192.28ms (fail) | 1.79s |
| repeatedObservers | 20.68ms | 44.91ms | 41.10ms | 220.90ms | 53.68ms (fail) | 238.38ms |
| triangle | 96.64ms | 102.22ms | 99.10ms | 1.15s | 80.08ms (fail) | 803.96ms |
| unstable | 42.46ms | 77.29ms | 69.95ms | 346.91ms | 340.66ms (fail) | 357.57ms |
| molBench | 491.06ms | 487.96ms | 483.76ms | 1.76s | 871μs | 587.22ms |
| create_signals | 21.75ms | 29.34ms | 4.64ms | 65.72ms | 69.83ms | 68.29ms |
| comp_0to1 | 4.49ms | 11.28ms | 16.78ms | 29.59ms | 50.17ms | 20.18ms |
| comp_1to1 | 15.63ms | 15.82ms | 15.23ms | 48.66ms | 53.09ms | 36.17ms |
| comp_2to1 | 14.22ms | 12.98ms | 16.91ms | 22.75ms | 34.11ms | 23.54ms |
| comp_4to1 | 14.69ms | 5.83ms | 11.52ms | 19.75ms | 17.74ms | 14.21ms |
| comp_1000to1 | 4μs | 6μs | 9μs | 2.22ms | 46μs | 16μs |
| comp_1to2 | 6.58ms | 19.41ms | 20.08ms | 43.66ms | 46.25ms | 34.78ms |
| comp_1to4 | 10.55ms | 9.91ms | 31.41ms | 27.70ms | 44.05ms | 18.47ms |
| comp_1to8 | 7.07ms | 6.42ms | 7.95ms | 23.14ms | 45.08ms | 20.98ms |
| comp_1to1000 | 6.91ms | 4.58ms | 7.14ms | 18.52ms | 41.76ms | 16.08ms |
| update_1to1 | 7.37ms | 12.98ms | 10.85ms | 42.95ms | 8.71ms | 26.54ms |
| update_2to1 | 1.99ms | 5.80ms | 5.26ms | 21.83ms | 2.89ms | 13.25ms |
| update_4to1 | 2.37ms | 2.33ms | 2.76ms | 10.73ms | 1.92ms | 7.49ms |
| update_1000to1 | 15μs | 23μs | 26μs | 115μs | 14μs | 69μs |
| update_1to2 | 5.48ms | 4.74ms | 5.25ms | 21.44ms | 4.01ms | 14.09ms |
| update_1to4 | 2.42ms | 2.34ms | 2.61ms | 10.89ms | 1.47ms | 8.25ms |
| update_1to1000 | 44μs | 50μs | 951μs | 219μs | 412μs | 175μs |
| cellx1000 | 7.50ms | 9.74ms | 9.80ms | 159.62ms | 5.28ms | 74.34ms |
| cellx2500 | 20.13ms | 31.66ms | 27.71ms | 486.70ms | 21.09ms | 263.58ms |
| cellx5000 | 45.68ms | 63.26ms | 75.71ms | 1.13s | 62.46ms | 568.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 255.66ms | 503.82ms | 424.48ms | 2.65s (half) | 269.39ms | 2.05s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 212.83ms | 276.57ms | 271.71ms | 2.49s (half) | 213.75ms | 1.56s |
| 1000x12 - 4 sources - dynamic (large) | 300.96ms | 3.66s | 3.31s | 4.01s (half) | 353.70ms | 1.86s |
| 1000x5 - 25 sources (wide dense) | 508.24ms | 3.37s | 2.51s | 5.01s (half) | 527.59ms | 3.55s |
| 5x500 - 3 sources (deep) | 231.88ms | 231.43ms | 224.63ms | 2.02s (half) | 236.70ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 287.13ms | 473.84ms | 440.32ms | 2.83s (half) | 271.91ms | 1.74s |
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
