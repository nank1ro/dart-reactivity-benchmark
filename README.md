# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.30s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.35s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.39s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.56s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| avoidablePropagation | 211.77ms | 192.36ms | 160.78ms (fail) | 262.54ms | 203.46ms | 2.35s |
| broadPropagation | 461.70ms | 352.72ms | 6.67ms (fail) | 488.76ms | 466.06ms | 4.39s |
| deepPropagation | 176.42ms | 123.85ms | 139.69ms (fail) | 164.63ms | 184.85ms | 1.55s |
| diamond | 283.33ms | 233.36ms | 202.86ms (fail) | 349.44ms | 282.20ms | 2.43s |
| mux | 411.37ms | 374.70ms | 192.03ms (fail) | 443.52ms | 389.86ms | 1.84s |
| repeatedObservers | 46.11ms | 43.69ms | 53.77ms (fail) | 80.59ms | 40.78ms | 231.63ms |
| triangle | 103.55ms | 85.25ms | 78.90ms (fail) | 113.84ms | 98.45ms | 777.16ms |
| unstable | 75.57ms | 61.13ms | 375.47ms (fail) | 94.50ms | 75.25ms | 347.28ms |
| molBench | 485.85ms | 490.31ms | 964μs | 497.23ms | 487.82ms | 582.89ms |
| create_signals | 30.63ms | 27.06ms | 63.26ms | 98.10ms | 5.38ms | 72.57ms |
| comp_0to1 | 12.11ms | 11.28ms | 54.88ms | 37.03ms | 17.32ms | 32.98ms |
| comp_1to1 | 28.40ms | 8.18ms | 57.32ms | 40.23ms | 10.55ms | 25.40ms |
| comp_2to1 | 9.82ms | 4.54ms | 38.42ms | 14.02ms | 12.73ms | 9.20ms |
| comp_4to1 | 1.88ms | 19.45ms | 16.51ms | 25.31ms | 14.11ms | 16.83ms |
| comp_1000to1 | 6μs | 3μs | 43μs | 19μs | 4μs | 15μs |
| comp_1to2 | 15.57ms | 8.96ms | 47.78ms | 33.66ms | 18.27ms | 35.05ms |
| comp_1to4 | 9.62ms | 11.40ms | 45.86ms | 16.73ms | 42.74ms | 19.57ms |
| comp_1to8 | 8.90ms | 4.32ms | 44.89ms | 22.88ms | 8.83ms | 22.40ms |
| comp_1to1000 | 4.39ms | 3.17ms | 41.36ms | 13.79ms | 6.17ms | 15.81ms |
| update_1to1 | 10.24ms | 10.06ms | 6.02ms | 16.34ms | 8.29ms | 28.24ms |
| update_2to1 | 4.59ms | 2.19ms | 3.09ms | 8.03ms | 4.40ms | 13.81ms |
| update_4to1 | 2.54ms | 2.50ms | 1.52ms | 4.08ms | 2.09ms | 7.08ms |
| update_1000to1 | 25μs | 19μs | 15μs | 40μs | 20μs | 67μs |
| update_1to2 | 4.53ms | 4.71ms | 3.01ms | 8.20ms | 4.07ms | 13.80ms |
| update_1to4 | 2.56ms | 2.52ms | 1.53ms | 4.08ms | 2.10ms | 6.95ms |
| update_1to1000 | 42μs | 46μs | 410μs | 159μs | 213μs | 169μs |
| cellx1000 | 9.59ms | 9.45ms | 5.12ms | 14.51ms | 9.72ms | 91.69ms |
| cellx2500 | 31.22ms | 22.44ms | 24.10ms | 32.72ms | 27.40ms | 276.98ms |
| cellx5000 | 62.09ms | 44.76ms | 65.56ms | 85.20ms | 71.73ms | 582.18ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.23ms | 233.68ms | 253.46ms | 356.53ms | 453.54ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.89ms | 179.77ms | 198.39ms | 247.43ms | 273.11ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.96s | 280.87ms | 344.56ms | 463.06ms | 3.70s | 1.93s |
| 1000x5 - 25 sources (wide dense) | 3.44s | 416.09ms | 560.31ms | 613.86ms | 2.74s | 3.49s |
| 5x500 - 3 sources (deep) | 224.30ms | 195.30ms | 206.27ms | 259.18ms | 231.82ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.31ms | 269.07ms | 262.99ms | 390.90ms | 457.36ms | 1.70s |

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
