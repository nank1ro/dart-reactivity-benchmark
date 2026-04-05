# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.70s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 10.72s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.90s |
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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 275.05ms | 193.28ms | 150.09ms (fail) | 205.58ms | 2.25s | 202.23ms |
| broadPropagation | 503.15ms | 356.72ms | 6.03ms (fail) | 454.99ms | 4.29s | 468.07ms |
| deepPropagation | 163.92ms | 128.33ms | 137.44ms (fail) | 174.88ms | 1.54s | 174.91ms |
| diamond | 351.00ms | 245.88ms | 196.54ms (fail) | 284.12ms | 2.35s | 286.36ms |
| mux | 422.32ms | 364.33ms | 191.74ms (fail) | 377.99ms | 1.78s | 405.00ms |
| repeatedObservers | 80.67ms | 45.84ms | 56.28ms (fail) | 42.07ms | 223.14ms | 45.50ms |
| triangle | 113.79ms | 88.78ms | 78.22ms (fail) | 100.13ms | 753.44ms | 102.47ms |
| unstable | 95.48ms | 61.86ms | 336.97ms (fail) | 71.83ms | 340.07ms | 75.61ms |
| molBench | 490.62ms | 481.90ms | 1.35ms | 496.11ms | 615.18ms | 494.60ms |
| create_signals | 76.54ms | 27.05ms | 67.43ms | 4.75ms | 52.57ms | 27.14ms |
| comp_0to1 | 25.68ms | 8.07ms | 54.38ms | 18.15ms | 14.81ms | 11.80ms |
| comp_1to1 | 49.69ms | 4.29ms | 55.07ms | 13.55ms | 41.23ms | 27.31ms |
| comp_2to1 | 25.19ms | 2.33ms | 37.33ms | 17.26ms | 23.59ms | 10.39ms |
| comp_4to1 | 11.46ms | 8.68ms | 16.84ms | 15.99ms | 27.42ms | 1.99ms |
| comp_1000to1 | 19μs | 5μs | 42μs | 6μs | 20μs | 4μs |
| comp_1to2 | 27.07ms | 14.50ms | 46.32ms | 13.40ms | 36.40ms | 15.61ms |
| comp_1to4 | 20.62ms | 9.07ms | 45.16ms | 26.88ms | 30.83ms | 6.96ms |
| comp_1to8 | 23.32ms | 4.89ms | 43.23ms | 7.05ms | 20.25ms | 6.53ms |
| comp_1to1000 | 13.98ms | 3.40ms | 40.09ms | 4.52ms | 14.79ms | 4.16ms |
| update_1to1 | 15.64ms | 4.68ms | 8.90ms | 9.02ms | 21.35ms | 8.86ms |
| update_2to1 | 7.87ms | 2.31ms | 2.91ms | 4.62ms | 10.44ms | 4.42ms |
| update_4to1 | 3.94ms | 1.16ms | 2.35ms | 2.33ms | 5.33ms | 2.23ms |
| update_1000to1 | 39μs | 11μs | 15μs | 23μs | 52μs | 22μs |
| update_1to2 | 8.06ms | 2.32ms | 5.27ms | 4.49ms | 10.96ms | 4.40ms |
| update_1to4 | 3.93ms | 1.15ms | 1.49ms | 2.44ms | 5.25ms | 2.25ms |
| update_1to1000 | 158μs | 29μs | 397μs | 187μs | 154μs | 42μs |
| cellx1000 | 13.01ms | 7.38ms | 6.40ms | 10.11ms | 87.00ms | 9.96ms |
| cellx2500 | 48.92ms | 19.34ms | 29.28ms | 29.04ms | 245.28ms | 36.00ms |
| cellx5000 | 164.99ms | 42.33ms | 104.64ms | 82.41ms | 647.59ms | 79.77ms |
| 10x5 - 2 sources - read 20.0% (simple) | 350.66ms | 240.40ms | 239.69ms | 450.79ms | 1.98s | 514.10ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 247.86ms | 178.59ms | 198.13ms | 271.58ms | 1.51s | 280.35ms |
| 1000x12 - 4 sources - dynamic (large) | 473.42ms | 278.07ms | 353.55ms | 3.83s | 1.78s | 3.51s |
| 1000x5 - 25 sources (wide dense) | 602.00ms | 416.29ms | 522.15ms | 2.81s | 3.38s | 3.19s |
| 5x500 - 3 sources (deep) | 255.37ms | 193.22ms | 207.87ms | 233.15ms | 1.14s | 232.21ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 387.54ms | 264.05ms | 260.84ms | 453.15ms | 1.67s | 477.70ms |

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
