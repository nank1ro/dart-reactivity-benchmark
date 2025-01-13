# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.24 | 4.19s | 0.0 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 23.25 | 10.18s | 0.0 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 22.94 | 11.18s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.96 | 3.49s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.65 | 27.80s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.77 | 39.68s | 3.0 |
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
| avoidablePropagation | 191.79ms | 208.15ms | 206.88ms | 2.20s | 159.84ms (fail) | 2.32s |
| broadPropagation | 413.71ms | 456.24ms | 453.14ms | 5.53s | 6.50ms (fail) | 4.43s |
| deepPropagation | 158.71ms | 169.50ms | 176.29ms | 2.02s | 142.65ms (fail) | 1.57s |
| diamond | 274.37ms | 283.54ms | 311.18ms | 3.45s | 189.94ms (fail) | 2.49s |
| mux | 394.30ms | 411.28ms | 391.91ms | 2.06s | 191.65ms (fail) | 1.85s |
| repeatedObservers | 37.19ms | 44.90ms | 41.51ms | 210.04ms | 53.67ms (fail) | 236.14ms |
| triangle | 101.85ms | 102.60ms | 100.15ms | 1.13s | 77.48ms (fail) | 783.47ms |
| unstable | 89.05ms | 76.80ms | 68.26ms | 346.40ms | 345.05ms (fail) | 347.37ms |
| molBench | 495.49ms | 487.14ms | 484.05ms | 1.74s | 947μs | 591.29ms |
| create_signals | 21.25ms | 31.00ms | 4.55ms | 67.50ms | 62.10ms | 82.46ms |
| comp_0to1 | 4.66ms | 10.95ms | 16.78ms | 31.11ms | 53.54ms | 15.51ms |
| comp_1to1 | 16.89ms | 16.19ms | 16.16ms | 43.21ms | 51.99ms | 41.25ms |
| comp_2to1 | 10.77ms | 19.05ms | 17.96ms | 20.72ms | 33.52ms | 22.91ms |
| comp_4to1 | 16.58ms | 6.64ms | 11.99ms | 18.67ms | 19.31ms | 16.69ms |
| comp_1000to1 | 4μs | 9μs | 5μs | 2.23ms | 48μs | 31μs |
| comp_1to2 | 6.48ms | 19.94ms | 18.64ms | 33.78ms | 45.04ms | 35.84ms |
| comp_1to4 | 9.15ms | 16.71ms | 26.39ms | 24.28ms | 42.21ms | 17.82ms |
| comp_1to8 | 5.64ms | 6.71ms | 5.49ms | 23.55ms | 42.89ms | 19.79ms |
| comp_1to1000 | 3.33ms | 4.61ms | 6.08ms | 19.09ms | 39.06ms | 15.43ms |
| update_1to1 | 6.32ms | 9.36ms | 8.76ms | 43.31ms | 9.48ms | 24.89ms |
| update_2to1 | 1.94ms | 4.66ms | 4.36ms | 21.41ms | 2.94ms | 13.36ms |
| update_4to1 | 2.37ms | 2.35ms | 2.22ms | 10.64ms | 1.72ms | 7.51ms |
| update_1000to1 | 24μs | 23μs | 21μs | 115μs | 15μs | 65μs |
| update_1to2 | 4.15ms | 4.73ms | 4.36ms | 23.11ms | 3.30ms | 13.22ms |
| update_1to4 | 1.81ms | 2.33ms | 2.20ms | 10.88ms | 1.49ms | 6.94ms |
| update_1to1000 | 28μs | 46μs | 1.01ms | 213μs | 386μs | 175μs |
| cellx1000 | 9.36ms | 9.58ms | 9.70ms | 167.60ms | 5.13ms | 79.30ms |
| cellx2500 | 26.58ms | 31.94ms | 27.31ms | 486.84ms | 20.69ms | 261.09ms |
| cellx5000 | 67.61ms | 65.73ms | 76.71ms | 1.11s | 62.63ms | 559.77ms |
| 10x5 - 2 sources - read 20.0% (simple) | 266.35ms | 514.50ms | 443.38ms | 2.62s (half) | 254.61ms | 2.07s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 216.30ms | 279.30ms | 321.53ms | 2.40s (half) | 205.48ms | 1.57s |
| 1000x12 - 4 sources - dynamic (large) | 294.23ms | 3.68s | 3.70s | 4.05s (half) | 350.80ms | 1.85s |
| 1000x5 - 25 sources (wide dense) | 498.06ms | 3.50s | 2.52s | 4.92s (half) | 519.64ms | 3.56s |
| 5x500 - 3 sources (deep) | 247.46ms | 226.20ms | 228.11ms | 2.07s (half) | 232.39ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 291.69ms | 475.17ms | 473.40ms | 2.79s (half) | 265.25ms | 1.75s |
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
