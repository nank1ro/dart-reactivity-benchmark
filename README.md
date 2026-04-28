# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.31s |
| 🥉 | preact_signals | 0.24 | 100.0% | 35/35 | 10.50s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.27s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.26s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 2.31s | 199.70ms | 199.15ms | 213.08ms | 277.50ms | 148.76ms (fail) |
| broadPropagation | 4.35s | 465.10ms | 358.76ms | 456.63ms | 497.99ms | 6.04ms (fail) |
| deepPropagation | 1.58s | 170.99ms | 128.14ms | 176.47ms | 164.19ms | 139.14ms (fail) |
| diamond | 2.47s | 287.13ms | 246.55ms | 286.26ms | 354.07ms | 180.68ms (fail) |
| mux | 1.76s | 408.56ms | 364.31ms | 373.81ms | 422.71ms | 177.31ms (fail) |
| repeatedObservers | 240.40ms | 45.47ms | 44.79ms | 41.99ms | 80.91ms | 58.43ms (fail) |
| triangle | 766.72ms | 100.33ms | 88.79ms | 103.20ms | 129.19ms | 77.74ms (fail) |
| unstable | 351.02ms | 75.52ms | 62.25ms | 71.86ms | 95.29ms | 341.63ms (fail) |
| molBench | 587.50ms | 494.19ms | 481.21ms | 496.30ms | 489.64ms | 1.02ms |
| create_signals | 54.72ms | 26.54ms | 27.73ms | 4.74ms | 76.31ms | 66.22ms |
| comp_0to1 | 14.90ms | 11.71ms | 8.73ms | 17.99ms | 26.38ms | 65.68ms |
| comp_1to1 | 42.02ms | 36.46ms | 4.35ms | 11.98ms | 38.25ms | 61.90ms |
| comp_2to1 | 38.63ms | 20.10ms | 2.36ms | 12.73ms | 40.95ms | 38.43ms |
| comp_4to1 | 25.34ms | 1.91ms | 8.70ms | 14.60ms | 12.70ms | 18.30ms |
| comp_1000to1 | 20μs | 27μs | 4μs | 5μs | 14μs | 47μs |
| comp_1to2 | 39.93ms | 21.66ms | 15.40ms | 19.65ms | 33.32ms | 51.26ms |
| comp_1to4 | 30.89ms | 13.95ms | 12.09ms | 36.14ms | 14.54ms | 48.58ms |
| comp_1to8 | 23.72ms | 12.10ms | 5.24ms | 6.81ms | 20.48ms | 47.38ms |
| comp_1to1000 | 15.74ms | 4.11ms | 3.54ms | 6.70ms | 14.20ms | 42.56ms |
| update_1to1 | 21.04ms | 8.96ms | 4.64ms | 9.24ms | 15.82ms | 7.20ms |
| update_2to1 | 10.42ms | 4.58ms | 2.32ms | 4.61ms | 7.94ms | 2.86ms |
| update_4to1 | 5.21ms | 2.23ms | 1.20ms | 2.33ms | 3.98ms | 2.23ms |
| update_1000to1 | 53μs | 22μs | 11μs | 23μs | 39μs | 15μs |
| update_1to2 | 11.17ms | 4.49ms | 2.32ms | 4.51ms | 8.16ms | 4.90ms |
| update_1to4 | 5.25ms | 2.22ms | 1.20ms | 2.47ms | 3.98ms | 1.45ms |
| update_1to1000 | 152μs | 78μs | 47μs | 1.01ms | 147μs | 408μs |
| cellx1000 | 102.20ms | 10.18ms | 7.63ms | 10.75ms | 13.89ms | 6.24ms |
| cellx2500 | 266.13ms | 44.20ms | 23.78ms | 33.98ms | 39.49ms | 26.00ms |
| cellx5000 | 629.57ms | 83.65ms | 56.81ms | 98.10ms | 116.83ms | 75.85ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.99s | 514.49ms | 235.57ms | 459.00ms | 351.62ms | 240.15ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.50s | 283.21ms | 177.80ms | 272.56ms | 254.45ms | 202.09ms |
| 1000x12 - 4 sources - dynamic (large) | 1.77s | 3.79s | 282.78ms | 3.78s | 469.06ms | 355.13ms |
| 1000x5 - 25 sources (wide dense) | 3.44s | 3.43s | 418.18ms | 2.79s | 603.08ms | 510.61ms |
| 5x500 - 3 sources (deep) | 1.14s | 222.00ms | 192.95ms | 233.44ms | 253.59ms | 211.31ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.66s | 476.07ms | 266.09ms | 449.34ms | 381.60ms | 258.76ms |

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
