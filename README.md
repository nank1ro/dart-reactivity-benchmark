# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.30s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.02s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 10.90s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.22s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

<!-- ranking end -->

> [!TIP]
> ## Ranking algorithm
>
> The ranking system evaluates frameworks based on multiple factors:
>
> 1. **Test Case Scores**
>    - For each test case, the fastest passing implementation (with coefficient ≥ 0.5) serves as the baseline
>    - Individual test scores are calculated as: `(baseline_time / actual_time) * coefficient * weight`
>    - Test case weights are assigned based on operation types:
>      - Regular operations: 1.0
>      - Extended operations: 1.2-1.5
>
> 2. **Success Coefficient**
>    - Full pass (coefficient = 1.0): Test completely successful
>    - Partial pass (coefficient = 0.5): Part of the test failed
>    - Complete fail (coefficient = 0): Test failed entirely
>
> 3. **Final Score Calculation**
>    - Base score: Geometric mean of all weighted test case scores
>    - Time factor: sqrt(fastest_total_time / framework_total_time)
>    - Final score = base_score * time_factor
>
> This scoring system balances individual test performance with overall execution time while accounting for test reliability.

## Benchmark results of each framework

<!-- test-case start -->
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 209.04ms | 189.18ms | 175.19ms (fail) | 290.64ms | 205.25ms | 2.39s |
| broadPropagation | 466.45ms | 355.12ms | 7.30ms (fail) | 516.74ms | 456.20ms | 4.34s |
| deepPropagation | 171.37ms | 136.00ms | 139.14ms (fail) | 173.48ms | 174.90ms | 1.51s |
| diamond | 281.50ms | 232.80ms | 205.86ms (fail) | 363.41ms | 285.91ms | 2.40s |
| mux | 388.00ms | 356.32ms | 183.26ms (fail) | 424.35ms | 372.06ms | 1.86s |
| repeatedObservers | 46.36ms | 45.12ms | 52.84ms (fail) | 80.52ms | 40.57ms | 230.75ms |
| triangle | 100.90ms | 85.97ms | 83.02ms (fail) | 117.39ms | 100.72ms | 776.17ms |
| unstable | 78.19ms | 61.72ms | 336.58ms (fail) | 96.89ms | 69.79ms | 351.72ms |
| molBench | 495.22ms | 486.26ms | 985μs | 491.44ms | 486.66ms | 592.62ms |
| create_signals | 27.08ms | 28.93ms | 70.48ms | 75.93ms | 4.72ms | 67.30ms |
| comp_0to1 | 11.94ms | 6.62ms | 63.82ms | 25.60ms | 17.99ms | 16.31ms |
| comp_1to1 | 27.33ms | 4.23ms | 64.34ms | 31.89ms | 14.13ms | 41.59ms |
| comp_2to1 | 10.87ms | 2.38ms | 39.79ms | 41.84ms | 21.94ms | 23.74ms |
| comp_4to1 | 8.44ms | 7.64ms | 17.59ms | 13.53ms | 15.42ms | 13.73ms |
| comp_1000to1 | 4μs | 7μs | 43μs | 34μs | 4μs | 17μs |
| comp_1to2 | 23.15ms | 10.17ms | 46.99ms | 36.43ms | 18.58ms | 36.08ms |
| comp_1to4 | 11.25ms | 11.81ms | 47.04ms | 20.56ms | 38.78ms | 18.11ms |
| comp_1to8 | 6.25ms | 4.94ms | 44.07ms | 19.80ms | 6.88ms | 20.94ms |
| comp_1to1000 | 4.31ms | 3.63ms | 42.91ms | 14.67ms | 4.81ms | 16.09ms |
| update_1to1 | 9.37ms | 4.63ms | 6.12ms | 15.41ms | 8.74ms | 27.24ms |
| update_2to1 | 4.70ms | 2.91ms | 3.05ms | 7.73ms | 4.34ms | 13.08ms |
| update_4to1 | 2.36ms | 2.23ms | 1.53ms | 3.86ms | 2.17ms | 7.07ms |
| update_1000to1 | 24μs | 26μs | 16μs | 38μs | 22μs | 68μs |
| update_1to2 | 4.69ms | 5.47ms | 3.05ms | 8.09ms | 4.39ms | 13.84ms |
| update_1to4 | 2.54ms | 2.64ms | 1.56ms | 3.86ms | 2.19ms | 6.94ms |
| update_1to1000 | 43μs | 64μs | 388μs | 162μs | 146μs | 171μs |
| cellx1000 | 9.92ms | 7.16ms | 5.60ms | 13.47ms | 9.57ms | 79.43ms |
| cellx2500 | 32.40ms | 19.80ms | 24.74ms | 33.41ms | 26.33ms | 267.39ms |
| cellx5000 | 70.92ms | 44.03ms | 63.29ms | 86.33ms | 79.86ms | 573.89ms |
| 10x5 - 2 sources - read 20.0% (simple) | 517.11ms | 238.42ms | 249.98ms | 353.14ms | 452.22ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.73ms | 176.29ms | 202.41ms | 246.09ms | 269.31ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.59s | 274.19ms | 353.29ms | 465.12ms | 3.63s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.31s | 405.22ms | 516.66ms | 593.91ms | 2.53s | 3.47s |
| 5x500 - 3 sources (deep) | 224.71ms | 189.37ms | 204.95ms | 254.74ms | 224.40ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 470.86ms | 265.26ms | 259.20ms | 379.13ms | 449.54ms | 1.67s |

<!-- test-case end -->

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
