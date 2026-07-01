# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 9.88s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 10.96s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.95s |
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
| avoidablePropagation | 197.93ms | 145.77ms (fail) | 200.00ms | 182.83ms | 2.39s | 273.29ms |
| broadPropagation | 446.40ms | 6.18ms (fail) | 454.67ms | 344.59ms | 4.41s | 510.98ms |
| deepPropagation | 173.47ms | 139.41ms (fail) | 165.95ms | 135.49ms | 1.52s | 169.52ms |
| diamond | 281.68ms | 181.55ms (fail) | 281.35ms | 231.53ms | 2.41s | 361.40ms |
| mux | 383.63ms | 189.15ms (fail) | 396.85ms | 356.57ms | 1.75s | 424.20ms |
| repeatedObservers | 41.15ms | 53.08ms (fail) | 45.59ms | 43.33ms | 235.82ms | 80.15ms |
| triangle | 98.63ms | 78.96ms (fail) | 99.66ms | 86.32ms | 755.70ms | 113.84ms |
| unstable | 73.83ms | 332.37ms (fail) | 73.84ms | 59.68ms | 349.52ms | 96.89ms |
| molBench | 483.80ms | 890μs | 497.56ms | 487.12ms | 593.78ms | 492.19ms |
| create_signals | 5.35ms | 62.49ms | 24.89ms | 31.69ms | 71.27ms | 60.39ms |
| comp_0to1 | 17.71ms | 57.18ms | 10.98ms | 8.21ms | 33.33ms | 25.56ms |
| comp_1to1 | 18.58ms | 57.49ms | 31.04ms | 4.22ms | 32.65ms | 29.17ms |
| comp_2to1 | 20.12ms | 39.00ms | 12.23ms | 2.36ms | 37.26ms | 34.48ms |
| comp_4to1 | 11.26ms | 17.38ms | 2.91ms | 12.22ms | 25.80ms | 4.28ms |
| comp_1000to1 | 4μs | 43μs | 5μs | 4μs | 16μs | 15μs |
| comp_1to2 | 35.28ms | 46.83ms | 18.65ms | 19.24ms | 37.55ms | 34.40ms |
| comp_1to4 | 29.45ms | 46.86ms | 6.99ms | 7.60ms | 17.43ms | 14.62ms |
| comp_1to8 | 8.61ms | 44.67ms | 6.41ms | 6.47ms | 21.50ms | 20.16ms |
| comp_1to1000 | 3.59ms | 42.57ms | 3.99ms | 3.71ms | 15.42ms | 14.10ms |
| update_1to1 | 9.77ms | 5.77ms | 9.82ms | 10.00ms | 25.66ms | 16.94ms |
| update_2to1 | 4.56ms | 2.97ms | 5.20ms | 2.29ms | 11.80ms | 9.22ms |
| update_4to1 | 2.40ms | 1.50ms | 2.90ms | 2.48ms | 6.72ms | 3.99ms |
| update_1000to1 | 23μs | 15μs | 24μs | 24μs | 58μs | 39μs |
| update_1to2 | 4.78ms | 2.92ms | 5.02ms | 4.97ms | 12.09ms | 8.25ms |
| update_1to4 | 2.31ms | 1.52ms | 2.50ms | 1.49ms | 6.92ms | 3.99ms |
| update_1to1000 | 56μs | 426μs | 42μs | 48μs | 163μs | 146μs |
| cellx1000 | 12.65ms | 5.76ms | 12.11ms | 9.02ms | 82.54ms | 13.68ms |
| cellx2500 | 29.29ms | 24.87ms | 33.01ms | 22.12ms | 288.48ms | 34.80ms |
| cellx5000 | 81.05ms | 68.67ms | 68.69ms | 54.70ms | 636.37ms | 84.90ms |
| 10x5 - 2 sources - read 20.0% (simple) | 432.89ms | 250.26ms | 497.20ms | 233.06ms | 1.90s | 358.07ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 269.87ms | 204.07ms | 293.86ms | 173.98ms | 1.43s | 253.29ms |
| 1000x12 - 4 sources - dynamic (large) | 3.49s | 349.94ms | 3.63s | 291.83ms | 1.78s | 471.64ms |
| 1000x5 - 25 sources (wide dense) | 2.53s | 507.67ms | 3.37s | 406.81ms | 3.31s | 612.78ms |
| 5x500 - 3 sources (deep) | 227.87ms | 204.59ms | 220.75ms | 195.12ms | 1.09s | 250.31ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 448.43ms | 262.81ms | 473.59ms | 260.99ms | 1.65s | 382.31ms |

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
