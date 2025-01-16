# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 30.41 | 4.10s | 0.0 |
| 🥈 | [signals](https://pub.dev/packages/signals) | 23.39 | 11.09s | 0.0 |
| 🥉 | [preact_signals](https://pub.dev/packages/preact_signals) | 22.84 | 9.69s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 16.29 | 3.51s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.68 | 27.40s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.41 | 39.13s | 3.0 |
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
| avoidablePropagation | 207.95ms | 208.76ms | 209.74ms | 2.19s | 173.16ms (fail) | 2.39s |
| broadPropagation | 428.78ms | 458.45ms | 454.94ms | 5.43s | 6.76ms (fail) | 4.33s |
| deepPropagation | 155.85ms | 174.94ms | 172.55ms | 2.00s | 140.30ms (fail) | 1.54s |
| diamond | 263.17ms | 286.14ms | 274.13ms | 3.42s | 198.48ms (fail) | 2.47s |
| mux | 388.31ms | 408.54ms | 385.24ms | 2.02s | 192.32ms (fail) | 1.79s |
| repeatedObservers | 35.07ms | 44.92ms | 41.10ms | 209.50ms | 56.52ms (fail) | 243.99ms |
| triangle | 100.20ms | 101.62ms | 99.04ms | 1.15s | 81.46ms (fail) | 773.10ms |
| unstable | 89.24ms | 77.94ms | 69.95ms | 342.04ms | 334.23ms (fail) | 358.88ms |
| molBench | 488.53ms | 486.24ms | 483.16ms | 1.74s | 892μs | 591.94ms |
| create_signals | 25.61ms | 30.51ms | 4.65ms | 70.91ms | 72.54ms | 68.14ms |
| comp_0to1 | 5.10ms | 14.57ms | 16.86ms | 30.48ms | 54.27ms | 21.88ms |
| comp_1to1 | 15.50ms | 18.45ms | 20.73ms | 39.91ms | 54.36ms | 25.70ms |
| comp_2to1 | 8.23ms | 13.03ms | 8.73ms | 23.00ms | 33.44ms | 10.12ms |
| comp_4to1 | 14.24ms | 1.94ms | 16.16ms | 17.55ms | 17.00ms | 26.41ms |
| comp_1000to1 | 4μs | 5μs | 6μs | 2.13ms | 53μs | 20μs |
| comp_1to2 | 6.53ms | 12.99ms | 29.00ms | 20.27ms | 47.09ms | 31.36ms |
| comp_1to4 | 8.50ms | 11.61ms | 27.10ms | 37.55ms | 44.00ms | 25.57ms |
| comp_1to8 | 5.59ms | 7.21ms | 6.99ms | 25.53ms | 44.22ms | 22.64ms |
| comp_1to1000 | 3.61ms | 4.56ms | 4.46ms | 18.35ms | 40.20ms | 15.98ms |
| update_1to1 | 7.24ms | 9.88ms | 8.75ms | 42.78ms | 7.03ms | 27.83ms |
| update_2to1 | 2.05ms | 4.66ms | 4.72ms | 21.53ms | 3.30ms | 13.82ms |
| update_4to1 | 1.62ms | 2.35ms | 2.35ms | 10.73ms | 2.45ms | 6.97ms |
| update_1000to1 | 23μs | 23μs | 34μs | 114μs | 15μs | 82μs |
| update_1to2 | 4.92ms | 4.73ms | 4.47ms | 21.68ms | 3.52ms | 13.95ms |
| update_1to4 | 2.56ms | 2.34ms | 2.19ms | 10.92ms | 1.46ms | 7.00ms |
| update_1to1000 | 30μs | 46μs | 152μs | 214μs | 409μs | 164μs |
| cellx1000 | 8.29ms | 9.54ms | 9.61ms | 149.28ms | 5.17ms | 73.79ms |
| cellx2500 | 21.30ms | 30.55ms | 25.45ms | 476.04ms | 20.50ms | 246.01ms |
| cellx5000 | 44.41ms | 58.34ms | 64.76ms | 1.07s | 57.98ms | 560.03ms |
| 10x5 - 2 sources - read 20.0% (simple) | 265.08ms | 502.24ms | 433.04ms | 2.60s (half) | 247.13ms | 2.07s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 211.44ms | 287.99ms | 272.11ms | 2.33s (half) | 207.57ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 292.51ms | 3.77s | 3.36s | 3.99s (half) | 354.62ms | 1.80s |
| 1000x5 - 25 sources (wide dense) | 481.75ms | 3.35s | 2.51s | 4.88s (half) | 510.46ms | 3.45s |
| 5x500 - 3 sources (deep) | 237.63ms | 227.36ms | 222.55ms | 1.99s (half) | 228.90ms | 1.18s |
| 100x15 - 6 sources - dynamic (very dynamic) | 273.23ms | 469.97ms | 449.28ms | 2.74s (half) | 266.04ms | 1.70s |
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
