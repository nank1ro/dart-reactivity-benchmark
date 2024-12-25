# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 31.99 | 3.95s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 22.07 | 11.02s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.28 | 9.82s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.43 | 3.57s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.88 | 27.25s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.30 | 39.45s | 3.0 |
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
| avoidablePropagation | 198.27ms | 208.69ms | 226.30ms | 2.18s | 168.04ms (fail) | 2.33s |
| broadPropagation | 398.45ms | 466.22ms | 463.45ms | 5.44s | 6.99ms (fail) | 4.31s |
| deepPropagation | 154.61ms | 172.77ms | 171.24ms | 2.00s | 142.35ms (fail) | 1.54s |
| diamond | 242.60ms | 285.61ms | 275.53ms | 3.37s | 212.34ms (fail) | 2.42s |
| mux | 377.34ms | 411.40ms | 386.75ms | 2.07s | 191.77ms (fail) | 1.82s |
| repeatedObservers | 21.91ms | 45.38ms | 40.77ms | 212.01ms | 53.58ms (fail) | 234.04ms |
| triangle | 93.29ms | 102.77ms | 98.07ms | 1.13s | 81.70ms (fail) | 767.51ms |
| unstable | 40.48ms | 78.89ms | 69.67ms | 342.63ms | 335.31ms (fail) | 354.33ms |
| molBench | 486.41ms | 487.55ms | 482.77ms | 1.74s | 885μs | 589.16ms |
| create_signals | 23.07ms | 32.43ms | 5.06ms | 76.98ms | 72.76ms | 68.59ms |
| comp_0to1 | 4.53ms | 14.89ms | 16.91ms | 32.40ms | 53.83ms | 20.82ms |
| comp_1to1 | 17.89ms | 21.91ms | 15.92ms | 54.89ms | 52.12ms | 25.30ms |
| comp_2to1 | 15.65ms | 8.95ms | 18.39ms | 29.39ms | 37.64ms | 15.09ms |
| comp_4to1 | 17.68ms | 8.08ms | 10.92ms | 19.89ms | 16.96ms | 13.64ms |
| comp_1000to1 | 3μs | 6μs | 8μs | 2.25ms | 45μs | 19μs |
| comp_1to2 | 6.57ms | 18.04ms | 17.36ms | 25.78ms | 48.12ms | 39.73ms |
| comp_1to4 | 8.65ms | 12.84ms | 29.06ms | 28.20ms | 43.07ms | 19.46ms |
| comp_1to8 | 5.60ms | 6.75ms | 8.58ms | 24.68ms | 43.62ms | 21.39ms |
| comp_1to1000 | 3.40ms | 4.63ms | 6.48ms | 19.63ms | 39.83ms | 16.12ms |
| update_1to1 | 7.34ms | 9.38ms | 8.78ms | 43.52ms | 7.24ms | 25.75ms |
| update_2to1 | 1.91ms | 4.68ms | 4.37ms | 21.29ms | 2.91ms | 11.21ms |
| update_4to1 | 2.26ms | 2.38ms | 2.21ms | 10.80ms | 3.03ms | 7.05ms |
| update_1000to1 | 9μs | 23μs | 21μs | 115μs | 14μs | 70μs |
| update_1to2 | 1.97ms | 4.72ms | 4.38ms | 22.11ms | 4.04ms | 14.14ms |
| update_1to4 | 982μs | 2.34ms | 2.23ms | 10.99ms | 1.45ms | 7.02ms |
| update_1to1000 | 44μs | 45μs | 1.02ms | 217μs | 398μs | 164μs |
| cellx1000 | 7.88ms | 9.57ms | 9.71ms | 154.48ms | 7.10ms | 69.79ms |
| cellx2500 | 19.99ms | 31.00ms | 25.29ms | 487.81ms | 20.11ms | 259.95ms |
| cellx5000 | 41.94ms | 63.65ms | 68.35ms | 1.08s | 60.76ms | 547.95ms |
| 10x5 - 2 sources - read 20.0% (simple) | 265.66ms | 513.94ms | 418.44ms | 2.61s (half) | 282.00ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 205.48ms | 274.85ms | 276.71ms | 2.40s (half) | 214.03ms | 1.55s |
| 1000x12 - 4 sources - dynamic (large) | 286.28ms | 3.65s | 3.45s | 4.13s (half) | 345.12ms | 1.82s |
| 1000x5 - 25 sources (wide dense) | 491.97ms | 3.36s | 2.52s | 4.90s (half) | 518.81ms | 3.49s |
| 5x500 - 3 sources (deep) | 228.00ms | 227.19ms | 231.50ms | 2.00s (half) | 234.75ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 272.69ms | 479.32ms | 449.42ms | 2.77s (half) | 270.48ms | 1.71s |
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
