# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.31 | 3.96s | 0.0 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 22.92 | 9.74s | 0.0 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 22.24 | 11.36s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.96 | 3.48s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.34 | 27.20s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.38 | 39.55s | 3.0 |
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
| avoidablePropagation | 193.32ms | 209.90ms | 208.60ms | 2.20s | 160.66ms (fail) | 2.32s |
| broadPropagation | 388.01ms | 455.91ms | 456.15ms | 5.48s | 7.12ms (fail) | 4.35s |
| deepPropagation | 152.34ms | 169.61ms | 171.90ms | 2.05s | 145.98ms (fail) | 1.54s |
| diamond | 245.58ms | 281.12ms | 276.16ms | 3.48s | 191.51ms (fail) | 2.42s |
| mux | 378.75ms | 408.00ms | 384.21ms | 2.05s | 190.18ms (fail) | 1.81s |
| repeatedObservers | 21.90ms | 45.15ms | 40.70ms | 213.61ms | 53.61ms (fail) | 241.67ms |
| triangle | 93.38ms | 100.69ms | 99.84ms | 1.15s | 79.22ms (fail) | 773.76ms |
| unstable | 42.04ms | 77.58ms | 69.32ms | 343.72ms | 339.17ms (fail) | 350.73ms |
| molBench | 491.18ms | 485.50ms | 483.77ms | 1.75s | 1.01ms | 588.74ms |
| create_signals | 21.46ms | 28.85ms | 4.69ms | 67.63ms | 67.31ms | 59.99ms |
| comp_0to1 | 4.51ms | 14.84ms | 16.85ms | 32.28ms | 49.53ms | 33.45ms |
| comp_1to1 | 17.20ms | 17.84ms | 15.58ms | 44.66ms | 51.19ms | 31.67ms |
| comp_2to1 | 18.65ms | 13.58ms | 15.53ms | 23.66ms | 33.11ms | 22.75ms |
| comp_4to1 | 17.15ms | 4.62ms | 10.79ms | 19.17ms | 17.12ms | 19.68ms |
| comp_1000to1 | 3μs | 5μs | 7μs | 2.07ms | 50μs | 15μs |
| comp_1to2 | 6.72ms | 16.82ms | 21.02ms | 31.41ms | 46.47ms | 33.83ms |
| comp_1to4 | 11.37ms | 10.03ms | 24.02ms | 29.07ms | 43.07ms | 18.41ms |
| comp_1to8 | 5.74ms | 6.44ms | 5.40ms | 23.08ms | 43.25ms | 20.16ms |
| comp_1to1000 | 3.58ms | 4.58ms | 3.48ms | 18.62ms | 39.87ms | 15.42ms |
| update_1to1 | 3.62ms | 9.92ms | 8.74ms | 43.70ms | 6.34ms | 27.45ms |
| update_2to1 | 4.84ms | 4.67ms | 4.35ms | 22.30ms | 2.90ms | 13.45ms |
| update_4to1 | 911μs | 2.35ms | 2.19ms | 10.93ms | 2.49ms | 7.46ms |
| update_1000to1 | 9μs | 23μs | 22μs | 117μs | 14μs | 81μs |
| update_1to2 | 4.71ms | 4.73ms | 4.36ms | 21.86ms | 3.89ms | 13.37ms |
| update_1to4 | 2.33ms | 2.37ms | 2.18ms | 11.03ms | 1.48ms | 7.01ms |
| update_1to1000 | 46μs | 44μs | 36μs | 237μs | 399μs | 166μs |
| cellx1000 | 7.41ms | 9.56ms | 9.65ms | 153.29ms | 5.33ms | 70.53ms |
| cellx2500 | 19.72ms | 30.40ms | 25.25ms | 453.68ms | 18.77ms | 264.60ms |
| cellx5000 | 42.29ms | 60.00ms | 64.69ms | 1.04s | 57.98ms | 545.65ms |
| 10x5 - 2 sources - read 20.0% (simple) | 260.31ms | 512.33ms | 439.92ms | 2.64s (half) | 253.77ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 213.16ms | 279.88ms | 279.30ms | 2.38s (half) | 204.87ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 294.44ms | 3.89s | 3.38s | 4.03s (half) | 344.51ms | 1.80s |
| 1000x5 - 25 sources (wide dense) | 492.73ms | 3.50s | 2.52s | 4.95s (half) | 518.30ms | 3.51s |
| 5x500 - 3 sources (deep) | 222.54ms | 230.71ms | 231.11ms | 2.01s (half) | 231.67ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 281.27ms | 474.56ms | 458.66ms | 2.77s (half) | 265.02ms | 1.68s |
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
