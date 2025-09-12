# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.73s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 10.34s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.30s |
| 4 | signals | 0.28 | 100.0% | 35/35 | 11.58s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.83s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.60s |

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
| avoidablePropagation | 202.35ms | 160.57ms (fail) | 264.95ms | 216.86ms | 194.47ms | 2.38s |
| broadPropagation | 467.17ms | 6.41ms (fail) | 513.46ms | 458.21ms | 351.80ms | 4.43s |
| deepPropagation | 181.62ms | 142.26ms (fail) | 164.38ms | 177.09ms | 127.96ms | 1.55s |
| diamond | 288.01ms | 184.93ms (fail) | 357.03ms | 291.94ms | 236.50ms | 2.44s |
| mux | 386.17ms | 196.59ms (fail) | 437.56ms | 413.52ms | 380.66ms | 1.86s |
| repeatedObservers | 41.87ms | 52.85ms (fail) | 80.84ms | 46.60ms | 43.71ms | 231.21ms |
| triangle | 103.55ms | 79.18ms (fail) | 113.64ms | 104.40ms | 84.32ms | 753.64ms |
| unstable | 75.24ms | 342.43ms (fail) | 94.95ms | 77.00ms | 59.89ms | 345.97ms |
| molBench | 489.69ms | 1.04ms | 494.02ms | 485.94ms | 489.02ms | 584.22ms |
| create_signals | 5.24ms | 67.47ms | 97.90ms | 24.57ms | 22.23ms | 69.38ms |
| comp_0to1 | 17.72ms | 65.75ms | 35.70ms | 10.82ms | 7.28ms | 31.42ms |
| comp_1to1 | 14.78ms | 60.40ms | 56.27ms | 21.15ms | 4.20ms | 41.36ms |
| comp_2to1 | 11.39ms | 41.42ms | 10.07ms | 9.02ms | 2.32ms | 21.77ms |
| comp_4to1 | 11.00ms | 17.41ms | 14.32ms | 2.86ms | 8.34ms | 16.00ms |
| comp_1000to1 | 7μs | 45μs | 19μs | 5μs | 5μs | 22μs |
| comp_1to2 | 11.92ms | 50.40ms | 30.23ms | 16.80ms | 23.78ms | 38.49ms |
| comp_1to4 | 15.70ms | 47.85ms | 23.86ms | 7.33ms | 4.81ms | 21.14ms |
| comp_1to8 | 5.73ms | 47.66ms | 25.08ms | 6.55ms | 4.79ms | 23.94ms |
| comp_1to1000 | 4.67ms | 42.89ms | 14.74ms | 4.39ms | 3.17ms | 14.96ms |
| update_1to1 | 8.28ms | 7.49ms | 17.55ms | 10.25ms | 10.12ms | 27.86ms |
| update_2to1 | 4.39ms | 4.00ms | 8.48ms | 4.50ms | 2.14ms | 14.15ms |
| update_4to1 | 2.10ms | 1.97ms | 4.34ms | 2.59ms | 2.49ms | 7.55ms |
| update_1000to1 | 20μs | 16μs | 42μs | 25μs | 16μs | 69μs |
| update_1to2 | 4.10ms | 3.76ms | 8.78ms | 4.49ms | 4.96ms | 12.82ms |
| update_1to4 | 2.09ms | 1.91ms | 4.36ms | 2.52ms | 2.42ms | 7.08ms |
| update_1to1000 | 44μs | 435μs | 154μs | 42μs | 49μs | 172μs |
| cellx1000 | 9.59ms | 7.23ms | 11.84ms | 9.58ms | 8.46ms | 85.69ms |
| cellx2500 | 26.45ms | 26.36ms | 33.63ms | 32.95ms | 19.95ms | 295.77ms |
| cellx5000 | 85.66ms | 80.28ms | 72.00ms | 67.94ms | 55.76ms | 585.90ms |
| 10x5 - 2 sources - read 20.0% (simple) | 453.91ms | 235.92ms | 348.58ms | 504.15ms | 237.23ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 274.68ms | 208.35ms | 250.23ms | 282.17ms | 179.66ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.71s | 374.62ms | 459.02ms | 4.02s | 289.97ms | 2.04s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 560.49ms | 609.66ms | 3.57s | 406.12ms | 3.51s |
| 5x500 - 3 sources (deep) | 229.95ms | 206.18ms | 254.38ms | 222.27ms | 194.82ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 466.89ms | 274.58ms | 383.58ms | 471.47ms | 261.90ms | 1.73s |

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
