# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.95 | 3.99s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.63 | 11.38s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.97 | 9.75s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.51 | 3.50s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.37 | 27.54s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.33 | 40.14s | 3.0 |
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
| avoidablePropagation | 201.19ms | 209.83ms | 210.26ms | 2.19s | 165.20ms (fail) | 2.32s |
| broadPropagation | 397.04ms | 465.61ms | 458.94ms | 5.49s | 7.06ms (fail) | 4.44s |
| deepPropagation | 149.29ms | 176.58ms | 175.10ms | 2.04s | 157.54ms (fail) | 1.55s |
| diamond | 239.82ms | 284.18ms | 272.54ms | 3.54s | 188.12ms (fail) | 2.48s |
| mux | 382.28ms | 415.02ms | 383.02ms | 2.06s | 198.35ms (fail) | 1.83s |
| repeatedObservers | 21.98ms | 44.69ms | 41.53ms | 212.44ms | 53.97ms (fail) | 233.77ms |
| triangle | 94.34ms | 101.78ms | 98.78ms | 1.14s | 79.33ms (fail) | 788.16ms |
| unstable | 41.29ms | 77.83ms | 70.08ms | 344.01ms | 338.55ms (fail) | 351.28ms |
| molBench | 492.92ms | 487.25ms | 483.43ms | 1.74s | 926μs | 590.19ms |
| create_signals | 21.45ms | 29.20ms | 4.65ms | 76.67ms | 63.30ms | 67.26ms |
| comp_0to1 | 4.56ms | 14.72ms | 17.05ms | 31.94ms | 53.69ms | 15.30ms |
| comp_1to1 | 17.29ms | 18.54ms | 15.07ms | 43.76ms | 52.12ms | 51.35ms |
| comp_2to1 | 11.94ms | 10.27ms | 15.61ms | 34.70ms | 41.74ms | 34.26ms |
| comp_4to1 | 16.07ms | 6.62ms | 10.74ms | 26.24ms | 16.98ms | 22.27ms |
| comp_1000to1 | 6μs | 5μs | 7μs | 2.32ms | 54μs | 20μs |
| comp_1to2 | 11.85ms | 20.93ms | 30.26ms | 27.22ms | 46.01ms | 31.67ms |
| comp_1to4 | 9.28ms | 11.43ms | 28.15ms | 34.00ms | 43.02ms | 18.07ms |
| comp_1to8 | 4.01ms | 6.56ms | 7.36ms | 23.70ms | 43.07ms | 19.64ms |
| comp_1to1000 | 3.55ms | 4.60ms | 5.60ms | 18.97ms | 39.84ms | 15.53ms |
| update_1to1 | 11.59ms | 9.45ms | 8.73ms | 43.26ms | 9.23ms | 27.62ms |
| update_2to1 | 3.54ms | 4.67ms | 4.36ms | 21.74ms | 2.92ms | 14.21ms |
| update_4to1 | 2.59ms | 2.34ms | 2.27ms | 10.77ms | 1.87ms | 6.96ms |
| update_1000to1 | 9μs | 23μs | 21μs | 126μs | 15μs | 81μs |
| update_1to2 | 2.99ms | 4.77ms | 4.37ms | 21.83ms | 3.88ms | 14.09ms |
| update_1to4 | 974μs | 2.35ms | 2.19ms | 10.92ms | 1.45ms | 6.91ms |
| update_1to1000 | 38μs | 68μs | 770μs | 218μs | 392μs | 161μs |
| cellx1000 | 7.67ms | 9.63ms | 9.54ms | 160.89ms | 5.09ms | 72.87ms |
| cellx2500 | 20.27ms | 30.08ms | 25.55ms | 488.20ms | 18.64ms | 255.17ms |
| cellx5000 | 44.39ms | 59.99ms | 70.04ms | 1.10s | 54.56ms | 553.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 258.60ms | 500.34ms | 421.75ms | 2.76s (half) | 256.60ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 215.92ms | 277.51ms | 279.96ms | 2.47s (half) | 205.62ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 296.65ms | 3.91s | 3.41s | 4.18s (half) | 336.60ms | 1.82s |
| 1000x5 - 25 sources (wide dense) | 494.74ms | 3.48s | 2.51s | 4.89s (half) | 521.48ms | 3.51s |
| 5x500 - 3 sources (deep) | 219.74ms | 229.62ms | 226.54ms | 2.05s (half) | 232.35ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 285.65ms | 473.43ms | 446.68ms | 2.84s (half) | 264.83ms | 1.69s |
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
