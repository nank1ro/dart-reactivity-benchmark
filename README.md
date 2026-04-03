# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.19s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.90s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.51s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.23s |
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
| avoidablePropagation | 275.09ms | 197.16ms | 150.29ms (fail) | 209.61ms | 2.33s | 201.26ms |
| broadPropagation | 496.94ms | 355.58ms | 5.97ms (fail) | 456.17ms | 4.36s | 472.57ms |
| deepPropagation | 166.90ms | 129.50ms | 137.73ms (fail) | 174.98ms | 1.55s | 174.40ms |
| diamond | 351.00ms | 246.38ms | 204.15ms (fail) | 285.07ms | 2.42s | 290.99ms |
| mux | 417.28ms | 362.91ms | 178.56ms (fail) | 372.12ms | 1.77s | 399.38ms |
| repeatedObservers | 80.64ms | 45.49ms | 56.97ms (fail) | 42.16ms | 229.92ms | 45.82ms |
| triangle | 113.16ms | 85.66ms | 79.75ms (fail) | 100.44ms | 773.76ms | 100.39ms |
| unstable | 95.01ms | 61.63ms | 335.63ms (fail) | 71.64ms | 349.55ms | 76.65ms |
| molBench | 490.12ms | 481.23ms | 1.13ms | 495.79ms | 586.19ms | 493.90ms |
| create_signals | 56.41ms | 28.50ms | 69.52ms | 8.17ms | 88.48ms | 26.59ms |
| comp_0to1 | 24.73ms | 7.93ms | 59.07ms | 27.70ms | 26.67ms | 11.65ms |
| comp_1to1 | 36.70ms | 4.41ms | 56.11ms | 12.36ms | 43.98ms | 27.89ms |
| comp_2to1 | 16.16ms | 2.32ms | 38.11ms | 18.19ms | 28.80ms | 19.05ms |
| comp_4to1 | 8.73ms | 7.75ms | 17.06ms | 11.32ms | 27.68ms | 1.95ms |
| comp_1000to1 | 15μs | 4μs | 44μs | 4μs | 27μs | 5μs |
| comp_1to2 | 32.19ms | 9.37ms | 46.56ms | 30.24ms | 34.18ms | 21.97ms |
| comp_1to4 | 16.97ms | 12.17ms | 46.02ms | 22.27ms | 22.28ms | 15.71ms |
| comp_1to8 | 20.96ms | 4.84ms | 44.68ms | 7.92ms | 22.63ms | 6.73ms |
| comp_1to1000 | 13.90ms | 3.30ms | 40.77ms | 9.78ms | 14.96ms | 4.13ms |
| update_1to1 | 15.60ms | 4.68ms | 8.57ms | 8.88ms | 21.58ms | 8.84ms |
| update_2to1 | 7.90ms | 2.34ms | 2.87ms | 4.57ms | 10.62ms | 4.44ms |
| update_4to1 | 3.94ms | 1.22ms | 2.05ms | 2.25ms | 5.46ms | 2.20ms |
| update_1000to1 | 39μs | 11μs | 15μs | 23μs | 52μs | 22μs |
| update_1to2 | 8.01ms | 2.33ms | 5.09ms | 4.40ms | 10.49ms | 4.45ms |
| update_1to4 | 3.94ms | 1.21ms | 1.48ms | 2.38ms | 5.59ms | 2.22ms |
| update_1to1000 | 156μs | 48μs | 400μs | 1.40ms | 158μs | 42μs |
| cellx1000 | 11.55ms | 7.28ms | 5.79ms | 10.64ms | 91.31ms | 9.94ms |
| cellx2500 | 33.41ms | 20.87ms | 33.97ms | 30.51ms | 265.50ms | 35.04ms |
| cellx5000 | 72.70ms | 53.33ms | 76.85ms | 92.78ms | 570.25ms | 76.89ms |
| 10x5 - 2 sources - read 20.0% (simple) | 349.70ms | 237.15ms | 249.16ms | 449.47ms | 2.00s | 499.06ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 252.93ms | 183.04ms | 200.94ms | 271.26ms | 1.51s | 279.70ms |
| 1000x12 - 4 sources - dynamic (large) | 475.67ms | 291.86ms | 352.81ms | 3.82s | 1.86s | 3.48s |
| 1000x5 - 25 sources (wide dense) | 608.84ms | 409.96ms | 523.80ms | 2.77s | 3.34s | 3.40s |
| 5x500 - 3 sources (deep) | 255.14ms | 195.20ms | 211.70ms | 230.69ms | 1.14s | 225.83ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 381.37ms | 269.80ms | 259.86ms | 445.49ms | 1.72s | 473.35ms |

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
