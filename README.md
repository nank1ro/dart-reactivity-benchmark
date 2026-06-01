# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.40s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 9.92s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.73s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.51ms | 203.82ms | 2.35s | 196.74ms | 146.07ms (fail) | 185.69ms |
| broadPropagation | 511.45ms | 452.65ms | 4.36s | 451.42ms | 6.13ms (fail) | 343.73ms |
| deepPropagation | 172.10ms | 171.06ms | 1.51s | 175.82ms | 138.55ms (fail) | 128.31ms |
| diamond | 359.69ms | 282.75ms | 2.36s | 285.52ms | 176.60ms (fail) | 232.23ms |
| mux | 436.63ms | 398.67ms | 1.78s | 378.83ms | 190.33ms (fail) | 357.73ms |
| repeatedObservers | 80.23ms | 45.88ms | 238.46ms | 40.45ms | 52.79ms (fail) | 43.22ms |
| triangle | 113.98ms | 100.85ms | 744.22ms | 102.11ms | 79.15ms (fail) | 85.46ms |
| unstable | 96.42ms | 72.31ms | 352.73ms | 73.26ms | 338.56ms (fail) | 58.86ms |
| molBench | 486.33ms | 496.00ms | 592.18ms | 483.62ms | 1.05ms | 489.05ms |
| create_signals | 53.02ms | 25.46ms | 50.62ms | 5.38ms | 67.14ms | 28.85ms |
| comp_0to1 | 24.89ms | 11.15ms | 15.62ms | 17.64ms | 58.99ms | 8.64ms |
| comp_1to1 | 28.55ms | 29.15ms | 31.88ms | 13.61ms | 56.57ms | 4.32ms |
| comp_2to1 | 32.49ms | 11.17ms | 41.31ms | 15.99ms | 37.11ms | 2.28ms |
| comp_4to1 | 4.32ms | 2.06ms | 16.84ms | 11.50ms | 16.47ms | 12.42ms |
| comp_1000to1 | 14μs | 5μs | 16μs | 6μs | 43μs | 3μs |
| comp_1to2 | 27.19ms | 20.95ms | 37.24ms | 37.12ms | 46.78ms | 15.25ms |
| comp_1to4 | 28.42ms | 7.09ms | 29.36ms | 31.36ms | 46.98ms | 5.86ms |
| comp_1to8 | 22.51ms | 6.83ms | 20.04ms | 6.88ms | 45.34ms | 4.32ms |
| comp_1to1000 | 13.99ms | 4.00ms | 15.17ms | 9.71ms | 40.16ms | 3.69ms |
| update_1to1 | 16.68ms | 9.76ms | 23.91ms | 9.48ms | 5.80ms | 10.03ms |
| update_2to1 | 8.16ms | 4.95ms | 12.40ms | 4.64ms | 2.95ms | 2.26ms |
| update_4to1 | 4.15ms | 2.50ms | 6.73ms | 2.37ms | 1.44ms | 2.48ms |
| update_1000to1 | 40μs | 24μs | 52μs | 23μs | 15μs | 14μs |
| update_1to2 | 8.56ms | 4.85ms | 13.41ms | 4.64ms | 2.89ms | 4.98ms |
| update_1to4 | 4.19ms | 2.48ms | 5.51ms | 2.31ms | 1.48ms | 1.46ms |
| update_1to1000 | 159μs | 43μs | 163μs | 2.45ms | 391μs | 50μs |
| cellx1000 | 11.97ms | 12.07ms | 83.88ms | 9.66ms | 5.36ms | 7.45ms |
| cellx2500 | 33.19ms | 34.11ms | 240.27ms | 26.70ms | 22.92ms | 19.67ms |
| cellx5000 | 86.90ms | 66.97ms | 577.99ms | 67.24ms | 67.78ms | 41.95ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.61ms | 504.31ms | 1.90s | 438.67ms | 249.81ms | 231.72ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 251.47ms | 282.86ms | 1.46s | 269.96ms | 202.24ms | 178.56ms |
| 1000x12 - 4 sources - dynamic (large) | 466.47ms | 3.95s | 1.74s | 3.54s | 336.66ms | 279.83ms |
| 1000x5 - 25 sources (wide dense) | 605.46ms | 3.48s | 3.39s | 2.53s | 514.60ms | 402.88ms |
| 5x500 - 3 sources (deep) | 251.49ms | 223.02ms | 1.07s | 227.59ms | 202.86ms | 192.99ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 378.63ms | 479.20ms | 1.64s | 445.57ms | 261.02ms | 262.50ms |

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
