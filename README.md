# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.38s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.33s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.01s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.73s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 195.59ms | 145.16ms (fail) | 200.41ms | 186.65ms | 2.30s | 273.84ms |
| broadPropagation | 441.70ms | 6.20ms (fail) | 454.46ms | 345.88ms | 4.45s | 508.38ms |
| deepPropagation | 173.81ms | 138.17ms (fail) | 174.28ms | 125.72ms | 1.51s | 173.44ms |
| diamond | 283.31ms | 181.43ms (fail) | 281.72ms | 231.41ms | 2.31s | 364.42ms |
| mux | 380.29ms | 182.80ms (fail) | 400.69ms | 355.88ms | 1.76s | 432.17ms |
| repeatedObservers | 40.70ms | 54.28ms (fail) | 45.62ms | 43.30ms | 225.33ms | 79.95ms |
| triangle | 98.00ms | 81.56ms (fail) | 100.71ms | 86.10ms | 745.80ms | 116.42ms |
| unstable | 73.84ms | 337.00ms (fail) | 73.64ms | 61.11ms | 341.49ms | 97.60ms |
| molBench | 485.34ms | 884μs | 496.38ms | 487.50ms | 590.54ms | 492.15ms |
| create_signals | 11.33ms | 62.13ms | 28.40ms | 21.36ms | 62.19ms | 64.86ms |
| comp_0to1 | 37.70ms | 56.20ms | 13.03ms | 9.19ms | 15.97ms | 26.39ms |
| comp_1to1 | 7.43ms | 56.21ms | 34.93ms | 4.43ms | 45.37ms | 30.76ms |
| comp_2to1 | 17.23ms | 38.49ms | 17.58ms | 2.42ms | 34.29ms | 34.92ms |
| comp_4to1 | 18.11ms | 16.46ms | 3.13ms | 10.57ms | 17.26ms | 4.43ms |
| comp_1000to1 | 6μs | 42μs | 5μs | 4μs | 16μs | 14μs |
| comp_1to2 | 21.09ms | 46.49ms | 27.21ms | 14.03ms | 37.23ms | 38.06ms |
| comp_1to4 | 33.81ms | 47.66ms | 12.68ms | 9.38ms | 17.76ms | 17.56ms |
| comp_1to8 | 7.40ms | 44.64ms | 7.02ms | 3.97ms | 20.36ms | 20.46ms |
| comp_1to1000 | 7.52ms | 39.82ms | 4.57ms | 3.62ms | 15.33ms | 14.25ms |
| update_1to1 | 9.36ms | 5.76ms | 9.78ms | 9.95ms | 25.32ms | 15.95ms |
| update_2to1 | 4.63ms | 2.94ms | 4.93ms | 2.24ms | 12.43ms | 7.86ms |
| update_4to1 | 2.39ms | 2.58ms | 2.46ms | 2.50ms | 7.23ms | 3.99ms |
| update_1000to1 | 23μs | 29μs | 24μs | 10μs | 54μs | 39μs |
| update_1to2 | 4.71ms | 3.39ms | 4.87ms | 4.98ms | 13.68ms | 8.30ms |
| update_1to4 | 2.31ms | 1.54ms | 2.51ms | 1.31ms | 6.86ms | 5.92ms |
| update_1to1000 | 817μs | 396μs | 44μs | 58μs | 183μs | 146μs |
| cellx1000 | 10.30ms | 6.59ms | 10.62ms | 7.41ms | 72.18ms | 12.50ms |
| cellx2500 | 31.03ms | 25.13ms | 40.05ms | 19.60ms | 261.82ms | 44.99ms |
| cellx5000 | 116.68ms | 65.33ms | 78.72ms | 42.27ms | 576.70ms | 132.10ms |
| 10x5 - 2 sources - read 20.0% (simple) | 433.49ms | 254.66ms | 504.69ms | 257.65ms | 1.90s | 358.57ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 274.93ms | 201.27ms | 289.20ms | 176.85ms | 1.45s | 254.84ms |
| 1000x12 - 4 sources - dynamic (large) | 3.56s | 343.81ms | 3.77s | 279.67ms | 1.80s | 477.75ms |
| 1000x5 - 25 sources (wide dense) | 2.55s | 515.11ms | 3.53s | 403.56ms | 3.34s | 623.68ms |
| 5x500 - 3 sources (deep) | 226.63ms | 211.99ms | 222.31ms | 190.21ms | 1.09s | 257.31ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 453.59ms | 261.00ms | 475.61ms | 266.38ms | 1.68s | 388.41ms |

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
