# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 31.38 | 3.94s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 21.57 | 11.02s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.07 | 9.83s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.76 | 3.49s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 5.78 | 27.30s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.27 | 39.52s | 3.0 |
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
| avoidablePropagation | 198.91ms | 212.80ms | 210.63ms | 2.19s | 169.13ms (fail) | 2.32s |
| broadPropagation | 394.07ms | 466.37ms | 458.64ms | 5.47s | 6.83ms (fail) | 4.36s |
| deepPropagation | 154.97ms | 176.92ms | 177.28ms | 2.02s | 138.79ms (fail) | 1.56s |
| diamond | 224.83ms | 299.93ms | 310.12ms | 3.41s | 196.35ms (fail) | 2.45s |
| mux | 375.10ms | 409.20ms | 382.15ms | 2.05s | 195.32ms (fail) | 1.81s |
| repeatedObservers | 21.90ms | 44.59ms | 40.91ms | 209.83ms | 53.38ms (fail) | 234.90ms |
| triangle | 94.54ms | 100.05ms | 97.62ms | 1.13s | 76.60ms (fail) | 766.11ms |
| unstable | 41.53ms | 79.07ms | 70.13ms | 339.76ms | 344.57ms (fail) | 354.26ms |
| molBench | 485.94ms | 486.08ms | 484.33ms | 1.75s | 920μs | 588.45ms |
| create_signals | 21.52ms | 31.09ms | 4.69ms | 62.72ms | 71.72ms | 63.68ms |
| comp_0to1 | 4.54ms | 13.03ms | 16.90ms | 32.68ms | 54.07ms | 23.83ms |
| comp_1to1 | 15.85ms | 20.07ms | 14.68ms | 44.88ms | 52.58ms | 39.53ms |
| comp_2to1 | 10.18ms | 10.48ms | 19.52ms | 20.33ms | 33.15ms | 23.96ms |
| comp_4to1 | 15.38ms | 2.59ms | 10.92ms | 14.49ms | 17.21ms | 18.03ms |
| comp_1000to1 | 3μs | 6μs | 4μs | 2.12ms | 60μs | 17μs |
| comp_1to2 | 6.51ms | 17.11ms | 21.99ms | 32.64ms | 46.76ms | 31.15ms |
| comp_1to4 | 8.79ms | 14.61ms | 28.82ms | 29.01ms | 43.20ms | 28.89ms |
| comp_1to8 | 5.71ms | 10.11ms | 7.00ms | 22.56ms | 43.85ms | 21.61ms |
| comp_1to1000 | 3.20ms | 4.91ms | 5.93ms | 19.28ms | 40.09ms | 16.06ms |
| update_1to1 | 9.33ms | 9.40ms | 8.79ms | 42.74ms | 8.56ms | 27.85ms |
| update_2to1 | 1.91ms | 4.67ms | 4.39ms | 21.85ms | 2.90ms | 13.98ms |
| update_4to1 | 1.70ms | 2.35ms | 2.22ms | 10.71ms | 1.49ms | 6.88ms |
| update_1000to1 | 18μs | 23μs | 21μs | 114μs | 15μs | 71μs |
| update_1to2 | 1.96ms | 4.79ms | 4.38ms | 21.55ms | 6.37ms | 14.79ms |
| update_1to4 | 986μs | 2.35ms | 2.22ms | 10.93ms | 1.45ms | 6.85ms |
| update_1to1000 | 45μs | 46μs | 841μs | 238μs | 416μs | 205μs |
| cellx1000 | 8.20ms | 9.79ms | 9.60ms | 151.26ms | 5.29ms | 81.49ms |
| cellx2500 | 20.04ms | 25.70ms | 25.64ms | 462.77ms | 19.39ms | 235.00ms |
| cellx5000 | 43.92ms | 64.50ms | 67.75ms | 1.04s | 61.09ms | 591.12ms |
| 10x5 - 2 sources - read 20.0% (simple) | 265.28ms | 508.79ms | 425.84ms | 2.67s (half) | 250.83ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 212.46ms | 275.54ms | 274.38ms | 2.42s (half) | 203.92ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 286.88ms | 3.66s | 3.44s | 4.11s (half) | 341.73ms | 1.71s |
| 1000x5 - 25 sources (wide dense) | 493.24ms | 3.34s | 2.52s | 4.93s (half) | 503.24ms | 3.59s |
| 5x500 - 3 sources (deep) | 226.53ms | 229.00ms | 235.01ms | 1.98s (half) | 233.61ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 285.40ms | 483.94ms | 453.11ms | 2.79s (half) | 262.26ms | 1.68s |
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
