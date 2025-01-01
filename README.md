# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.82 | 3.93s | 0.0 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 22.76 | 9.75s | 0.0 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 21.19 | 11.31s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.89 | 3.53s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.45 | 27.30s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.50 | 39.47s | 3.0 |
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
| avoidablePropagation | 193.59ms | 212.54ms | 211.22ms | 2.20s | 173.10ms (fail) | 2.34s |
| broadPropagation | 386.30ms | 456.21ms | 456.62ms | 5.51s | 6.21ms (fail) | 4.33s |
| deepPropagation | 151.34ms | 173.51ms | 173.92ms | 2.02s | 139.74ms (fail) | 1.56s |
| diamond | 227.50ms | 284.09ms | 274.31ms | 3.48s | 200.45ms (fail) | 2.46s |
| mux | 375.32ms | 413.87ms | 387.75ms | 2.07s | 197.01ms (fail) | 1.81s |
| repeatedObservers | 21.42ms | 44.72ms | 41.19ms | 209.13ms | 53.47ms (fail) | 245.70ms |
| triangle | 92.68ms | 102.52ms | 101.75ms | 1.14s | 78.31ms (fail) | 781.38ms |
| unstable | 41.14ms | 77.21ms | 69.74ms | 342.11ms | 337.37ms (fail) | 350.20ms |
| molBench | 491.33ms | 486.71ms | 483.49ms | 1.75s | 886μs | 593.49ms |
| create_signals | 22.04ms | 30.78ms | 4.71ms | 67.87ms | 71.23ms | 66.01ms |
| comp_0to1 | 4.55ms | 13.07ms | 17.06ms | 35.53ms | 49.92ms | 28.32ms |
| comp_1to1 | 17.42ms | 33.51ms | 14.96ms | 45.26ms | 53.34ms | 31.83ms |
| comp_2to1 | 16.49ms | 12.65ms | 18.02ms | 29.34ms | 38.66ms | 23.34ms |
| comp_4to1 | 16.86ms | 6.62ms | 12.08ms | 13.45ms | 17.93ms | 13.38ms |
| comp_1000to1 | 3μs | 5μs | 4μs | 2.17ms | 52μs | 15μs |
| comp_1to2 | 6.62ms | 14.57ms | 35.00ms | 26.66ms | 46.83ms | 37.80ms |
| comp_1to4 | 8.82ms | 19.10ms | 23.71ms | 27.77ms | 45.37ms | 19.70ms |
| comp_1to8 | 5.58ms | 6.80ms | 4.71ms | 24.18ms | 43.74ms | 23.67ms |
| comp_1to1000 | 3.55ms | 4.74ms | 3.67ms | 19.38ms | 40.03ms | 15.30ms |
| update_1to1 | 4.30ms | 9.39ms | 8.72ms | 43.71ms | 8.22ms | 27.73ms |
| update_2to1 | 4.66ms | 4.71ms | 4.35ms | 21.43ms | 2.93ms | 13.47ms |
| update_4to1 | 941μs | 2.37ms | 2.20ms | 10.87ms | 1.99ms | 7.31ms |
| update_1000to1 | 9μs | 23μs | 21μs | 118μs | 15μs | 61μs |
| update_1to2 | 4.77ms | 4.73ms | 4.37ms | 21.52ms | 4.00ms | 14.26ms |
| update_1to4 | 2.29ms | 2.37ms | 2.21ms | 11.04ms | 1.45ms | 6.90ms |
| update_1to1000 | 44μs | 50μs | 60μs | 217μs | 420μs | 163μs |
| cellx1000 | 7.57ms | 9.80ms | 9.50ms | 157.19ms | 5.25ms | 73.86ms |
| cellx2500 | 20.48ms | 32.06ms | 26.30ms | 483.94ms | 20.05ms | 253.31ms |
| cellx5000 | 43.77ms | 63.78ms | 63.98ms | 1.09s | 61.70ms | 563.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 252.30ms | 502.04ms | 428.19ms | 2.62s (half) | 252.92ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 207.02ms | 285.40ms | 281.92ms | 2.37s (half) | 209.22ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 298.44ms | 3.91s | 3.38s | 4.00s (half) | 348.81ms | 1.77s |
| 1000x5 - 25 sources (wide dense) | 493.70ms | 3.37s | 2.51s | 4.86s (half) | 518.37ms | 3.50s |
| 5x500 - 3 sources (deep) | 227.09ms | 231.73ms | 226.83ms | 2.02s (half) | 235.82ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 275.58ms | 487.83ms | 460.88ms | 2.74s (half) | 266.33ms | 1.70s |
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
