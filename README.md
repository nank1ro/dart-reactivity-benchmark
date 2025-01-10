# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 29.87 | 4.13s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.96 | 11.09s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 22.53 | 9.70s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.86 | 3.54s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.38 | 27.55s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.31 | 39.91s | 3.0 |
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
| avoidablePropagation | 208.35ms | 211.20ms | 209.89ms | 2.19s | 154.32ms (fail) | 2.33s |
| broadPropagation | 421.28ms | 464.21ms | 457.80ms | 5.49s | 6.54ms (fail) | 4.39s |
| deepPropagation | 157.63ms | 173.50ms | 170.25ms | 2.03s | 138.40ms (fail) | 1.56s |
| diamond | 267.75ms | 283.77ms | 275.22ms | 3.45s | 193.50ms (fail) | 2.47s |
| mux | 394.26ms | 412.83ms | 384.45ms | 2.06s | 209.34ms (fail) | 1.83s |
| repeatedObservers | 37.43ms | 45.07ms | 41.36ms | 213.84ms | 53.97ms (fail) | 234.66ms |
| triangle | 101.73ms | 101.73ms | 99.58ms | 1.16s | 78.29ms (fail) | 779.18ms |
| unstable | 90.34ms | 77.17ms | 71.83ms | 349.06ms | 335.55ms (fail) | 351.87ms |
| molBench | 494.74ms | 485.65ms | 485.42ms | 1.76s | 938μs | 588.94ms |
| create_signals | 21.06ms | 30.56ms | 4.86ms | 75.38ms | 63.86ms | 65.29ms |
| comp_0to1 | 4.50ms | 15.23ms | 17.40ms | 38.07ms | 54.58ms | 20.29ms |
| comp_1to1 | 17.09ms | 29.98ms | 15.97ms | 43.86ms | 56.38ms | 31.67ms |
| comp_2to1 | 17.17ms | 8.47ms | 18.45ms | 30.45ms | 35.01ms | 21.78ms |
| comp_4to1 | 16.36ms | 2.16ms | 11.90ms | 13.33ms | 17.79ms | 16.57ms |
| comp_1000to1 | 3μs | 5μs | 8μs | 2.17ms | 46μs | 33μs |
| comp_1to2 | 7.78ms | 21.32ms | 22.34ms | 31.59ms | 45.58ms | 34.08ms |
| comp_1to4 | 7.67ms | 10.54ms | 28.51ms | 29.33ms | 43.29ms | 18.68ms |
| comp_1to8 | 9.62ms | 6.83ms | 5.40ms | 24.56ms | 43.07ms | 20.59ms |
| comp_1to1000 | 3.80ms | 4.80ms | 6.05ms | 19.13ms | 39.68ms | 15.52ms |
| update_1to1 | 6.94ms | 9.35ms | 8.76ms | 43.81ms | 9.07ms | 27.64ms |
| update_2to1 | 1.99ms | 4.72ms | 4.53ms | 22.11ms | 2.88ms | 15.06ms |
| update_4to1 | 1.02ms | 2.36ms | 2.23ms | 10.82ms | 1.78ms | 7.42ms |
| update_1000to1 | 22μs | 23μs | 22μs | 116μs | 14μs | 66μs |
| update_1to2 | 4.86ms | 4.73ms | 4.40ms | 21.44ms | 5.25ms | 13.94ms |
| update_1to4 | 2.38ms | 2.37ms | 2.20ms | 11.03ms | 1.46ms | 6.25ms |
| update_1to1000 | 48μs | 47μs | 948μs | 215μs | 400μs | 164μs |
| cellx1000 | 8.00ms | 10.78ms | 9.55ms | 163.18ms | 5.50ms | 75.41ms |
| cellx2500 | 23.05ms | 47.45ms | 27.49ms | 532.19ms | 23.19ms | 273.58ms |
| cellx5000 | 51.38ms | 96.88ms | 79.90ms | 1.21s | 69.88ms | 589.69ms |
| 10x5 - 2 sources - read 20.0% (simple) | 244.25ms | 506.20ms | 419.93ms | 2.66s (half) | 252.13ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 206.37ms | 276.79ms | 278.34ms | 2.38s (half) | 207.65ms | 1.55s |
| 1000x12 - 4 sources - dynamic (large) | 302.37ms | 3.66s | 3.34s | 4.08s (half) | 349.04ms | 1.83s |
| 1000x5 - 25 sources (wide dense) | 485.12ms | 3.38s | 2.51s | 4.95s (half) | 540.72ms | 3.50s |
| 5x500 - 3 sources (deep) | 231.41ms | 231.89ms | 231.10ms | 2.01s (half) | 235.10ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 282.16ms | 480.60ms | 449.67ms | 2.80s (half) | 266.23ms | 1.71s |
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
