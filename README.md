# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.82s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.38s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.55s |
| 4 | signals | 0.23 | 100.0% | 35/35 | 11.24s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.82s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.38s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.24s | 215.58ms | 185.37ms | 217.28ms | 273.75ms | 151.84ms (fail) |
| broadPropagation | 4.19s | 486.13ms | 360.44ms | 530.80ms | 489.31ms | 5.99ms (fail) |
| deepPropagation | 1.49s | 180.00ms | 116.55ms | 197.37ms | 163.64ms | 149.49ms (fail) |
| diamond | 2.24s | 305.36ms | 267.79ms | 286.59ms | 368.71ms | 189.99ms (fail) |
| mux | 1.74s | 386.89ms | 376.87ms | 389.04ms | 423.79ms | 191.64ms (fail) |
| repeatedObservers | 229.57ms | 46.14ms | 43.71ms | 42.22ms | 87.82ms | 54.81ms (fail) |
| triangle | 730.26ms | 105.35ms | 91.02ms | 105.64ms | 122.31ms | 83.24ms (fail) |
| unstable | 340.11ms | 77.68ms | 60.66ms | 72.74ms | 107.12ms | 345.02ms (fail) |
| molBench | 643.14ms | 548.22ms | 560.91ms | 547.84ms | 568.41ms | 1.01ms |
| create_signals | 91.87ms | 29.52ms | 25.74ms | 4.89ms | 96.05ms | 68.36ms |
| comp_0to1 | 16.19ms | 13.06ms | 9.29ms | 20.46ms | 49.15ms | 60.32ms |
| comp_1to1 | 47.15ms | 40.30ms | 4.18ms | 14.99ms | 29.96ms | 56.13ms |
| comp_2to1 | 31.18ms | 24.62ms | 2.22ms | 18.63ms | 50.72ms | 44.69ms |
| comp_4to1 | 19.65ms | 17.32ms | 9.30ms | 12.97ms | 6.96ms | 19.66ms |
| comp_1000to1 | 15μs | 6μs | 3μs | 4μs | 14μs | 39μs |
| comp_1to2 | 38.97ms | 12.96ms | 12.27ms | 30.39ms | 37.97ms | 47.68ms |
| comp_1to4 | 17.18ms | 15.32ms | 12.38ms | 21.39ms | 21.23ms | 45.40ms |
| comp_1to8 | 20.45ms | 12.54ms | 3.98ms | 6.84ms | 24.68ms | 42.09ms |
| comp_1to1000 | 14.60ms | 4.23ms | 3.06ms | 3.77ms | 14.49ms | 36.23ms |
| update_1to1 | 23.47ms | 9.47ms | 4.92ms | 9.55ms | 16.97ms | 6.40ms |
| update_2to1 | 11.96ms | 4.96ms | 2.47ms | 4.88ms | 8.41ms | 3.31ms |
| update_4to1 | 7.66ms | 2.37ms | 1.28ms | 2.42ms | 4.24ms | 1.50ms |
| update_1000to1 | 56μs | 22μs | 11μs | 23μs | 43μs | 15μs |
| update_1to2 | 12.18ms | 4.74ms | 2.45ms | 4.78ms | 8.66ms | 3.02ms |
| update_1to4 | 5.66ms | 2.41ms | 1.25ms | 2.43ms | 4.23ms | 1.50ms |
| update_1to1000 | 159μs | 42μs | 43μs | 45μs | 145μs | 365μs |
| cellx1000 | 98.80ms | 9.99ms | 7.30ms | 10.42ms | 13.46ms | 5.51ms |
| cellx2500 | 319.78ms | 38.26ms | 21.87ms | 36.09ms | 53.29ms | 28.66ms |
| cellx5000 | 701.30ms | 119.92ms | 61.86ms | 117.19ms | 164.72ms | 79.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.01s | 502.92ms | 246.48ms | 426.38ms | 379.99ms | 247.90ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.43s | 272.77ms | 194.15ms | 270.08ms | 275.21ms | 201.98ms |
| 1000x12 - 4 sources - dynamic (large) | 1.75s | 3.65s | 272.29ms | 3.54s | 426.63ms | 306.96ms |
| 1000x5 - 25 sources (wide dense) | 3.42s | 3.40s | 418.31ms | 2.76s | 643.38ms | 465.15ms |
| 5x500 - 3 sources (deep) | 1.17s | 230.19ms | 206.70ms | 235.20ms | 264.66ms | 200.56ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.72s | 468.30ms | 235.67ms | 439.41ms | 347.96ms | 238.54ms |

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
