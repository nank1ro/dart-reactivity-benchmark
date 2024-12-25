# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 31.09 | 4.01s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.75 | 11.19s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.73 | 9.78s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.80 | 3.51s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.38 | 27.24s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.19 | 39.48s | 3.0 |
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
| avoidablePropagation | 202.52ms | 215.26ms | 204.97ms | 2.20s | 177.61ms (fail) | 2.34s |
| broadPropagation | 396.02ms | 457.48ms | 459.77ms | 5.47s | 6.58ms (fail) | 4.32s |
| deepPropagation | 152.60ms | 173.96ms | 171.00ms | 2.02s | 139.62ms (fail) | 1.53s |
| diamond | 240.41ms | 287.64ms | 275.29ms | 3.46s | 193.96ms (fail) | 2.44s |
| mux | 379.97ms | 408.36ms | 390.94ms | 2.03s | 194.05ms (fail) | 1.78s |
| repeatedObservers | 21.80ms | 44.63ms | 40.77ms | 213.05ms | 53.48ms (fail) | 241.73ms |
| triangle | 101.57ms | 101.84ms | 99.55ms | 1.14s | 76.83ms (fail) | 768.52ms |
| unstable | 41.08ms | 80.39ms | 68.31ms | 350.05ms | 343.70ms (fail) | 350.89ms |
| molBench | 492.83ms | 486.04ms | 483.51ms | 1.74s | 862μs | 587.35ms |
| create_signals | 21.74ms | 30.80ms | 4.76ms | 64.74ms | 69.98ms | 58.72ms |
| comp_0to1 | 4.64ms | 13.37ms | 16.89ms | 32.30ms | 53.78ms | 21.38ms |
| comp_1to1 | 17.48ms | 17.90ms | 14.09ms | 46.11ms | 52.52ms | 31.55ms |
| comp_2to1 | 11.73ms | 12.38ms | 19.17ms | 37.08ms | 33.79ms | 22.77ms |
| comp_4to1 | 21.54ms | 4.99ms | 10.86ms | 22.46ms | 17.70ms | 24.22ms |
| comp_1000to1 | 3μs | 5μs | 6μs | 2.26ms | 48μs | 15μs |
| comp_1to2 | 6.71ms | 14.70ms | 24.63ms | 27.82ms | 48.57ms | 32.78ms |
| comp_1to4 | 8.88ms | 7.33ms | 28.77ms | 29.64ms | 43.47ms | 17.89ms |
| comp_1to8 | 5.59ms | 7.09ms | 7.03ms | 24.12ms | 45.71ms | 19.65ms |
| comp_1to1000 | 3.48ms | 4.59ms | 6.97ms | 18.93ms | 40.16ms | 18.05ms |
| update_1to1 | 6.08ms | 9.35ms | 8.84ms | 42.73ms | 8.28ms | 28.23ms |
| update_2to1 | 4.71ms | 4.66ms | 4.35ms | 21.67ms | 8.49ms | 13.86ms |
| update_4to1 | 2.25ms | 2.36ms | 2.22ms | 10.75ms | 1.56ms | 7.24ms |
| update_1000to1 | 9μs | 23μs | 21μs | 115μs | 15μs | 71μs |
| update_1to2 | 4.61ms | 4.72ms | 4.44ms | 21.44ms | 3.83ms | 14.08ms |
| update_1to4 | 973μs | 3.98ms | 2.23ms | 10.94ms | 1.50ms | 6.77ms |
| update_1to1000 | 43μs | 46μs | 966μs | 232μs | 414μs | 178μs |
| cellx1000 | 7.55ms | 9.69ms | 9.54ms | 165.46ms | 5.34ms | 69.39ms |
| cellx2500 | 20.16ms | 31.88ms | 26.34ms | 508.01ms | 20.03ms | 246.25ms |
| cellx5000 | 43.49ms | 64.82ms | 69.41ms | 1.09s | 59.39ms | 552.56ms |
| 10x5 - 2 sources - read 20.0% (simple) | 261.44ms | 507.91ms | 430.68ms | 2.65s (half) | 258.44ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 217.61ms | 280.40ms | 271.76ms | 2.32s (half) | 205.85ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 298.12ms | 3.68s | 3.44s | 4.08s (half) | 342.40ms | 1.80s |
| 1000x5 - 25 sources (wide dense) | 506.26ms | 3.52s | 2.50s | 4.89s (half) | 510.75ms | 3.52s |
| 5x500 - 3 sources (deep) | 227.62ms | 230.46ms | 230.14ms | 1.98s (half) | 232.67ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 279.64ms | 474.65ms | 447.12ms | 2.76s (half) | 262.86ms | 1.70s |
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
