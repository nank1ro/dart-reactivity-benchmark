# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score | Total Time | Fail Coefficients |
|---|---|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 31.85 | 3.97s | 0.0 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 21.92 | 9.81s | 0.0 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 21.53 | 11.10s | 0.0 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 15.48 | 3.58s | 8.0 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 6.90 | 27.43s | 0.0 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 4.82 | 39.98s | 3.0 |
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
| avoidablePropagation | 199.50ms | 214.61ms | 210.56ms | 2.20s | 168.49ms (fail) | 2.33s |
| broadPropagation | 384.18ms | 460.39ms | 453.44ms | 5.52s | 7.20ms (fail) | 4.35s |
| deepPropagation | 150.28ms | 172.82ms | 172.00ms | 2.01s | 142.52ms (fail) | 1.53s |
| diamond | 239.12ms | 287.58ms | 274.05ms | 3.48s | 234.50ms (fail) | 2.43s |
| mux | 381.95ms | 428.58ms | 386.76ms | 2.06s | 198.71ms (fail) | 1.82s |
| repeatedObservers | 21.48ms | 45.29ms | 41.22ms | 210.24ms | 53.86ms (fail) | 248.06ms |
| triangle | 94.02ms | 101.35ms | 98.19ms | 1.15s | 80.89ms (fail) | 791.17ms |
| unstable | 41.71ms | 78.47ms | 70.46ms | 342.51ms | 335.52ms (fail) | 356.92ms |
| molBench | 491.42ms | 486.56ms | 483.70ms | 1.74s | 1.08ms | 589.06ms |
| create_signals | 22.21ms | 29.91ms | 4.71ms | 78.86ms | 64.09ms | 74.01ms |
| comp_0to1 | 4.47ms | 14.72ms | 17.05ms | 31.82ms | 55.88ms | 19.88ms |
| comp_1to1 | 17.21ms | 18.49ms | 16.08ms | 49.12ms | 55.77ms | 38.84ms |
| comp_2to1 | 11.06ms | 13.06ms | 19.25ms | 21.58ms | 36.02ms | 12.64ms |
| comp_4to1 | 21.59ms | 9.06ms | 10.91ms | 13.21ms | 18.79ms | 17.41ms |
| comp_1000to1 | 3μs | 6μs | 6μs | 2.72ms | 45μs | 22μs |
| comp_1to2 | 6.51ms | 24.05ms | 27.91ms | 27.81ms | 48.69ms | 36.25ms |
| comp_1to4 | 8.78ms | 15.07ms | 29.36ms | 30.79ms | 46.49ms | 19.25ms |
| comp_1to8 | 5.56ms | 7.13ms | 7.43ms | 24.42ms | 47.86ms | 21.36ms |
| comp_1to1000 | 3.32ms | 4.64ms | 5.69ms | 20.27ms | 41.73ms | 15.50ms |
| update_1to1 | 3.64ms | 9.35ms | 8.80ms | 42.49ms | 9.84ms | 29.11ms |
| update_2to1 | 4.66ms | 4.69ms | 4.39ms | 21.63ms | 2.92ms | 13.89ms |
| update_4to1 | 901μs | 2.35ms | 2.21ms | 10.94ms | 2.75ms | 7.27ms |
| update_1000to1 | 9μs | 23μs | 21μs | 115μs | 14μs | 81μs |
| update_1to2 | 4.70ms | 4.90ms | 4.36ms | 21.58ms | 4.35ms | 13.87ms |
| update_1to4 | 2.30ms | 2.35ms | 2.19ms | 10.89ms | 2.51ms | 7.02ms |
| update_1to1000 | 47μs | 81μs | 762μs | 237μs | 440μs | 174μs |
| cellx1000 | 7.64ms | 9.95ms | 9.62ms | 166.13ms | 6.57ms | 71.79ms |
| cellx2500 | 22.13ms | 33.22ms | 27.30ms | 484.64ms | 28.48ms | 254.15ms |
| cellx5000 | 45.85ms | 66.25ms | 73.16ms | 1.12s | 59.69ms | 550.37ms |
| 10x5 - 2 sources - read 20.0% (simple) | 260.75ms | 504.64ms | 426.12ms | 2.63s (half) | 251.76ms | 2.07s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 210.39ms | 278.62ms | 281.52ms | 2.37s (half) | 206.92ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 295.33ms | 3.65s | 3.42s | 4.28s (half) | 342.71ms | 1.85s |
| 1000x5 - 25 sources (wide dense) | 497.68ms | 3.40s | 2.53s | 4.94s (half) | 519.21ms | 3.53s |
| 5x500 - 3 sources (deep) | 228.27ms | 231.65ms | 229.52ms | 2.02s (half) | 233.76ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 276.64ms | 487.54ms | 453.92ms | 2.84s (half) | 267.04ms | 1.71s |
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
