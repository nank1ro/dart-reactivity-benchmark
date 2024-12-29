# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 29.89 | 3.95s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.88 | 11.17s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.74 | 9.75s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.24 | 3.47s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.59 | 27.28s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.24 | 39.70s | 3.0 |
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
| avoidablePropagation | 201.75ms | 210.95ms | 210.39ms | 2.21s | 149.27ms (fail) | 2.27s |
| broadPropagation | 382.46ms | 460.86ms | 453.64ms | 5.51s | 6.44ms (fail) | 4.48s |
| deepPropagation | 148.69ms | 172.36ms | 173.66ms | 2.04s | 140.64ms (fail) | 1.55s |
| diamond | 237.52ms | 290.37ms | 279.28ms | 3.50s | 193.58ms (fail) | 2.42s |
| mux | 378.57ms | 410.73ms | 385.05ms | 2.05s | 195.42ms (fail) | 1.80s |
| repeatedObservers | 21.91ms | 45.08ms | 41.63ms | 214.06ms | 55.59ms (fail) | 240.43ms |
| triangle | 94.80ms | 100.29ms | 97.38ms | 1.12s | 77.46ms (fail) | 782.55ms |
| unstable | 42.15ms | 78.10ms | 69.55ms | 341.79ms | 336.93ms (fail) | 352.38ms |
| molBench | 491.01ms | 486.49ms | 483.26ms | 1.75s | 939μs | 585.49ms |
| create_signals | 21.45ms | 31.02ms | 4.67ms | 65.23ms | 62.71ms | 62.51ms |
| comp_0to1 | 4.51ms | 14.94ms | 16.80ms | 29.02ms | 54.94ms | 20.35ms |
| comp_1to1 | 18.46ms | 17.60ms | 14.73ms | 52.56ms | 53.72ms | 41.67ms |
| comp_2to1 | 16.21ms | 10.33ms | 20.09ms | 35.95ms | 33.47ms | 22.64ms |
| comp_4to1 | 16.30ms | 1.94ms | 10.74ms | 20.46ms | 17.33ms | 17.24ms |
| comp_1000to1 | 5μs | 5μs | 7μs | 2.35ms | 79μs | 16μs |
| comp_1to2 | 8.96ms | 18.75ms | 27.44ms | 25.73ms | 48.42ms | 33.27ms |
| comp_1to4 | 10.94ms | 10.31ms | 31.38ms | 28.08ms | 44.30ms | 17.78ms |
| comp_1to8 | 7.44ms | 6.76ms | 7.39ms | 24.10ms | 45.24ms | 20.45ms |
| comp_1to1000 | 3.25ms | 4.60ms | 5.59ms | 19.00ms | 40.64ms | 15.04ms |
| update_1to1 | 3.84ms | 9.37ms | 8.82ms | 43.39ms | 9.15ms | 27.39ms |
| update_2to1 | 4.73ms | 4.66ms | 4.36ms | 21.38ms | 2.91ms | 13.01ms |
| update_4to1 | 1.45ms | 2.36ms | 2.21ms | 10.80ms | 1.93ms | 7.04ms |
| update_1000to1 | 26μs | 39μs | 21μs | 117μs | 15μs | 67μs |
| update_1to2 | 4.72ms | 6.22ms | 4.35ms | 21.47ms | 4.76ms | 12.83ms |
| update_1to4 | 2.32ms | 2.38ms | 2.22ms | 11.01ms | 1.49ms | 6.69ms |
| update_1to1000 | 38μs | 46μs | 718μs | 228μs | 415μs | 162μs |
| cellx1000 | 7.61ms | 9.64ms | 9.49ms | 156.31ms | 5.42ms | 69.88ms |
| cellx2500 | 20.44ms | 31.46ms | 25.21ms | 479.04ms | 19.02ms | 249.08ms |
| cellx5000 | 44.98ms | 62.56ms | 71.88ms | 1.08s | 61.53ms | 559.23ms |
| 10x5 - 2 sources - read 20.0% (simple) | 262.76ms | 502.31ms | 435.51ms | 2.68s (half) | 245.50ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 210.20ms | 275.93ms | 283.63ms | 2.39s (half) | 205.75ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 290.49ms | 3.81s | 3.37s | 4.12s (half) | 346.76ms | 1.73s |
| 1000x5 - 25 sources (wide dense) | 486.47ms | 3.36s | 2.52s | 4.89s (half) | 515.40ms | 3.53s |
| 5x500 - 3 sources (deep) | 226.77ms | 232.19ms | 227.17ms | 1.99s (half) | 230.11ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 279.75ms | 490.88ms | 450.35ms | 2.76s (half) | 266.15ms | 1.69s |
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
