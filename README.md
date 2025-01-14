# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.28 | 4.17s | 0.0 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 23.25 | 9.84s | 0.0 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 22.89 | 11.33s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.32 | 3.52s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.61 | 27.61s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.51 | 40.85s | 3.0 |
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
| avoidablePropagation | 206.73ms | 219.97ms | 208.76ms | 2.26s | 156.33ms (fail) | 2.38s |
| broadPropagation | 422.97ms | 459.70ms | 456.40ms | 5.68s | 6.98ms (fail) | 4.40s |
| deepPropagation | 160.41ms | 171.03ms | 173.31ms | 2.06s | 139.97ms (fail) | 1.56s |
| diamond | 266.55ms | 286.55ms | 276.25ms | 3.58s | 190.60ms (fail) | 2.44s |
| mux | 397.07ms | 413.82ms | 386.79ms | 2.09s | 199.09ms (fail) | 1.87s |
| repeatedObservers | 37.41ms | 44.83ms | 41.09ms | 216.68ms | 53.59ms (fail) | 240.12ms |
| triangle | 101.66ms | 100.33ms | 99.01ms | 1.19s | 79.46ms (fail) | 788.52ms |
| unstable | 90.02ms | 78.57ms | 69.72ms | 357.49ms | 336.08ms (fail) | 352.50ms |
| molBench | 491.54ms | 487.89ms | 483.53ms | 1.77s | 908μs | 591.45ms |
| create_signals | 21.23ms | 30.56ms | 4.63ms | 60.56ms | 66.98ms | 62.54ms |
| comp_0to1 | 4.55ms | 14.90ms | 17.23ms | 39.41ms | 58.50ms | 19.00ms |
| comp_1to1 | 15.16ms | 18.64ms | 15.53ms | 41.73ms | 57.47ms | 32.32ms |
| comp_2to1 | 15.89ms | 18.62ms | 11.48ms | 28.24ms | 35.85ms | 19.05ms |
| comp_4to1 | 13.22ms | 1.98ms | 11.42ms | 12.99ms | 18.13ms | 19.01ms |
| comp_1000to1 | 4μs | 8μs | 7μs | 2.11ms | 84μs | 15μs |
| comp_1to2 | 9.68ms | 23.71ms | 16.88ms | 31.31ms | 53.05ms | 37.71ms |
| comp_1to4 | 8.18ms | 12.48ms | 24.89ms | 27.61ms | 47.22ms | 23.54ms |
| comp_1to8 | 5.64ms | 11.40ms | 7.86ms | 24.54ms | 48.39ms | 22.36ms |
| comp_1to1000 | 3.65ms | 4.60ms | 5.11ms | 18.89ms | 44.22ms | 15.69ms |
| update_1to1 | 6.02ms | 9.39ms | 8.78ms | 43.41ms | 7.75ms | 28.08ms |
| update_2to1 | 1.98ms | 4.67ms | 4.36ms | 21.38ms | 2.90ms | 14.02ms |
| update_4to1 | 1.91ms | 2.34ms | 2.18ms | 10.80ms | 1.91ms | 7.55ms |
| update_1000to1 | 22μs | 23μs | 21μs | 116μs | 15μs | 69μs |
| update_1to2 | 3.17ms | 4.72ms | 4.36ms | 21.43ms | 4.44ms | 14.05ms |
| update_1to4 | 2.42ms | 2.33ms | 2.18ms | 10.93ms | 1.49ms | 7.00ms |
| update_1to1000 | 51μs | 45μs | 179μs | 221μs | 447μs | 165μs |
| cellx1000 | 8.04ms | 9.76ms | 10.83ms | 161.38ms | 5.36ms | 76.91ms |
| cellx2500 | 22.96ms | 31.37ms | 38.48ms | 529.65ms | 19.78ms | 305.46ms |
| cellx5000 | 50.17ms | 66.03ms | 83.32ms | 1.22s | 61.11ms | 570.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 265.57ms | 500.30ms | 428.47ms | 2.76s (half) | 255.90ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 219.56ms | 282.16ms | 274.17ms | 2.51s (half) | 206.04ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 296.20ms | 3.81s | 3.41s | 4.23s (half) | 341.21ms | 1.79s |
| 1000x5 - 25 sources (wide dense) | 491.96ms | 3.49s | 2.57s | 4.96s (half) | 515.18ms | 3.55s |
| 5x500 - 3 sources (deep) | 242.36ms | 229.39ms | 225.29ms | 2.07s (half) | 233.59ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 288.28ms | 483.64ms | 463.72ms | 2.80s (half) | 266.39ms | 1.71s |
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
