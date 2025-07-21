# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.67s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.04s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.98s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.36s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 164.33ms (fail) | 2.35s | 276.45ms | 201.57ms | 210.40ms | 184.55ms |
| broadPropagation | 5.98ms (fail) | 4.53s | 505.34ms | 445.47ms | 454.73ms | 346.97ms |
| deepPropagation | 139.61ms (fail) | 1.57s | 169.00ms | 177.13ms | 171.15ms | 121.13ms |
| diamond | 181.08ms (fail) | 2.52s | 350.90ms | 278.91ms | 279.71ms | 230.93ms |
| mux | 197.95ms (fail) | 1.89s | 451.61ms | 405.68ms | 408.62ms | 367.48ms |
| repeatedObservers | 54.89ms (fail) | 243.56ms | 81.75ms | 39.61ms | 44.88ms | 45.38ms |
| triangle | 77.71ms (fail) | 795.11ms | 125.76ms | 97.87ms | 105.18ms | 84.94ms |
| unstable | 339.61ms (fail) | 356.65ms | 98.31ms | 70.22ms | 79.42ms | 66.85ms |
| molBench | 959μs | 574.62ms | 493.02ms | 489.79ms | 485.60ms | 488.28ms |
| create_signals | 59.66ms | 52.37ms | 74.71ms | 5.25ms | 25.46ms | 25.49ms |
| comp_0to1 | 52.95ms | 19.71ms | 28.64ms | 17.68ms | 11.65ms | 9.25ms |
| comp_1to1 | 55.02ms | 29.97ms | 44.39ms | 14.46ms | 27.48ms | 4.25ms |
| comp_2to1 | 36.33ms | 20.52ms | 15.96ms | 20.77ms | 9.00ms | 2.32ms |
| comp_4to1 | 16.16ms | 28.99ms | 10.60ms | 14.24ms | 2.18ms | 8.37ms |
| comp_1000to1 | 41μs | 16μs | 22μs | 4μs | 4μs | 5μs |
| comp_1to2 | 44.93ms | 37.00ms | 38.40ms | 24.25ms | 13.68ms | 13.92ms |
| comp_1to4 | 43.57ms | 30.62ms | 21.15ms | 21.10ms | 13.18ms | 8.71ms |
| comp_1to8 | 42.45ms | 20.25ms | 33.09ms | 7.83ms | 6.99ms | 5.05ms |
| comp_1to1000 | 38.46ms | 15.86ms | 19.43ms | 8.51ms | 4.16ms | 3.52ms |
| update_1to1 | 5.71ms | 25.65ms | 16.52ms | 8.60ms | 8.94ms | 10.15ms |
| update_2to1 | 3.13ms | 11.82ms | 7.95ms | 4.39ms | 4.46ms | 2.65ms |
| update_4to1 | 1.48ms | 5.88ms | 4.07ms | 2.15ms | 2.24ms | 2.52ms |
| update_1000to1 | 15μs | 67μs | 41μs | 21μs | 33μs | 25μs |
| update_1to2 | 2.88ms | 15.39ms | 9.06ms | 4.55ms | 4.46ms | 5.11ms |
| update_1to4 | 1.51ms | 6.65ms | 4.04ms | 2.13ms | 2.23ms | 2.48ms |
| update_1to1000 | 374μs | 173μs | 175μs | 2.81ms | 43μs | 34μs |
| cellx1000 | 5.08ms | 78.28ms | 12.26ms | 9.94ms | 9.61ms | 7.26ms |
| cellx2500 | 24.01ms | 228.01ms | 36.60ms | 26.15ms | 31.53ms | 19.95ms |
| cellx5000 | 58.60ms | 569.70ms | 106.56ms | 68.67ms | 64.74ms | 44.19ms |
| 10x5 - 2 sources - read 20.0% (simple) | 238.12ms | 2.03s | 363.22ms | 473.33ms | 510.66ms | 231.55ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 197.62ms | 1.56s | 244.60ms | 282.13ms | 280.32ms | 179.91ms |
| 1000x12 - 4 sources - dynamic (large) | 335.46ms | 1.82s | 467.81ms | 3.75s | 3.59s | 285.75ms |
| 1000x5 - 25 sources (wide dense) | 477.79ms | 3.62s | 597.44ms | 2.69s | 3.47s | 413.42ms |
| 5x500 - 3 sources (deep) | 203.17ms | 1.18s | 259.06ms | 230.98ms | 229.21ms | 185.60ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 257.69ms | 1.74s | 386.75ms | 458.37ms | 484.46ms | 263.85ms |

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
