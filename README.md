# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.51s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.31s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.15s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.50s |
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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.36ms | 161.07ms (fail) | 270.62ms | 212.26ms | 191.96ms | 2.35s |
| broadPropagation | 465.06ms | 6.64ms (fail) | 486.65ms | 461.94ms | 353.11ms | 4.38s |
| deepPropagation | 182.13ms | 140.96ms (fail) | 164.04ms | 170.96ms | 128.62ms | 1.53s |
| diamond | 279.94ms | 200.49ms (fail) | 355.93ms | 283.91ms | 235.51ms | 2.40s |
| mux | 396.07ms | 194.44ms (fail) | 430.70ms | 410.38ms | 378.18ms | 1.84s |
| repeatedObservers | 40.04ms | 52.51ms (fail) | 82.08ms | 45.97ms | 43.54ms | 235.06ms |
| triangle | 98.32ms | 81.48ms (fail) | 115.67ms | 103.45ms | 85.98ms | 758.82ms |
| unstable | 74.25ms | 344.83ms (fail) | 99.81ms | 76.34ms | 59.99ms | 345.32ms |
| molBench | 487.68ms | 966μs | 499.87ms | 485.49ms | 489.42ms | 582.56ms |
| create_signals | 5.35ms | 61.76ms | 77.28ms | 25.15ms | 20.55ms | 78.04ms |
| comp_0to1 | 17.77ms | 55.71ms | 25.62ms | 11.54ms | 7.84ms | 41.81ms |
| comp_1to1 | 12.60ms | 57.86ms | 49.53ms | 28.51ms | 4.14ms | 26.67ms |
| comp_2to1 | 10.22ms | 38.04ms | 17.57ms | 14.36ms | 2.34ms | 30.30ms |
| comp_4to1 | 8.62ms | 16.74ms | 22.51ms | 2.01ms | 8.45ms | 15.93ms |
| comp_1000to1 | 4μs | 45μs | 19μs | 4μs | 3μs | 17μs |
| comp_1to2 | 24.64ms | 48.99ms | 39.09ms | 20.12ms | 15.69ms | 41.52ms |
| comp_1to4 | 21.30ms | 46.59ms | 17.20ms | 10.33ms | 6.26ms | 24.58ms |
| comp_1to8 | 7.74ms | 46.08ms | 23.43ms | 9.02ms | 6.31ms | 25.57ms |
| comp_1to1000 | 9.15ms | 41.80ms | 14.27ms | 5.64ms | 3.52ms | 16.59ms |
| update_1to1 | 8.46ms | 6.03ms | 16.30ms | 10.21ms | 10.00ms | 25.52ms |
| update_2to1 | 4.44ms | 3.10ms | 8.70ms | 4.52ms | 2.36ms | 12.80ms |
| update_4to1 | 2.10ms | 1.54ms | 4.77ms | 2.54ms | 2.48ms | 6.67ms |
| update_1000to1 | 20μs | 15μs | 39μs | 25μs | 18μs | 64μs |
| update_1to2 | 4.06ms | 3.02ms | 8.18ms | 4.50ms | 5.04ms | 12.69ms |
| update_1to4 | 2.09ms | 1.54ms | 4.07ms | 2.56ms | 2.41ms | 6.32ms |
| update_1to1000 | 50μs | 417μs | 151μs | 42μs | 60μs | 181μs |
| cellx1000 | 9.71ms | 6.03ms | 12.70ms | 9.66ms | 10.69ms | 74.21ms |
| cellx2500 | 26.57ms | 22.86ms | 38.69ms | 32.51ms | 19.06ms | 269.34ms |
| cellx5000 | 70.82ms | 63.92ms | 93.84ms | 63.98ms | 42.50ms | 582.92ms |
| 10x5 - 2 sources - read 20.0% (simple) | 511.04ms | 265.90ms | 353.32ms | 495.00ms | 233.43ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 287.65ms | 205.82ms | 257.41ms | 282.94ms | 176.08ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 350.56ms | 465.54ms | 3.73s | 286.84ms | 1.93s |
| 1000x5 - 25 sources (wide dense) | 2.76s | 516.82ms | 611.41ms | 3.41s | 409.20ms | 3.48s |
| 5x500 - 3 sources (deep) | 250.76ms | 212.90ms | 255.54ms | 225.45ms | 196.54ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 465.83ms | 266.18ms | 387.11ms | 492.37ms | 265.02ms | 1.72s |

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
