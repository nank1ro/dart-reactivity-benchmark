# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.15s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.27s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.03s |
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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 275.97ms | 209.46ms | 2.34s | 200.14ms | 151.72ms (fail) | 183.86ms |
| broadPropagation | 510.78ms | 446.80ms | 4.54s | 457.59ms | 5.78ms (fail) | 345.41ms |
| deepPropagation | 167.69ms | 179.65ms | 1.57s | 177.86ms | 139.10ms (fail) | 122.30ms |
| diamond | 348.36ms | 280.01ms | 2.47s | 288.86ms | 182.40ms (fail) | 230.57ms |
| mux | 436.02ms | 409.68ms | 1.85s | 413.43ms | 192.16ms (fail) | 367.26ms |
| repeatedObservers | 81.75ms | 44.94ms | 233.90ms | 40.49ms | 52.60ms (fail) | 45.37ms |
| triangle | 118.13ms | 99.08ms | 775.81ms | 102.15ms | 77.03ms (fail) | 83.72ms |
| unstable | 97.92ms | 79.02ms | 353.22ms | 70.67ms | 335.42ms (fail) | 66.71ms |
| molBench | 493.55ms | 485.56ms | 573.30ms | 485.15ms | 908μs | 487.11ms |
| create_signals | 76.79ms | 24.48ms | 68.64ms | 4.58ms | 58.77ms | 27.37ms |
| comp_0to1 | 27.25ms | 13.51ms | 28.04ms | 17.12ms | 53.36ms | 11.08ms |
| comp_1to1 | 38.91ms | 28.61ms | 53.33ms | 30.06ms | 55.24ms | 9.56ms |
| comp_2to1 | 37.14ms | 8.87ms | 34.44ms | 11.44ms | 35.49ms | 2.36ms |
| comp_4to1 | 11.49ms | 1.96ms | 20.24ms | 13.61ms | 16.64ms | 10.03ms |
| comp_1000to1 | 17μs | 4μs | 16μs | 4μs | 41μs | 3μs |
| comp_1to2 | 29.98ms | 23.20ms | 34.83ms | 15.61ms | 47.10ms | 12.59ms |
| comp_1to4 | 22.56ms | 12.90ms | 18.24ms | 22.52ms | 44.26ms | 6.36ms |
| comp_1to8 | 24.64ms | 8.62ms | 20.45ms | 7.82ms | 43.42ms | 6.21ms |
| comp_1to1000 | 16.88ms | 5.73ms | 15.81ms | 5.56ms | 39.26ms | 3.11ms |
| update_1to1 | 15.97ms | 8.90ms | 25.20ms | 8.61ms | 5.65ms | 10.39ms |
| update_2to1 | 7.79ms | 4.55ms | 13.01ms | 4.34ms | 3.17ms | 2.60ms |
| update_4to1 | 4.05ms | 2.25ms | 6.25ms | 2.13ms | 1.45ms | 2.53ms |
| update_1000to1 | 40μs | 22μs | 70μs | 21μs | 15μs | 24μs |
| update_1to2 | 8.03ms | 5.51ms | 11.36ms | 4.58ms | 2.86ms | 5.25ms |
| update_1to4 | 4.06ms | 2.26ms | 5.99ms | 2.13ms | 1.48ms | 2.49ms |
| update_1to1000 | 170μs | 42μs | 173μs | 979μs | 380μs | 31μs |
| cellx1000 | 14.43ms | 9.60ms | 72.78ms | 9.60ms | 5.16ms | 7.11ms |
| cellx2500 | 37.36ms | 30.64ms | 261.45ms | 25.40ms | 25.55ms | 18.97ms |
| cellx5000 | 105.75ms | 61.92ms | 558.47ms | 62.65ms | 89.11ms | 40.46ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.51ms | 505.50ms | 2.04s | 446.34ms | 251.63ms | 227.90ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.46ms | 278.06ms | 1.53s | 269.85ms | 207.16ms | 173.50ms |
| 1000x12 - 4 sources - dynamic (large) | 465.75ms | 3.73s | 1.98s | 3.68s | 342.27ms | 279.89ms |
| 1000x5 - 25 sources (wide dense) | 593.00ms | 3.42s | 3.65s | 2.71s | 497.64ms | 406.69ms |
| 5x500 - 3 sources (deep) | 249.12ms | 245.38ms | 1.14s | 226.87ms | 205.47ms | 190.45ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.79ms | 488.80ms | 1.74s | 446.97ms | 258.31ms | 260.83ms |

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
