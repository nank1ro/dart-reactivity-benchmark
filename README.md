# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.75s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.73s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.50s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.29s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.93s |
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
| Test Case | alien_signals | signals | preact_signals | solidart | state_beacon | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 187.33ms | 207.01ms | 209.74ms | 2.19s | 158.72ms (fail) | 2.35s |
| broadPropagation | 347.20ms | 463.79ms | 461.76ms | 5.64s | 6.06ms (fail) | 4.30s |
| deepPropagation | 123.17ms | 175.19ms | 172.46ms | 2.05s | 141.04ms (fail) | 1.52s |
| diamond | 239.83ms | 289.82ms | 273.11ms | 3.44s | 189.37ms (fail) | 2.43s |
| mux | 385.60ms | 411.50ms | 386.02ms | 2.07s | 192.46ms (fail) | 1.79s |
| repeatedObservers | 43.79ms | 45.17ms | 41.59ms | 209.87ms | 53.83ms (fail) | 239.25ms |
| triangle | 85.63ms | 101.62ms | 100.21ms | 1.14s | 83.25ms (fail) | 766.05ms |
| unstable | 60.59ms | 77.75ms | 71.69ms | 343.27ms | 347.56ms (fail) | 352.05ms |
| molBench | 487.19ms | 486.44ms | 483.28ms | 1.74s | 937μs | 572.46ms |
| create_signals | 20.98ms | 33.19ms | 4.57ms | 76.72ms | 73.34ms | 74.85ms |
| comp_0to1 | 5.10ms | 14.60ms | 16.96ms | 33.72ms | 53.66ms | 15.80ms |
| comp_1to1 | 11.53ms | 31.79ms | 15.04ms | 45.42ms | 52.81ms | 44.25ms |
| comp_2to1 | 5.79ms | 11.95ms | 16.09ms | 36.46ms | 34.31ms | 33.91ms |
| comp_4to1 | 8.99ms | 9.16ms | 11.41ms | 14.42ms | 17.79ms | 24.19ms |
| comp_1000to1 | 3μs | 5μs | 6μs | 2.13ms | 48μs | 16μs |
| comp_1to2 | 14.39ms | 20.09ms | 32.69ms | 30.36ms | 47.04ms | 33.11ms |
| comp_1to4 | 8.76ms | 17.40ms | 26.84ms | 28.90ms | 43.75ms | 18.37ms |
| comp_1to8 | 3.85ms | 8.99ms | 7.05ms | 25.73ms | 47.92ms | 20.92ms |
| comp_1to1000 | 3.63ms | 4.73ms | 5.87ms | 20.36ms | 40.37ms | 16.69ms |
| update_1to1 | 4.37ms | 9.37ms | 8.85ms | 43.18ms | 6.77ms | 28.25ms |
| update_2to1 | 2.77ms | 4.67ms | 4.37ms | 21.35ms | 2.90ms | 13.82ms |
| update_4to1 | 1.16ms | 2.37ms | 2.27ms | 10.88ms | 2.03ms | 7.50ms |
| update_1000to1 | 11μs | 23μs | 21μs | 116μs | 15μs | 69μs |
| update_1to2 | 2.21ms | 4.74ms | 4.36ms | 21.44ms | 3.87ms | 14.21ms |
| update_1to4 | 1.15ms | 2.36ms | 2.20ms | 10.99ms | 1.45ms | 6.92ms |
| update_1to1000 | 48μs | 46μs | 797μs | 223μs | 401μs | 158μs |
| cellx1000 | 8.65ms | 11.16ms | 9.65ms | 188.73ms | 5.21ms | 75.93ms |
| cellx2500 | 25.32ms | 44.88ms | 28.65ms | 519.18ms | 21.28ms | 265.05ms |
| cellx5000 | 73.76ms | 112.06ms | 93.30ms | 1.12s | 63.02ms | 605.13ms |
| 10x5 - 2 sources - read 20.0% (simple) | 230.67ms | 501.41ms | 429.67ms | 2.73s (partial) | 251.27ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 182.14ms | 281.01ms | 272.27ms | 2.42s (partial) | 208.99ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 289.16ms | 3.89s | 3.36s | 3.99s (partial) | 345.13ms | 1.80s |
| 1000x5 - 25 sources (wide dense) | 413.67ms | 3.51s | 2.52s | 4.91s (partial) | 520.78ms | 3.51s |
| 5x500 - 3 sources (deep) | 204.79ms | 231.36ms | 225.40ms | 1.99s (partial) | 230.66ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 266.76ms | 479.61ms | 438.99ms | 2.81s (partial) | 274.85ms | 1.70s |

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
