# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 29.91 | 3.97s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.81 | 11.18s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.81 | 9.75s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.81 | 3.59s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.03 | 27.50s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.07 | 39.79s | 3.0 |
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
| avoidablePropagation | 197.47ms | 206.96ms | 208.71ms | 2.20s | 176.51ms (fail) | 2.34s |
| broadPropagation | 383.06ms | 456.89ms | 470.06ms | 5.50s | 6.49ms (fail) | 4.36s |
| deepPropagation | 151.56ms | 174.85ms | 171.76ms | 2.01s | 143.33ms (fail) | 1.56s |
| diamond | 228.39ms | 289.14ms | 276.12ms | 3.48s | 201.18ms (fail) | 2.44s |
| mux | 379.34ms | 412.62ms | 388.65ms | 2.08s | 196.70ms (fail) | 1.85s |
| repeatedObservers | 21.59ms | 44.50ms | 41.06ms | 213.09ms | 53.49ms (fail) | 240.59ms |
| triangle | 96.98ms | 101.30ms | 99.03ms | 1.13s | 81.17ms (fail) | 774.12ms |
| unstable | 41.43ms | 77.10ms | 69.81ms | 347.29ms | 372.51ms (fail) | 348.31ms |
| molBench | 491.01ms | 485.84ms | 483.74ms | 1.76s | 921μs | 593.63ms |
| create_signals | 21.55ms | 28.14ms | 4.67ms | 67.41ms | 63.07ms | 73.86ms |
| comp_0to1 | 4.43ms | 13.25ms | 17.16ms | 34.49ms | 54.43ms | 15.63ms |
| comp_1to1 | 18.52ms | 18.26ms | 16.13ms | 46.00ms | 52.22ms | 42.98ms |
| comp_2to1 | 13.85ms | 10.98ms | 16.76ms | 32.72ms | 33.23ms | 21.95ms |
| comp_4to1 | 16.37ms | 1.96ms | 11.72ms | 17.51ms | 17.35ms | 17.95ms |
| comp_1000to1 | 3μs | 5μs | 6μs | 2.24ms | 80μs | 21μs |
| comp_1to2 | 10.01ms | 18.39ms | 15.27ms | 28.56ms | 48.98ms | 34.02ms |
| comp_1to4 | 11.25ms | 7.18ms | 25.45ms | 29.36ms | 43.64ms | 19.22ms |
| comp_1to8 | 8.21ms | 6.99ms | 6.67ms | 25.85ms | 43.56ms | 22.99ms |
| comp_1to1000 | 3.34ms | 4.50ms | 4.54ms | 21.02ms | 40.85ms | 15.61ms |
| update_1to1 | 3.66ms | 9.34ms | 8.75ms | 43.32ms | 8.21ms | 27.99ms |
| update_2to1 | 4.83ms | 4.67ms | 4.37ms | 21.30ms | 2.89ms | 14.02ms |
| update_4to1 | 1.19ms | 2.33ms | 2.21ms | 10.82ms | 2.13ms | 7.46ms |
| update_1000to1 | 9μs | 23μs | 21μs | 115μs | 14μs | 69μs |
| update_1to2 | 4.96ms | 4.72ms | 4.35ms | 21.38ms | 3.02ms | 14.10ms |
| update_1to4 | 2.40ms | 2.36ms | 2.21ms | 10.94ms | 1.51ms | 6.99ms |
| update_1to1000 | 48μs | 46μs | 151μs | 250μs | 404μs | 177μs |
| cellx1000 | 7.55ms | 9.71ms | 9.53ms | 152.74ms | 5.42ms | 70.86ms |
| cellx2500 | 20.35ms | 30.87ms | 25.91ms | 479.08ms | 20.45ms | 251.41ms |
| cellx5000 | 46.10ms | 59.05ms | 69.06ms | 1.09s | 59.50ms | 548.18ms |
| 10x5 - 2 sources - read 20.0% (simple) | 257.00ms | 510.76ms | 426.33ms | 2.66s (half) | 253.19ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 210.10ms | 275.98ms | 271.86ms | 2.39s (half) | 211.19ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 297.68ms | 3.69s | 3.41s | 4.12s (half) | 366.33ms | 1.88s |
| 1000x5 - 25 sources (wide dense) | 497.82ms | 3.51s | 2.51s | 4.97s (half) | 522.79ms | 3.57s |
| 5x500 - 3 sources (deep) | 230.58ms | 230.21ms | 229.09ms | 2.00s (half) | 235.41ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 282.79ms | 479.70ms | 452.83ms | 2.79s (half) | 272.13ms | 1.71s |
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
