# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.48 | 4.01s | 0.0 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 24.02 | 9.61s | 0.0 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 22.72 | 11.46s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.34 | 3.44s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.46 | 26.90s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.50 | 40.01s | 3.0 |
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
| avoidablePropagation | 194.04ms | 214.26ms | 201.50ms | 2.25s | 169.90ms (fail) | 2.27s |
| broadPropagation | 385.25ms | 458.20ms | 451.45ms | 5.70s | 6.85ms (fail) | 4.28s |
| deepPropagation | 151.67ms | 180.64ms | 174.74ms | 2.04s | 142.00ms (fail) | 1.53s |
| diamond | 247.12ms | 292.00ms | 274.00ms | 3.56s | 190.69ms (fail) | 2.44s |
| mux | 383.71ms | 420.76ms | 381.13ms | 2.11s | 190.33ms (fail) | 1.80s |
| repeatedObservers | 20.93ms | 45.02ms | 41.51ms | 215.54ms | 53.87ms (fail) | 223.52ms |
| triangle | 97.46ms | 106.29ms | 102.72ms | 1.15s | 77.02ms (fail) | 753.87ms |
| unstable | 41.40ms | 78.31ms | 69.95ms | 346.76ms | 337.18ms (fail) | 345.70ms |
| molBench | 483.50ms | 487.39ms | 484.67ms | 1.73s | 900μs | 583.79ms |
| create_signals | 21.39ms | 30.26ms | 4.57ms | 71.83ms | 62.16ms | 61.37ms |
| comp_0to1 | 4.51ms | 15.64ms | 16.79ms | 31.29ms | 48.29ms | 20.70ms |
| comp_1to1 | 18.51ms | 17.55ms | 15.16ms | 42.39ms | 51.31ms | 31.39ms |
| comp_2to1 | 11.85ms | 9.15ms | 12.64ms | 20.06ms | 33.17ms | 21.29ms |
| comp_4to1 | 17.51ms | 2.82ms | 14.38ms | 17.37ms | 17.03ms | 21.25ms |
| comp_1000to1 | 3μs | 5μs | 4μs | 2.03ms | 44μs | 15μs |
| comp_1to2 | 10.49ms | 16.59ms | 18.31ms | 29.66ms | 45.05ms | 34.48ms |
| comp_1to4 | 10.70ms | 9.45ms | 7.39ms | 27.24ms | 42.66ms | 19.54ms |
| comp_1to8 | 7.06ms | 7.10ms | 7.84ms | 22.66ms | 42.84ms | 21.89ms |
| comp_1to1000 | 4.01ms | 4.57ms | 3.48ms | 18.38ms | 39.41ms | 15.26ms |
| update_1to1 | 6.52ms | 9.37ms | 8.73ms | 42.69ms | 8.71ms | 26.64ms |
| update_2to1 | 1.95ms | 4.68ms | 4.41ms | 21.64ms | 2.90ms | 13.94ms |
| update_4to1 | 2.01ms | 2.36ms | 2.20ms | 10.79ms | 2.65ms | 7.33ms |
| update_1000to1 | 25μs | 23μs | 22μs | 120μs | 15μs | 62μs |
| update_1to2 | 3.73ms | 5.93ms | 4.35ms | 21.78ms | 4.16ms | 13.92ms |
| update_1to4 | 1.34ms | 2.36ms | 2.23ms | 10.95ms | 1.48ms | 6.96ms |
| update_1to1000 | 38μs | 46μs | 65μs | 223μs | 394μs | 162μs |
| cellx1000 | 7.42ms | 9.64ms | 9.74ms | 157.21ms | 5.09ms | 68.34ms |
| cellx2500 | 19.62ms | 30.43ms | 25.36ms | 477.94ms | 18.20ms | 246.66ms |
| cellx5000 | 41.78ms | 61.21ms | 60.96ms | 1.06s | 55.24ms | 523.15ms |
| 10x5 - 2 sources - read 20.0% (simple) | 260.02ms | 501.13ms | 418.69ms | 2.64s (half) | 246.76ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 218.68ms | 279.59ms | 275.19ms | 2.40s (half) | 206.60ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 306.19ms | 3.93s | 3.35s | 4.10s (half) | 334.81ms | 1.75s |
| 1000x5 - 25 sources (wide dense) | 512.91ms | 3.51s | 2.49s | 4.86s (half) | 505.29ms | 3.47s |
| 5x500 - 3 sources (deep) | 231.22ms | 231.73ms | 220.93ms | 2.03s (half) | 231.30ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 288.19ms | 484.24ms | 450.34ms | 2.80s (half) | 262.21ms | 1.67s |
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
