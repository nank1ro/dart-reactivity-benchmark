# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.29 | 3.98s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.15 | 11.38s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.80 | 9.76s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.81 | 3.53s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.25 | 27.56s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.29 | 40.12s | 3.0 |
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
| avoidablePropagation | 188.99ms | 211.64ms | 210.71ms | 2.21s | 166.20ms (fail) | 2.31s |
| broadPropagation | 386.75ms | 461.75ms | 455.34ms | 5.46s | 6.52ms (fail) | 4.37s |
| deepPropagation | 149.65ms | 171.25ms | 174.69ms | 2.01s | 140.53ms (fail) | 1.57s |
| diamond | 238.29ms | 282.84ms | 276.72ms | 3.48s | 193.18ms (fail) | 2.44s |
| mux | 381.10ms | 412.85ms | 383.12ms | 2.08s | 193.39ms (fail) | 1.82s |
| repeatedObservers | 21.48ms | 44.72ms | 40.84ms | 213.68ms | 54.07ms (fail) | 230.91ms |
| triangle | 92.56ms | 106.12ms | 97.69ms | 1.13s | 76.90ms (fail) | 786.63ms |
| unstable | 41.14ms | 77.45ms | 69.71ms | 355.12ms | 336.52ms (fail) | 344.05ms |
| molBench | 491.44ms | 486.54ms | 483.40ms | 1.74s | 889μs | 587.38ms |
| create_signals | 22.36ms | 29.32ms | 4.65ms | 75.35ms | 64.04ms | 67.10ms |
| comp_0to1 | 4.63ms | 14.83ms | 17.16ms | 33.05ms | 55.36ms | 28.10ms |
| comp_1to1 | 19.28ms | 19.00ms | 14.91ms | 49.73ms | 53.20ms | 32.67ms |
| comp_2to1 | 16.56ms | 12.02ms | 21.59ms | 27.97ms | 34.99ms | 23.96ms |
| comp_4to1 | 22.11ms | 2.17ms | 12.58ms | 13.40ms | 17.78ms | 14.05ms |
| comp_1000to1 | 3μs | 6μs | 4μs | 2.15ms | 48μs | 15μs |
| comp_1to2 | 11.39ms | 19.91ms | 28.30ms | 33.13ms | 48.76ms | 32.60ms |
| comp_1to4 | 11.30ms | 10.13ms | 21.49ms | 27.59ms | 45.17ms | 20.86ms |
| comp_1to8 | 4.83ms | 6.99ms | 11.57ms | 23.94ms | 44.42ms | 23.24ms |
| comp_1to1000 | 3.45ms | 4.74ms | 6.52ms | 18.93ms | 40.29ms | 15.01ms |
| update_1to1 | 3.70ms | 9.51ms | 8.87ms | 43.14ms | 7.27ms | 27.55ms |
| update_2to1 | 4.66ms | 4.67ms | 4.39ms | 21.39ms | 2.90ms | 13.80ms |
| update_4to1 | 944μs | 2.34ms | 2.22ms | 10.89ms | 1.59ms | 7.42ms |
| update_1000to1 | 9μs | 23μs | 21μs | 116μs | 15μs | 69μs |
| update_1to2 | 4.89ms | 4.74ms | 4.37ms | 21.41ms | 3.67ms | 14.17ms |
| update_1to4 | 2.30ms | 2.36ms | 2.21ms | 10.98ms | 1.47ms | 6.96ms |
| update_1to1000 | 59μs | 46μs | 49μs | 211μs | 402μs | 163μs |
| cellx1000 | 7.64ms | 9.91ms | 10.26ms | 174.87ms | 6.69ms | 82.01ms |
| cellx2500 | 23.77ms | 33.73ms | 29.26ms | 519.85ms | 25.71ms | 272.34ms |
| cellx5000 | 54.63ms | 87.06ms | 80.49ms | 1.17s | 80.82ms | 594.50ms |
| 10x5 - 2 sources - read 20.0% (simple) | 255.60ms | 510.37ms | 427.30ms | 2.67s (half) | 249.55ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 212.13ms | 294.84ms | 277.11ms | 2.37s (half) | 206.77ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 294.75ms | 3.86s | 3.40s | 4.34s (half) | 353.80ms | 1.89s |
| 1000x5 - 25 sources (wide dense) | 504.31ms | 3.47s | 2.50s | 4.97s (half) | 521.51ms | 3.52s |
| 5x500 - 3 sources (deep) | 227.95ms | 233.61ms | 229.84ms | 2.02s (half) | 234.87ms | 1.18s |
| 100x15 - 6 sources - dynamic (very dynamic) | 274.38ms | 480.41ms | 456.21ms | 2.79s (half) | 264.22ms | 1.69s |
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
