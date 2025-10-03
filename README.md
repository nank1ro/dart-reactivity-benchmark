# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.38s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.46s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.43s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.48s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| avoidablePropagation | 214.98ms | 193.91ms | 169.08ms (fail) | 264.16ms | 202.95ms | 2.32s |
| broadPropagation | 452.27ms | 355.35ms | 6.34ms (fail) | 500.70ms | 454.58ms | 4.42s |
| deepPropagation | 170.64ms | 125.28ms | 141.13ms (fail) | 162.49ms | 180.39ms | 1.55s |
| diamond | 284.63ms | 235.47ms | 211.83ms (fail) | 351.44ms | 283.64ms | 2.43s |
| mux | 412.08ms | 376.87ms | 194.02ms (fail) | 437.23ms | 401.46ms | 1.81s |
| repeatedObservers | 46.03ms | 43.72ms | 52.61ms (fail) | 80.77ms | 41.36ms | 226.96ms |
| triangle | 103.17ms | 84.81ms | 79.45ms (fail) | 113.06ms | 100.08ms | 774.19ms |
| unstable | 76.66ms | 60.05ms | 375.46ms (fail) | 95.14ms | 74.70ms | 338.40ms |
| molBench | 493.14ms | 489.73ms | 1.49ms | 496.74ms | 490.32ms | 590.78ms |
| create_signals | 27.89ms | 20.98ms | 65.68ms | 104.43ms | 13.21ms | 70.11ms |
| comp_0to1 | 12.23ms | 7.50ms | 57.00ms | 36.74ms | 19.12ms | 20.03ms |
| comp_1to1 | 28.66ms | 4.14ms | 63.48ms | 56.05ms | 8.52ms | 43.36ms |
| comp_2to1 | 9.13ms | 2.26ms | 39.93ms | 37.83ms | 13.72ms | 34.57ms |
| comp_4to1 | 7.83ms | 9.77ms | 17.29ms | 12.84ms | 26.52ms | 26.67ms |
| comp_1000to1 | 6μs | 4μs | 44μs | 15μs | 7μs | 20μs |
| comp_1to2 | 18.86ms | 19.29ms | 48.75ms | 23.50ms | 20.29ms | 39.46ms |
| comp_1to4 | 15.96ms | 7.35ms | 46.83ms | 25.59ms | 33.40ms | 23.97ms |
| comp_1to8 | 8.20ms | 6.95ms | 46.26ms | 24.84ms | 7.58ms | 25.47ms |
| comp_1to1000 | 4.85ms | 3.45ms | 42.29ms | 16.27ms | 6.21ms | 15.93ms |
| update_1to1 | 10.36ms | 8.68ms | 6.00ms | 16.20ms | 8.23ms | 27.90ms |
| update_2to1 | 4.80ms | 2.13ms | 3.10ms | 8.01ms | 4.45ms | 14.19ms |
| update_4to1 | 2.60ms | 2.48ms | 1.54ms | 4.12ms | 2.09ms | 7.16ms |
| update_1000to1 | 26μs | 22μs | 15μs | 39μs | 20μs | 69μs |
| update_1to2 | 4.71ms | 4.95ms | 3.02ms | 8.45ms | 4.07ms | 14.17ms |
| update_1to4 | 2.61ms | 2.45ms | 1.54ms | 4.06ms | 2.09ms | 7.11ms |
| update_1to1000 | 51μs | 46μs | 440μs | 153μs | 146μs | 191μs |
| cellx1000 | 10.58ms | 7.19ms | 5.23ms | 12.66ms | 10.31ms | 70.11ms |
| cellx2500 | 34.34ms | 19.34ms | 23.28ms | 40.38ms | 29.81ms | 253.88ms |
| cellx5000 | 94.08ms | 42.30ms | 55.97ms | 106.50ms | 85.48ms | 604.93ms |
| 10x5 - 2 sources - read 20.0% (simple) | 530.00ms | 237.17ms | 244.41ms | 356.36ms | 449.85ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.73ms | 179.62ms | 196.30ms | 258.82ms | 274.37ms | 1.56s |
| 1000x12 - 4 sources - dynamic (large) | 3.78s | 288.14ms | 338.16ms | 477.21ms | 3.74s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.58s | 409.18ms | 510.44ms | 607.72ms | 2.77s | 3.46s |
| 5x500 - 3 sources (deep) | 227.82ms | 195.58ms | 204.29ms | 252.93ms | 237.09ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 479.07ms | 261.64ms | 258.52ms | 383.61ms | 468.29ms | 1.70s |

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
