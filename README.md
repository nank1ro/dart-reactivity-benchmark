# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.77s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 9.93s |
| 🥉 | solidart(2.0-dev) | 0.24 | 100.0% | 35/35 | 5.60s |
| 4 | signals | 0.23 | 100.0% | 35/35 | 11.24s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.85s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 217.98ms | 265.09ms | 2.27s | 185.27ms | 155.96ms (fail) | 210.94ms |
| broadPropagation | 509.32ms | 490.83ms | 4.20s | 358.73ms | 6.46ms (fail) | 523.31ms |
| deepPropagation | 196.28ms | 163.44ms | 1.47s | 117.27ms | 150.72ms (fail) | 182.94ms |
| diamond | 281.33ms | 376.92ms | 2.26s | 266.21ms | 187.34ms (fail) | 288.53ms |
| mux | 387.50ms | 430.85ms | 1.71s | 371.85ms | 185.45ms (fail) | 389.45ms |
| repeatedObservers | 41.63ms | 88.82ms | 228.69ms | 42.94ms | 54.08ms (fail) | 46.60ms |
| triangle | 105.88ms | 121.30ms | 722.34ms | 86.80ms | 78.27ms (fail) | 108.20ms |
| unstable | 73.60ms | 105.69ms | 345.66ms | 59.90ms | 345.13ms (fail) | 79.01ms |
| molBench | 547.36ms | 558.91ms | 642.87ms | 552.34ms | 1.02ms | 547.43ms |
| create_signals | 6.54ms | 111.71ms | 83.37ms | 30.81ms | 62.63ms | 29.51ms |
| comp_0to1 | 20.36ms | 39.96ms | 32.69ms | 9.15ms | 54.68ms | 13.07ms |
| comp_1to1 | 15.62ms | 46.21ms | 34.26ms | 4.14ms | 57.06ms | 27.11ms |
| comp_2to1 | 19.85ms | 42.96ms | 42.55ms | 2.25ms | 40.65ms | 13.95ms |
| comp_4to1 | 13.10ms | 14.61ms | 19.85ms | 13.43ms | 16.91ms | 6.45ms |
| comp_1000to1 | 4μs | 16μs | 16μs | 4μs | 41μs | 5μs |
| comp_1to2 | 32.02ms | 38.37ms | 39.38ms | 20.40ms | 45.12ms | 32.68ms |
| comp_1to4 | 24.32ms | 21.59ms | 17.25ms | 6.00ms | 45.20ms | 22.06ms |
| comp_1to8 | 9.77ms | 25.51ms | 20.01ms | 4.10ms | 42.65ms | 6.46ms |
| comp_1to1000 | 3.38ms | 14.79ms | 14.71ms | 3.47ms | 36.88ms | 4.06ms |
| update_1to1 | 9.17ms | 16.40ms | 24.68ms | 4.38ms | 6.21ms | 10.32ms |
| update_2to1 | 4.22ms | 8.19ms | 12.19ms | 2.29ms | 3.24ms | 5.07ms |
| update_4to1 | 2.10ms | 4.08ms | 6.58ms | 1.11ms | 1.61ms | 2.54ms |
| update_1000to1 | 20μs | 40μs | 59μs | 11μs | 17μs | 26μs |
| update_1to2 | 4.21ms | 8.40ms | 12.25ms | 2.22ms | 3.14ms | 5.10ms |
| update_1to4 | 2.10ms | 4.08ms | 6.13ms | 1.11ms | 1.57ms | 2.55ms |
| update_1to1000 | 35μs | 143μs | 155μs | 27μs | 357μs | 60μs |
| cellx1000 | 14.71ms | 12.49ms | 101.58ms | 7.18ms | 10.59ms | 9.70ms |
| cellx2500 | 41.74ms | 59.94ms | 339.85ms | 24.77ms | 32.72ms | 36.21ms |
| cellx5000 | 129.65ms | 145.28ms | 752.83ms | 58.85ms | 91.18ms | 95.52ms |
| 10x5 - 2 sources - read 20.0% (simple) | 426.24ms | 403.86ms | 2.01s | 241.82ms | 250.34ms | 505.65ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 265.36ms | 273.84ms | 1.41s | 183.65ms | 202.90ms | 281.84ms |
| 1000x12 - 4 sources - dynamic (large) | 3.32s | 438.61ms | 1.78s | 267.88ms | 321.07ms | 3.57s |
| 1000x5 - 25 sources (wide dense) | 2.53s | 642.74ms | 3.41s | 413.03ms | 467.47ms | 3.49s |
| 5x500 - 3 sources (deep) | 232.42ms | 268.72ms | 1.16s | 190.74ms | 202.64ms | 230.25ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 436.11ms | 352.37ms | 1.68s | 234.10ms | 236.08ms | 467.42ms |

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
