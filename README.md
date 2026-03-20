# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.37s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 10.78s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.48s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.86s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 202.18ms | 2.34s | 166.25ms (fail) | 194.97ms | 209.87ms | 279.17ms |
| broadPropagation | 457.72ms | 4.20s | 5.97ms (fail) | 354.04ms | 457.15ms | 517.01ms |
| deepPropagation | 171.50ms | 1.53s | 135.77ms (fail) | 128.11ms | 173.32ms | 166.13ms |
| diamond | 285.80ms | 2.41s | 187.69ms (fail) | 244.97ms | 293.49ms | 355.78ms |
| mux | 399.15ms | 1.73s | 184.77ms (fail) | 367.91ms | 378.69ms | 416.02ms |
| repeatedObservers | 46.10ms | 225.34ms | 55.81ms (fail) | 46.23ms | 42.62ms | 81.25ms |
| triangle | 103.16ms | 750.21ms | 76.84ms (fail) | 91.23ms | 100.32ms | 115.17ms |
| unstable | 75.85ms | 339.07ms | 336.26ms (fail) | 61.90ms | 71.81ms | 96.31ms |
| molBench | 494.54ms | 587.29ms | 990μs | 486.40ms | 495.58ms | 494.83ms |
| create_signals | 26.69ms | 72.84ms | 59.76ms | 28.59ms | 5.85ms | 92.74ms |
| comp_0to1 | 12.97ms | 27.13ms | 54.77ms | 8.16ms | 18.66ms | 33.58ms |
| comp_1to1 | 28.35ms | 37.88ms | 54.91ms | 4.40ms | 13.38ms | 50.38ms |
| comp_2to1 | 8.59ms | 35.42ms | 36.84ms | 2.39ms | 22.07ms | 37.49ms |
| comp_4to1 | 9.46ms | 24.38ms | 16.60ms | 7.63ms | 15.62ms | 4.53ms |
| comp_1000to1 | 4μs | 21μs | 43μs | 4μs | 4μs | 14μs |
| comp_1to2 | 24.89ms | 37.68ms | 46.03ms | 11.16ms | 18.40ms | 32.47ms |
| comp_1to4 | 9.40ms | 21.24ms | 45.26ms | 9.48ms | 33.93ms | 35.13ms |
| comp_1to8 | 12.49ms | 23.13ms | 44.15ms | 5.08ms | 8.46ms | 23.28ms |
| comp_1to1000 | 6.06ms | 15.43ms | 39.75ms | 3.57ms | 5.01ms | 14.79ms |
| update_1to1 | 8.98ms | 21.22ms | 7.35ms | 4.63ms | 8.96ms | 15.85ms |
| update_2to1 | 4.51ms | 10.39ms | 3.01ms | 2.32ms | 4.59ms | 7.85ms |
| update_4to1 | 2.23ms | 5.98ms | 1.79ms | 1.15ms | 2.33ms | 3.93ms |
| update_1000to1 | 22μs | 53μs | 15μs | 11μs | 23μs | 39μs |
| update_1to2 | 4.45ms | 10.38ms | 3.77ms | 2.34ms | 4.54ms | 8.03ms |
| update_1to4 | 2.26ms | 5.19ms | 1.48ms | 1.16ms | 2.38ms | 3.99ms |
| update_1to1000 | 42μs | 213μs | 388μs | 29μs | 207μs | 171μs |
| cellx1000 | 9.99ms | 75.69ms | 5.53ms | 10.15ms | 12.03ms | 16.00ms |
| cellx2500 | 34.64ms | 267.37ms | 24.52ms | 20.35ms | 26.97ms | 43.40ms |
| cellx5000 | 67.73ms | 609.45ms | 80.38ms | 44.34ms | 70.39ms | 110.30ms |
| 10x5 - 2 sources - read 20.0% (simple) | 495.73ms | 1.94s | 240.51ms | 246.74ms | 460.66ms | 350.46ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.84ms | 1.49s | 203.59ms | 183.25ms | 270.43ms | 249.90ms |
| 1000x12 - 4 sources - dynamic (large) | 3.61s | 1.87s | 341.11ms | 276.70ms | 3.78s | 463.38ms |
| 1000x5 - 25 sources (wide dense) | 3.18s | 3.37s | 499.98ms | 409.28ms | 2.79s | 606.26ms |
| 5x500 - 3 sources (deep) | 225.18ms | 1.10s | 205.55ms | 193.95ms | 231.94ms | 258.20ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.92ms | 1.68s | 263.26ms | 262.12ms | 448.09ms | 385.05ms |

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
