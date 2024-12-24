# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.94 | 3.98s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.79 | 11.20s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.47 | 9.78s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.23 | 3.51s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.59 | 27.41s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.26 | 40.07s | 3.0 |
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
| avoidablePropagation | 201.47ms | 207.87ms | 212.47ms | 2.22s | 168.66ms (fail) | 2.32s |
| broadPropagation | 395.51ms | 460.30ms | 455.78ms | 5.53s | 6.24ms (fail) | 4.39s |
| deepPropagation | 154.29ms | 175.62ms | 174.67ms | 2.03s | 139.54ms (fail) | 1.55s |
| diamond | 240.88ms | 286.29ms | 274.08ms | 3.50s | 191.40ms (fail) | 2.44s |
| mux | 378.18ms | 413.80ms | 387.91ms | 2.07s | 194.40ms (fail) | 1.80s |
| repeatedObservers | 21.86ms | 44.93ms | 42.10ms | 219.15ms | 55.80ms (fail) | 240.41ms |
| triangle | 93.44ms | 102.55ms | 98.20ms | 1.15s | 78.42ms (fail) | 777.29ms |
| unstable | 41.20ms | 77.99ms | 69.03ms | 341.75ms | 342.11ms (fail) | 352.65ms |
| molBench | 481.45ms | 485.96ms | 483.62ms | 1.75s | 898μs | 589.01ms |
| create_signals | 21.60ms | 29.00ms | 4.70ms | 60.96ms | 68.51ms | 75.16ms |
| comp_0to1 | 4.43ms | 14.67ms | 17.20ms | 43.84ms | 54.39ms | 15.50ms |
| comp_1to1 | 17.27ms | 20.65ms | 18.96ms | 41.61ms | 52.80ms | 51.58ms |
| comp_2to1 | 15.76ms | 8.33ms | 16.67ms | 27.99ms | 33.55ms | 22.90ms |
| comp_4to1 | 16.61ms | 2.11ms | 10.81ms | 13.67ms | 17.50ms | 23.83ms |
| comp_1000to1 | 4μs | 6μs | 6μs | 2.09ms | 46μs | 15μs |
| comp_1to2 | 12.13ms | 15.91ms | 23.32ms | 41.43ms | 46.13ms | 35.47ms |
| comp_1to4 | 16.92ms | 13.27ms | 28.88ms | 28.89ms | 43.61ms | 17.58ms |
| comp_1to8 | 5.82ms | 6.65ms | 5.14ms | 24.75ms | 45.47ms | 20.25ms |
| comp_1to1000 | 3.48ms | 4.58ms | 5.60ms | 19.06ms | 40.43ms | 15.98ms |
| update_1to1 | 7.67ms | 9.39ms | 8.81ms | 43.41ms | 7.50ms | 24.64ms |
| update_2to1 | 1.90ms | 4.68ms | 4.43ms | 21.35ms | 4.65ms | 10.87ms |
| update_4to1 | 2.27ms | 2.35ms | 2.21ms | 10.79ms | 2.98ms | 6.36ms |
| update_1000to1 | 9μs | 23μs | 21μs | 117μs | 15μs | 57μs |
| update_1to2 | 1.96ms | 4.72ms | 4.36ms | 21.43ms | 3.19ms | 11.71ms |
| update_1to4 | 972μs | 2.33ms | 2.21ms | 11.03ms | 1.81ms | 5.87ms |
| update_1to1000 | 42μs | 45μs | 762μs | 240μs | 411μs | 171μs |
| cellx1000 | 7.55ms | 10.03ms | 9.71ms | 181.26ms | 5.31ms | 72.00ms |
| cellx2500 | 22.07ms | 31.47ms | 26.98ms | 568.75ms | 19.87ms | 276.26ms |
| cellx5000 | 45.62ms | 66.53ms | 80.19ms | 1.17s | 58.65ms | 574.02ms |
| 10x5 - 2 sources - read 20.0% (simple) | 268.26ms | 500.19ms | 422.09ms | 2.63s (half) | 242.89ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 211.86ms | 276.71ms | 273.38ms | 2.39s (half) | 206.56ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 294.39ms | 3.72s | 3.42s | 4.07s (half) | 347.82ms | 1.84s |
| 1000x5 - 25 sources (wide dense) | 493.43ms | 3.50s | 2.52s | 5.01s (half) | 524.20ms | 3.50s |
| 5x500 - 3 sources (deep) | 228.38ms | 230.24ms | 225.27ms | 2.02s (half) | 234.64ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 274.02ms | 477.52ms | 446.32ms | 2.79s (half) | 267.72ms | 1.69s |
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
