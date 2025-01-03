# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.73 | 3.94s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.47 | 11.00s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.39 | 9.71s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.36 | 3.58s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.22 | 27.37s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.18 | 40.01s | 3.0 |
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
| avoidablePropagation | 195.87ms | 215.26ms | 211.54ms | 2.23s | 169.89ms (fail) | 2.32s |
| broadPropagation | 379.89ms | 465.53ms | 453.35ms | 5.52s | 8.23ms (fail) | 4.37s |
| deepPropagation | 149.55ms | 173.25ms | 171.43ms | 2.03s | 141.41ms (fail) | 1.56s |
| diamond | 238.20ms | 283.39ms | 272.47ms | 3.50s | 210.20ms (fail) | 2.45s |
| mux | 379.25ms | 410.94ms | 385.17ms | 2.04s | 193.13ms (fail) | 1.82s |
| repeatedObservers | 21.47ms | 44.82ms | 41.41ms | 211.78ms | 53.47ms (fail) | 237.26ms |
| triangle | 92.37ms | 102.92ms | 99.06ms | 1.13s | 82.25ms (fail) | 784.37ms |
| unstable | 41.23ms | 77.67ms | 69.95ms | 348.48ms | 335.91ms (fail) | 348.93ms |
| molBench | 491.73ms | 486.51ms | 484.14ms | 1.75s | 1.01ms | 589.00ms |
| create_signals | 22.10ms | 29.89ms | 4.66ms | 69.81ms | 73.21ms | 71.86ms |
| comp_0to1 | 4.73ms | 16.10ms | 17.19ms | 32.90ms | 54.15ms | 20.59ms |
| comp_1to1 | 18.91ms | 17.63ms | 15.30ms | 44.72ms | 53.59ms | 33.51ms |
| comp_2to1 | 11.20ms | 8.30ms | 20.08ms | 21.20ms | 34.36ms | 12.29ms |
| comp_4to1 | 17.48ms | 2.81ms | 14.84ms | 14.89ms | 17.61ms | 18.22ms |
| comp_1000to1 | 3μs | 5μs | 4μs | 2.43ms | 85μs | 24μs |
| comp_1to2 | 6.75ms | 12.55ms | 14.95ms | 26.64ms | 47.79ms | 34.40ms |
| comp_1to4 | 9.16ms | 10.41ms | 28.85ms | 32.44ms | 44.76ms | 25.37ms |
| comp_1to8 | 5.79ms | 6.67ms | 7.04ms | 23.21ms | 44.52ms | 20.77ms |
| comp_1to1000 | 3.61ms | 5.83ms | 6.05ms | 18.61ms | 40.50ms | 15.35ms |
| update_1to1 | 3.62ms | 9.40ms | 8.81ms | 43.03ms | 9.95ms | 27.57ms |
| update_2to1 | 4.66ms | 4.66ms | 4.38ms | 21.66ms | 4.72ms | 13.13ms |
| update_4to1 | 943μs | 2.36ms | 2.23ms | 10.76ms | 1.77ms | 7.21ms |
| update_1000to1 | 9μs | 23μs | 21μs | 115μs | 14μs | 80μs |
| update_1to2 | 4.98ms | 4.72ms | 4.37ms | 21.79ms | 2.98ms | 13.64ms |
| update_1to4 | 2.33ms | 2.35ms | 2.22ms | 10.97ms | 1.49ms | 7.02ms |
| update_1to1000 | 39μs | 45μs | 887μs | 234μs | 415μs | 164μs |
| cellx1000 | 7.56ms | 9.28ms | 9.41ms | 164.89ms | 5.25ms | 68.98ms |
| cellx2500 | 20.96ms | 30.25ms | 25.04ms | 574.40ms | 20.63ms | 248.66ms |
| cellx5000 | 48.74ms | 56.47ms | 61.30ms | 1.15s | 73.25ms | 563.57ms |
| 10x5 - 2 sources - read 20.0% (simple) | 255.43ms | 501.82ms | 420.19ms | 2.68s (half) | 277.97ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 211.27ms | 278.25ms | 277.92ms | 2.42s (half) | 206.74ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 296.05ms | 3.66s | 3.39s | 4.09s (half) | 338.20ms | 1.82s |
| 1000x5 - 25 sources (wide dense) | 492.88ms | 3.37s | 2.51s | 5.02s (half) | 528.14ms | 3.51s |
| 5x500 - 3 sources (deep) | 224.65ms | 225.72ms | 231.14ms | 1.97s (half) | 233.16ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 271.90ms | 473.23ms | 448.75ms | 2.78s (half) | 265.23ms | 1.70s |
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
