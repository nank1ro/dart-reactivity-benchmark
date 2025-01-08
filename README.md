# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.87 | 3.97s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.44 | 11.00s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.75 | 9.74s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 14.69 | 3.54s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.02 | 27.38s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.28 | 39.73s | 3.0 |
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
| avoidablePropagation | 193.05ms | 211.23ms | 201.49ms | 2.24s | 156.91ms (fail) | 2.33s |
| broadPropagation | 387.11ms | 465.63ms | 455.17ms | 5.55s | 6.14ms (fail) | 4.31s |
| deepPropagation | 151.56ms | 168.85ms | 173.80ms | 2.02s | 140.12ms (fail) | 1.55s |
| diamond | 234.22ms | 284.17ms | 271.83ms | 3.51s | 208.01ms (fail) | 2.41s |
| mux | 375.57ms | 411.00ms | 389.50ms | 2.07s | 196.26ms (fail) | 1.82s |
| repeatedObservers | 21.65ms | 44.60ms | 41.29ms | 213.61ms | 53.87ms (fail) | 236.85ms |
| triangle | 94.18ms | 101.46ms | 98.16ms | 1.13s | 80.83ms (fail) | 774.35ms |
| unstable | 40.47ms | 77.76ms | 70.18ms | 342.85ms | 336.95ms (fail) | 345.83ms |
| molBench | 484.81ms | 487.06ms | 484.35ms | 1.75s | 963μs | 585.28ms |
| create_signals | 21.54ms | 29.11ms | 4.68ms | 83.74ms | 64.61ms | 74.84ms |
| comp_0to1 | 4.55ms | 14.69ms | 17.12ms | 32.15ms | 55.16ms | 16.06ms |
| comp_1to1 | 17.16ms | 27.62ms | 16.30ms | 48.17ms | 53.41ms | 38.78ms |
| comp_2to1 | 18.62ms | 7.97ms | 15.61ms | 20.85ms | 34.67ms | 32.32ms |
| comp_4to1 | 5.36ms | 3.82ms | 11.02ms | 17.57ms | 17.90ms | 23.18ms |
| comp_1000to1 | 5μs | 5μs | 4μs | 2.67ms | 44μs | 17μs |
| comp_1to2 | 13.79ms | 17.25ms | 16.86ms | 37.37ms | 46.30ms | 38.05ms |
| comp_1to4 | 13.37ms | 9.75ms | 22.02ms | 29.65ms | 43.60ms | 19.38ms |
| comp_1to8 | 7.19ms | 6.43ms | 7.02ms | 24.96ms | 43.98ms | 23.65ms |
| comp_1to1000 | 4.19ms | 4.69ms | 5.46ms | 19.24ms | 40.36ms | 15.33ms |
| update_1to1 | 3.96ms | 9.37ms | 8.76ms | 43.50ms | 10.77ms | 28.13ms |
| update_2to1 | 5.25ms | 4.66ms | 4.36ms | 21.54ms | 2.89ms | 13.91ms |
| update_4to1 | 1.01ms | 2.38ms | 2.20ms | 10.73ms | 2.09ms | 7.25ms |
| update_1000to1 | 9μs | 23μs | 21μs | 117μs | 15μs | 66μs |
| update_1to2 | 1.90ms | 4.73ms | 4.37ms | 21.60ms | 3.31ms | 13.96ms |
| update_1to4 | 984μs | 2.37ms | 2.28ms | 11.03ms | 1.48ms | 8.16ms |
| update_1to1000 | 46μs | 45μs | 796μs | 216μs | 391μs | 167μs |
| cellx1000 | 7.41ms | 9.64ms | 9.64ms | 164.04ms | 5.66ms | 80.59ms |
| cellx2500 | 20.11ms | 31.32ms | 26.08ms | 471.17ms | 26.29ms | 279.11ms |
| cellx5000 | 43.33ms | 64.14ms | 66.95ms | 1.06s | 73.75ms | 583.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 261.67ms | 509.27ms | 435.51ms | 2.64s (half) | 252.40ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 220.61ms | 282.15ms | 273.17ms | 2.40s (half) | 206.10ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 302.69ms | 3.64s | 3.39s | 4.05s (half) | 352.89ms | 1.86s |
| 1000x5 - 25 sources (wide dense) | 505.56ms | 3.35s | 2.53s | 4.90s (half) | 521.75ms | 3.48s |
| 5x500 - 3 sources (deep) | 222.07ms | 228.58ms | 229.67ms | 2.00s (half) | 235.70ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 283.73ms | 483.69ms | 449.45ms | 2.79s (half) | 266.17ms | 1.71s |
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
