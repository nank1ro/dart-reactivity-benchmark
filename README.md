# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.28s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.04s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.29s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.70s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 274.29ms | 196.46ms | 2.31s | 186.61ms | 206.57ms | 152.03ms (fail) |
| broadPropagation | 505.35ms | 457.91ms | 4.26s | 360.68ms | 462.33ms | 6.50ms (fail) |
| deepPropagation | 174.26ms | 175.79ms | 1.53s | 121.53ms | 176.33ms | 141.72ms (fail) |
| diamond | 361.58ms | 282.84ms | 2.42s | 235.08ms | 291.33ms | 198.33ms (fail) |
| mux | 445.40ms | 392.51ms | 1.85s | 371.67ms | 416.23ms | 189.98ms (fail) |
| repeatedObservers | 78.18ms | 38.20ms | 228.75ms | 44.97ms | 46.29ms | 53.64ms (fail) |
| triangle | 120.20ms | 105.11ms | 767.44ms | 86.26ms | 106.15ms | 82.17ms (fail) |
| unstable | 93.70ms | 71.79ms | 346.05ms | 60.01ms | 71.89ms | 338.90ms (fail) |
| molBench | 493.69ms | 491.19ms | 531.49ms | 492.56ms | 489.49ms | 1.17ms |
| create_signals | 57.20ms | 4.59ms | 91.65ms | 27.38ms | 25.49ms | 71.83ms |
| comp_0to1 | 25.30ms | 17.74ms | 27.59ms | 8.31ms | 12.40ms | 66.44ms |
| comp_1to1 | 30.82ms | 14.59ms | 43.13ms | 4.40ms | 28.10ms | 59.73ms |
| comp_2to1 | 18.81ms | 20.73ms | 34.26ms | 2.28ms | 11.99ms | 40.70ms |
| comp_4to1 | 12.57ms | 11.98ms | 17.92ms | 8.72ms | 2.05ms | 18.12ms |
| comp_1000to1 | 18μs | 4μs | 20μs | 3μs | 4μs | 47μs |
| comp_1to2 | 32.69ms | 18.12ms | 35.35ms | 13.13ms | 23.13ms | 50.45ms |
| comp_1to4 | 18.81ms | 35.12ms | 19.82ms | 5.37ms | 24.09ms | 49.16ms |
| comp_1to8 | 24.54ms | 7.51ms | 23.25ms | 6.25ms | 8.38ms | 48.50ms |
| comp_1to1000 | 14.86ms | 5.70ms | 15.15ms | 3.48ms | 6.86ms | 43.91ms |
| update_1to1 | 16.17ms | 8.15ms | 24.58ms | 11.29ms | 9.31ms | 5.72ms |
| update_2to1 | 7.92ms | 4.08ms | 11.69ms | 5.05ms | 4.64ms | 2.87ms |
| update_4to1 | 4.03ms | 2.04ms | 6.46ms | 2.81ms | 2.35ms | 1.45ms |
| update_1000to1 | 40μs | 20μs | 56μs | 10μs | 23μs | 15μs |
| update_1to2 | 7.93ms | 4.05ms | 11.68ms | 5.57ms | 4.93ms | 2.94ms |
| update_1to4 | 4.02ms | 2.03ms | 6.21ms | 2.54ms | 2.34ms | 1.46ms |
| update_1to1000 | 151μs | 159μs | 161μs | 49μs | 46μs | 421μs |
| cellx1000 | 11.65ms | 10.29ms | 71.30ms | 7.44ms | 10.43ms | 5.31ms |
| cellx2500 | 35.25ms | 33.80ms | 260.40ms | 20.05ms | 30.07ms | 23.09ms |
| cellx5000 | 96.87ms | 91.10ms | 598.24ms | 47.61ms | 76.05ms | 63.56ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.97ms | 454.05ms | 2.01s | 234.96ms | 508.91ms | 251.97ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 246.69ms | 276.38ms | 1.59s | 177.56ms | 278.45ms | 201.82ms |
| 1000x12 - 4 sources - dynamic (large) | 471.55ms | 3.53s | 1.95s | 288.91ms | 3.73s | 342.33ms |
| 1000x5 - 25 sources (wide dense) | 596.13ms | 2.59s | 3.65s | 412.14ms | 3.52s | 518.99ms |
| 5x500 - 3 sources (deep) | 255.66ms | 230.76ms | 1.17s | 191.92ms | 227.17ms | 206.06ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.79ms | 449.94ms | 1.79s | 262.89ms | 471.54ms | 261.10ms |

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
