# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.75s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.28s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.41s |
| 4 | signals | 0.23 | 100.0% | 35/35 | 11.42s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.58s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.31s |

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
| avoidablePropagation | 2.28s | 214.52ms | 184.22ms | 226.06ms | 270.19ms | 159.82ms (fail) |
| broadPropagation | 4.20s | 473.39ms | 355.43ms | 539.53ms | 492.56ms | 6.53ms (fail) |
| deepPropagation | 1.49s | 182.22ms | 117.36ms | 206.77ms | 165.27ms | 153.83ms (fail) |
| diamond | 2.24s | 289.01ms | 268.33ms | 289.29ms | 364.01ms | 189.55ms (fail) |
| mux | 1.72s | 381.26ms | 363.27ms | 397.92ms | 421.50ms | 187.00ms (fail) |
| repeatedObservers | 226.89ms | 46.47ms | 44.37ms | 42.23ms | 87.48ms | 54.66ms (fail) |
| triangle | 723.93ms | 105.98ms | 89.62ms | 107.47ms | 122.67ms | 79.89ms (fail) |
| unstable | 345.65ms | 77.81ms | 61.42ms | 72.63ms | 107.27ms | 342.92ms (fail) |
| molBench | 639.80ms | 547.87ms | 560.86ms | 547.55ms | 568.46ms | 999μs |
| create_signals | 75.90ms | 28.99ms | 24.21ms | 5.77ms | 97.99ms | 58.09ms |
| comp_0to1 | 25.57ms | 12.42ms | 8.33ms | 23.21ms | 36.95ms | 51.84ms |
| comp_1to1 | 44.68ms | 37.23ms | 4.54ms | 13.77ms | 49.19ms | 52.98ms |
| comp_2to1 | 27.07ms | 23.80ms | 2.23ms | 18.46ms | 51.19ms | 38.12ms |
| comp_4to1 | 22.81ms | 15.83ms | 9.26ms | 12.54ms | 12.36ms | 16.11ms |
| comp_1000to1 | 16μs | 5μs | 3μs | 7μs | 18μs | 40μs |
| comp_1to2 | 37.35ms | 9.51ms | 17.69ms | 20.91ms | 35.56ms | 43.00ms |
| comp_1to4 | 16.72ms | 14.20ms | 4.89ms | 22.90ms | 20.83ms | 43.20ms |
| comp_1to8 | 18.77ms | 10.12ms | 4.45ms | 6.60ms | 23.52ms | 41.13ms |
| comp_1to1000 | 14.60ms | 3.62ms | 3.14ms | 3.66ms | 14.48ms | 36.47ms |
| update_1to1 | 23.16ms | 9.57ms | 4.78ms | 9.78ms | 16.71ms | 5.98ms |
| update_2to1 | 11.57ms | 4.67ms | 2.40ms | 4.85ms | 8.37ms | 3.05ms |
| update_4to1 | 5.79ms | 2.39ms | 1.40ms | 2.42ms | 4.26ms | 1.54ms |
| update_1000to1 | 57μs | 29μs | 19μs | 25μs | 43μs | 15μs |
| update_1to2 | 11.54ms | 4.71ms | 2.40ms | 4.84ms | 8.58ms | 3.01ms |
| update_1to4 | 5.65ms | 2.37ms | 1.22ms | 2.55ms | 4.21ms | 1.53ms |
| update_1to1000 | 153μs | 37μs | 43μs | 38μs | 143μs | 362μs |
| cellx1000 | 71.35ms | 9.44ms | 6.92ms | 9.88ms | 10.98ms | 4.85ms |
| cellx2500 | 254.89ms | 26.26ms | 19.08ms | 27.24ms | 31.46ms | 26.42ms |
| cellx5000 | 580.28ms | 63.98ms | 43.35ms | 67.52ms | 72.66ms | 57.58ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.01s | 496.90ms | 248.47ms | 437.13ms | 377.87ms | 251.58ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.44s | 270.94ms | 187.61ms | 263.16ms | 271.44ms | 203.17ms |
| 1000x12 - 4 sources - dynamic (large) | 1.81s | 3.85s | 266.83ms | 3.49s | 416.86ms | 295.48ms |
| 1000x5 - 25 sources (wide dense) | 3.43s | 3.52s | 413.84ms | 2.74s | 637.81ms | 463.52ms |
| 5x500 - 3 sources (deep) | 1.13s | 228.96ms | 190.86ms | 230.17ms | 270.00ms | 201.81ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.64s | 463.64ms | 235.95ms | 440.41ms | 334.28ms | 236.86ms |

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
