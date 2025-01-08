# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.41 | 3.99s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.14 | 11.16s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 22.03 | 9.73s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.39 | 3.53s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.20 | 27.36s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.13 | 40.31s | 3.0 |
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
| avoidablePropagation | 197.67ms | 208.79ms | 210.42ms | 2.22s | 164.23ms (fail) | 2.33s |
| broadPropagation | 378.39ms | 458.44ms | 462.11ms | 5.52s | 8.21ms (fail) | 4.34s |
| deepPropagation | 151.57ms | 168.19ms | 176.73ms | 2.06s | 140.79ms (fail) | 1.55s |
| diamond | 239.28ms | 284.61ms | 272.64ms | 3.59s | 195.36ms (fail) | 2.46s |
| mux | 376.89ms | 412.25ms | 387.50ms | 2.11s | 195.96ms (fail) | 1.82s |
| repeatedObservers | 21.48ms | 44.89ms | 41.15ms | 215.51ms | 53.64ms (fail) | 238.72ms |
| triangle | 92.98ms | 100.92ms | 97.29ms | 1.17s | 79.03ms (fail) | 789.01ms |
| unstable | 41.32ms | 77.00ms | 69.67ms | 359.56ms | 335.69ms (fail) | 356.65ms |
| molBench | 490.99ms | 486.07ms | 483.50ms | 1.77s | 889μs | 587.48ms |
| create_signals | 22.05ms | 29.16ms | 4.62ms | 61.77ms | 75.91ms | 72.93ms |
| comp_0to1 | 4.64ms | 14.82ms | 16.94ms | 39.07ms | 57.18ms | 19.18ms |
| comp_1to1 | 17.75ms | 19.00ms | 15.26ms | 43.81ms | 57.55ms | 45.55ms |
| comp_2to1 | 10.86ms | 14.67ms | 13.25ms | 31.25ms | 36.00ms | 29.36ms |
| comp_4to1 | 17.39ms | 1.94ms | 13.37ms | 13.97ms | 18.68ms | 12.88ms |
| comp_1000to1 | 4μs | 5μs | 4μs | 2.09ms | 72μs | 15μs |
| comp_1to2 | 6.50ms | 17.02ms | 27.44ms | 31.93ms | 50.69ms | 32.76ms |
| comp_1to4 | 8.69ms | 19.42ms | 20.74ms | 28.16ms | 48.20ms | 17.50ms |
| comp_1to8 | 5.52ms | 7.83ms | 8.11ms | 24.85ms | 48.91ms | 23.01ms |
| comp_1to1000 | 3.54ms | 4.63ms | 6.52ms | 19.44ms | 45.48ms | 15.64ms |
| update_1to1 | 5.57ms | 9.42ms | 8.83ms | 43.44ms | 8.13ms | 27.69ms |
| update_2to1 | 4.68ms | 4.72ms | 4.39ms | 21.30ms | 2.92ms | 14.22ms |
| update_4to1 | 1.09ms | 2.38ms | 2.18ms | 10.80ms | 1.56ms | 7.66ms |
| update_1000to1 | 25μs | 23μs | 22μs | 115μs | 15μs | 66μs |
| update_1to2 | 4.69ms | 4.88ms | 4.36ms | 21.41ms | 4.00ms | 13.99ms |
| update_1to4 | 2.29ms | 2.38ms | 2.19ms | 11.07ms | 1.45ms | 6.81ms |
| update_1to1000 | 44μs | 46μs | 588μs | 216μs | 445μs | 164μs |
| cellx1000 | 7.60ms | 9.66ms | 9.62ms | 167.04ms | 5.63ms | 72.54ms |
| cellx2500 | 21.26ms | 31.15ms | 25.87ms | 524.90ms | 20.74ms | 263.18ms |
| cellx5000 | 47.45ms | 68.87ms | 69.97ms | 1.19s | 67.76ms | 552.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 263.19ms | 500.36ms | 439.57ms | 2.67s (half) | 249.85ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 213.57ms | 276.14ms | 271.65ms | 2.39s (half) | 203.06ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 310.51ms | 3.93s | 3.37s | 4.07s (half) | 344.89ms | 1.77s |
| 1000x5 - 25 sources (wide dense) | 492.91ms | 3.23s | 2.52s | 5.00s (half) | 501.68ms | 3.49s |
| 5x500 - 3 sources (deep) | 229.63ms | 228.50ms | 233.02ms | 1.99s (half) | 238.61ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 293.53ms | 485.28ms | 447.42ms | 2.88s (half) | 265.98ms | 1.73s |
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
