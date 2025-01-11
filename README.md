# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.61 | 4.15s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 23.88 | 11.22s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 23.24 | 9.75s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.38 | 3.58s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.83 | 27.50s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.68 | 40.35s | 3.0 |
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
| avoidablePropagation | 199.46ms | 208.03ms | 210.48ms | 2.24s | 157.50ms (fail) | 2.32s |
| broadPropagation | 415.79ms | 468.41ms | 454.10ms | 5.53s | 6.68ms (fail) | 4.40s |
| deepPropagation | 160.07ms | 177.07ms | 176.78ms | 2.03s | 139.15ms (fail) | 1.56s |
| diamond | 269.57ms | 291.36ms | 276.64ms | 3.50s | 212.79ms (fail) | 2.41s |
| mux | 393.96ms | 409.75ms | 388.59ms | 2.04s | 195.59ms (fail) | 1.80s |
| repeatedObservers | 37.31ms | 45.17ms | 41.63ms | 215.29ms | 53.45ms (fail) | 235.77ms |
| triangle | 102.82ms | 101.49ms | 97.39ms | 1.15s | 80.54ms (fail) | 764.75ms |
| unstable | 89.15ms | 77.30ms | 69.00ms | 348.76ms | 340.82ms (fail) | 345.33ms |
| molBench | 494.50ms | 486.41ms | 484.30ms | 1.75s | 930μs | 590.25ms |
| create_signals | 22.24ms | 31.19ms | 4.91ms | 62.51ms | 73.69ms | 82.99ms |
| comp_0to1 | 4.91ms | 15.58ms | 17.45ms | 46.99ms | 52.25ms | 19.02ms |
| comp_1to1 | 17.52ms | 23.15ms | 17.61ms | 44.46ms | 59.56ms | 27.66ms |
| comp_2to1 | 11.96ms | 14.23ms | 16.77ms | 25.79ms | 36.37ms | 24.04ms |
| comp_4to1 | 16.65ms | 3.56ms | 8.48ms | 13.26ms | 18.25ms | 15.33ms |
| comp_1000to1 | 4μs | 5μs | 8μs | 2.50ms | 84μs | 20μs |
| comp_1to2 | 10.25ms | 17.60ms | 22.75ms | 31.79ms | 50.15ms | 38.81ms |
| comp_1to4 | 10.45ms | 10.03ms | 27.91ms | 29.03ms | 45.77ms | 20.37ms |
| comp_1to8 | 5.53ms | 6.69ms | 5.57ms | 25.66ms | 45.07ms | 21.92ms |
| comp_1to1000 | 3.38ms | 4.62ms | 6.50ms | 19.34ms | 42.33ms | 15.97ms |
| update_1to1 | 9.04ms | 9.38ms | 8.74ms | 43.87ms | 7.95ms | 27.74ms |
| update_2to1 | 1.93ms | 4.69ms | 4.36ms | 21.53ms | 2.91ms | 13.63ms |
| update_4to1 | 1.25ms | 2.37ms | 2.20ms | 10.91ms | 2.10ms | 7.14ms |
| update_1000to1 | 23μs | 23μs | 21μs | 116μs | 15μs | 72μs |
| update_1to2 | 4.98ms | 5.91ms | 4.36ms | 22.79ms | 3.93ms | 14.02ms |
| update_1to4 | 2.43ms | 2.37ms | 2.21ms | 11.08ms | 1.49ms | 7.21ms |
| update_1to1000 | 30μs | 46μs | 1.15ms | 224μs | 411μs | 166μs |
| cellx1000 | 8.02ms | 9.65ms | 10.06ms | 196.07ms | 5.71ms | 81.83ms |
| cellx2500 | 23.49ms | 32.24ms | 30.70ms | 582.10ms | 23.37ms | 295.48ms |
| cellx5000 | 55.00ms | 64.74ms | 92.63ms | 1.26s | 85.51ms | 625.38ms |
| 10x5 - 2 sources - read 20.0% (simple) | 258.81ms | 502.01ms | 422.66ms | 2.68s (half) | 247.69ms | 1.98s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 213.61ms | 274.69ms | 283.80ms | 2.40s (half) | 208.13ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 293.18ms | 3.70s | 3.36s | 4.20s (half) | 354.11ms | 1.86s |
| 1000x5 - 25 sources (wide dense) | 495.42ms | 3.50s | 2.52s | 4.95s (half) | 523.15ms | 3.52s |
| 5x500 - 3 sources (deep) | 231.26ms | 231.00ms | 228.36ms | 2.07s (half) | 233.67ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 283.21ms | 490.15ms | 449.59ms | 2.80s (half) | 268.66ms | 1.72s |
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
