# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.42s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.07s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.68s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.07s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 202.21ms | 2.28s | 143.92ms (fail) | 194.33ms | 209.22ms | 274.01ms |
| broadPropagation | 454.89ms | 4.23s | 6.13ms (fail) | 356.88ms | 468.36ms | 503.32ms |
| deepPropagation | 179.74ms | 1.52s | 138.72ms (fail) | 128.29ms | 174.19ms | 167.76ms |
| diamond | 288.65ms | 2.39s | 183.04ms (fail) | 245.90ms | 285.40ms | 347.15ms |
| mux | 400.89ms | 1.77s | 183.44ms (fail) | 361.70ms | 370.19ms | 421.07ms |
| repeatedObservers | 45.83ms | 223.10ms | 55.54ms (fail) | 46.37ms | 42.69ms | 80.27ms |
| triangle | 104.28ms | 754.66ms | 75.07ms (fail) | 90.28ms | 99.10ms | 119.42ms |
| unstable | 75.16ms | 342.28ms | 334.43ms (fail) | 62.06ms | 71.80ms | 95.57ms |
| molBench | 494.88ms | 585.15ms | 1.13ms | 488.31ms | 497.72ms | 497.18ms |
| create_signals | 30.12ms | 73.52ms | 60.31ms | 27.67ms | 5.93ms | 80.49ms |
| comp_0to1 | 13.21ms | 21.12ms | 55.73ms | 7.67ms | 19.83ms | 27.00ms |
| comp_1to1 | 31.48ms | 47.54ms | 56.64ms | 4.68ms | 14.86ms | 43.60ms |
| comp_2to1 | 13.63ms | 23.13ms | 37.78ms | 2.65ms | 22.04ms | 27.34ms |
| comp_4to1 | 2.20ms | 18.81ms | 16.86ms | 8.92ms | 17.24ms | 18.25ms |
| comp_1000to1 | 5μs | 15μs | 52μs | 6μs | 5μs | 20μs |
| comp_1to2 | 23.38ms | 39.98ms | 47.03ms | 20.35ms | 18.52ms | 38.86ms |
| comp_1to4 | 10.04ms | 17.94ms | 46.31ms | 10.08ms | 31.48ms | 21.90ms |
| comp_1to8 | 11.27ms | 20.26ms | 45.25ms | 5.97ms | 7.10ms | 21.24ms |
| comp_1to1000 | 7.14ms | 14.79ms | 41.76ms | 3.88ms | 6.54ms | 14.52ms |
| update_1to1 | 8.89ms | 22.31ms | 11.43ms | 4.62ms | 9.11ms | 15.70ms |
| update_2to1 | 4.61ms | 11.29ms | 2.82ms | 2.31ms | 4.56ms | 7.85ms |
| update_4to1 | 2.23ms | 6.12ms | 2.49ms | 1.16ms | 2.34ms | 3.95ms |
| update_1000to1 | 42μs | 55μs | 25μs | 11μs | 41μs | 39μs |
| update_1to2 | 4.42ms | 10.92ms | 4.95ms | 2.42ms | 4.45ms | 8.07ms |
| update_1to4 | 2.24ms | 7.40ms | 2.07ms | 1.21ms | 2.37ms | 3.94ms |
| update_1to1000 | 43μs | 156μs | 410μs | 29μs | 872μs | 146μs |
| cellx1000 | 10.51ms | 88.57ms | 6.20ms | 7.95ms | 10.63ms | 18.61ms |
| cellx2500 | 43.66ms | 298.08ms | 30.06ms | 22.49ms | 35.49ms | 45.57ms |
| cellx5000 | 101.48ms | 660.62ms | 77.86ms | 53.48ms | 102.17ms | 162.18ms |
| 10x5 - 2 sources - read 20.0% (simple) | 487.87ms | 1.96s | 246.85ms | 237.72ms | 457.63ms | 352.04ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.24ms | 1.49s | 219.83ms | 187.09ms | 281.02ms | 252.64ms |
| 1000x12 - 4 sources - dynamic (large) | 3.79s | 1.93s | 341.43ms | 287.32ms | 3.85s | 479.30ms |
| 1000x5 - 25 sources (wide dense) | 3.24s | 3.39s | 516.51ms | 413.83ms | 2.85s | 606.36ms |
| 5x500 - 3 sources (deep) | 223.58ms | 1.13s | 211.96ms | 191.05ms | 241.96ms | 267.71ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.69ms | 1.70s | 255.56ms | 269.25ms | 462.36ms | 394.72ms |

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
