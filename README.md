# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.78s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.31s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.21s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.49s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.87s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 212.29ms | 194.71ms | 164.51ms (fail) | 270.97ms | 209.16ms | 2.35s |
| broadPropagation | 457.17ms | 350.08ms | 6.37ms (fail) | 503.63ms | 456.43ms | 4.47s |
| deepPropagation | 174.53ms | 125.73ms | 137.50ms (fail) | 163.77ms | 180.95ms | 1.54s |
| diamond | 280.89ms | 235.76ms | 208.90ms (fail) | 352.89ms | 278.92ms | 2.40s |
| mux | 413.54ms | 375.15ms | 192.04ms (fail) | 444.56ms | 396.38ms | 1.88s |
| repeatedObservers | 46.65ms | 44.85ms | 52.71ms (fail) | 81.64ms | 40.57ms | 229.12ms |
| triangle | 103.00ms | 86.60ms | 82.69ms (fail) | 113.90ms | 98.53ms | 776.17ms |
| unstable | 75.59ms | 60.85ms | 339.20ms (fail) | 95.97ms | 74.96ms | 343.32ms |
| molBench | 485.69ms | 489.42ms | 1.03ms | 499.69ms | 488.64ms | 581.17ms |
| create_signals | 25.15ms | 28.86ms | 62.30ms | 65.16ms | 5.28ms | 83.03ms |
| comp_0to1 | 11.59ms | 7.30ms | 56.31ms | 25.20ms | 17.70ms | 15.99ms |
| comp_1to1 | 28.24ms | 4.28ms | 59.45ms | 47.24ms | 15.23ms | 46.52ms |
| comp_2to1 | 10.00ms | 2.29ms | 38.40ms | 33.11ms | 20.93ms | 23.07ms |
| comp_4to1 | 2.00ms | 11.23ms | 18.95ms | 4.22ms | 15.25ms | 17.08ms |
| comp_1000to1 | 5μs | 4μs | 44μs | 29μs | 4μs | 20μs |
| comp_1to2 | 22.18ms | 20.64ms | 48.16ms | 26.87ms | 24.91ms | 41.34ms |
| comp_1to4 | 13.92ms | 11.53ms | 47.23ms | 23.88ms | 31.10ms | 19.28ms |
| comp_1to8 | 6.45ms | 7.17ms | 46.95ms | 20.76ms | 8.15ms | 23.52ms |
| comp_1to1000 | 4.46ms | 3.02ms | 41.12ms | 14.13ms | 7.21ms | 15.30ms |
| update_1to1 | 10.25ms | 10.09ms | 6.00ms | 16.29ms | 9.32ms | 24.08ms |
| update_2to1 | 4.54ms | 2.19ms | 3.12ms | 8.04ms | 4.93ms | 13.01ms |
| update_4to1 | 2.57ms | 2.50ms | 1.55ms | 4.20ms | 2.31ms | 7.07ms |
| update_1000to1 | 25μs | 10μs | 15μs | 39μs | 21μs | 69μs |
| update_1to2 | 4.54ms | 4.74ms | 3.04ms | 8.38ms | 4.57ms | 12.51ms |
| update_1to4 | 2.56ms | 2.26ms | 1.56ms | 4.13ms | 2.26ms | 7.01ms |
| update_1to1000 | 43μs | 46μs | 413μs | 162μs | 840μs | 168μs |
| cellx1000 | 9.78ms | 7.22ms | 5.52ms | 14.89ms | 9.99ms | 77.92ms |
| cellx2500 | 33.77ms | 20.02ms | 31.25ms | 41.48ms | 30.18ms | 257.19ms |
| cellx5000 | 76.31ms | 59.20ms | 79.01ms | 106.85ms | 90.98ms | 607.10ms |
| 10x5 - 2 sources - read 20.0% (simple) | 511.20ms | 263.61ms | 256.06ms | 355.02ms | 450.86ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.27ms | 181.74ms | 194.78ms | 254.58ms | 277.18ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 291.10ms | 343.49ms | 457.52ms | 3.77s | 2.06s |
| 1000x5 - 25 sources (wide dense) | 3.45s | 410.70ms | 496.58ms | 607.24ms | 2.76s | 3.49s |
| 5x500 - 3 sources (deep) | 223.16ms | 190.84ms | 205.96ms | 252.58ms | 237.13ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.16ms | 269.60ms | 260.10ms | 386.23ms | 462.16ms | 1.79s |

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
