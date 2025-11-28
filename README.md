# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.17s |
| 4 | preact_signals | 0.22 | 100.0% | 35/35 | 10.01s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.10s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 210.91ms | 187.20ms | 144.62ms (fail) | 277.69ms | 207.66ms | 2.35s |
| broadPropagation | 447.23ms | 355.41ms | 5.89ms (fail) | 516.21ms | 449.79ms | 4.45s |
| deepPropagation | 172.84ms | 132.68ms | 138.53ms (fail) | 169.97ms | 179.36ms | 1.49s |
| diamond | 282.47ms | 232.86ms | 179.03ms (fail) | 355.17ms | 282.98ms | 2.37s |
| mux | 397.60ms | 363.58ms | 182.64ms (fail) | 416.19ms | 374.31ms | 1.84s |
| repeatedObservers | 46.65ms | 45.18ms | 52.64ms (fail) | 81.39ms | 40.40ms | 228.73ms |
| triangle | 101.82ms | 82.81ms | 75.86ms (fail) | 118.02ms | 100.24ms | 754.49ms |
| unstable | 77.89ms | 62.96ms | 335.37ms (fail) | 97.37ms | 70.76ms | 340.70ms |
| molBench | 494.57ms | 484.75ms | 922μs | 490.36ms | 479.78ms | 588.78ms |
| create_signals | 25.75ms | 20.39ms | 56.54ms | 78.60ms | 5.68ms | 69.38ms |
| comp_0to1 | 11.23ms | 7.99ms | 51.43ms | 25.94ms | 17.55ms | 28.09ms |
| comp_1to1 | 26.44ms | 4.20ms | 52.96ms | 27.58ms | 13.80ms | 37.23ms |
| comp_2to1 | 15.93ms | 2.27ms | 38.21ms | 40.47ms | 20.66ms | 32.89ms |
| comp_4to1 | 2.01ms | 8.71ms | 16.59ms | 12.38ms | 13.85ms | 24.53ms |
| comp_1000to1 | 5μs | 3μs | 59μs | 15μs | 5μs | 15μs |
| comp_1to2 | 19.20ms | 15.95ms | 45.95ms | 27.38ms | 27.18ms | 35.12ms |
| comp_1to4 | 12.70ms | 5.21ms | 45.51ms | 21.22ms | 23.92ms | 18.00ms |
| comp_1to8 | 6.43ms | 5.27ms | 43.20ms | 20.62ms | 10.28ms | 20.52ms |
| comp_1to1000 | 4.32ms | 3.76ms | 38.05ms | 14.28ms | 8.84ms | 15.30ms |
| update_1to1 | 9.60ms | 4.74ms | 6.15ms | 15.45ms | 8.76ms | 24.34ms |
| update_2to1 | 4.77ms | 2.34ms | 3.05ms | 7.75ms | 4.46ms | 12.89ms |
| update_4to1 | 2.34ms | 2.48ms | 1.55ms | 3.86ms | 2.21ms | 7.04ms |
| update_1000to1 | 23μs | 11μs | 16μs | 39μs | 35μs | 69μs |
| update_1to2 | 4.63ms | 2.73ms | 3.07ms | 7.90ms | 4.36ms | 13.84ms |
| update_1to4 | 2.55ms | 1.19ms | 1.58ms | 3.85ms | 2.28ms | 6.93ms |
| update_1to1000 | 42μs | 35μs | 384μs | 158μs | 2.58ms | 158μs |
| cellx1000 | 9.86ms | 7.27ms | 5.37ms | 12.07ms | 9.55ms | 73.10ms |
| cellx2500 | 35.17ms | 19.54ms | 24.57ms | 34.64ms | 25.84ms | 249.67ms |
| cellx5000 | 68.28ms | 43.22ms | 81.36ms | 76.04ms | 72.21ms | 559.88ms |
| 10x5 - 2 sources - read 20.0% (simple) | 500.90ms | 235.63ms | 233.28ms | 347.06ms | 436.89ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.15ms | 173.78ms | 195.98ms | 244.47ms | 265.41ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.81s | 282.60ms | 345.44ms | 463.63ms | 3.65s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.39s | 413.15ms | 521.24ms | 600.29ms | 2.51s | 3.45s |
| 5x500 - 3 sources (deep) | 224.31ms | 194.97ms | 203.99ms | 252.67ms | 226.39ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 471.19ms | 262.21ms | 255.66ms | 379.63ms | 464.75ms | 1.63s |

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
