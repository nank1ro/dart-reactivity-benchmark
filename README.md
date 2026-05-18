# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.23s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.12s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.91s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 206.95ms | 273.89ms | 2.27s | 198.70ms | 150.26ms (fail) | 203.85ms |
| broadPropagation | 452.86ms | 501.79ms | 4.33s | 353.06ms | 5.95ms (fail) | 462.50ms |
| deepPropagation | 180.33ms | 168.52ms | 1.56s | 126.67ms | 136.13ms (fail) | 167.03ms |
| diamond | 283.44ms | 339.40ms | 2.31s | 244.96ms | 202.55ms (fail) | 286.86ms |
| mux | 382.99ms | 419.10ms | 1.76s | 367.72ms | 181.36ms (fail) | 399.99ms |
| repeatedObservers | 42.00ms | 81.04ms | 222.86ms | 47.26ms | 59.23ms (fail) | 45.35ms |
| triangle | 106.23ms | 118.31ms | 751.64ms | 94.31ms | 78.10ms (fail) | 102.28ms |
| unstable | 71.56ms | 95.61ms | 341.12ms | 63.02ms | 336.05ms (fail) | 75.33ms |
| molBench | 497.87ms | 489.15ms | 584.45ms | 481.00ms | 1.00ms | 495.68ms |
| create_signals | 5.34ms | 74.87ms | 67.64ms | 29.28ms | 63.82ms | 26.44ms |
| comp_0to1 | 22.12ms | 25.25ms | 20.26ms | 6.89ms | 59.15ms | 11.60ms |
| comp_1to1 | 11.34ms | 38.71ms | 42.71ms | 4.28ms | 59.08ms | 26.83ms |
| comp_2to1 | 13.53ms | 40.88ms | 29.80ms | 2.30ms | 37.38ms | 8.99ms |
| comp_4to1 | 18.47ms | 11.61ms | 27.61ms | 8.49ms | 17.32ms | 2.16ms |
| comp_1000to1 | 9μs | 17μs | 15μs | 3μs | 47μs | 6μs |
| comp_1to2 | 22.06ms | 26.98ms | 38.31ms | 20.24ms | 49.82ms | 19.68ms |
| comp_1to4 | 27.34ms | 25.20ms | 29.43ms | 7.54ms | 49.26ms | 10.04ms |
| comp_1to8 | 6.95ms | 24.21ms | 22.05ms | 4.47ms | 47.74ms | 6.45ms |
| comp_1to1000 | 5.31ms | 13.96ms | 14.73ms | 3.55ms | 44.31ms | 4.06ms |
| update_1to1 | 9.11ms | 15.64ms | 21.46ms | 4.65ms | 11.34ms | 8.96ms |
| update_2to1 | 4.59ms | 7.84ms | 11.17ms | 2.35ms | 2.85ms | 4.48ms |
| update_4to1 | 2.39ms | 3.90ms | 5.29ms | 1.18ms | 1.85ms | 2.25ms |
| update_1000to1 | 23μs | 39μs | 53μs | 11μs | 14μs | 22μs |
| update_1to2 | 4.55ms | 7.97ms | 11.15ms | 2.34ms | 4.35ms | 4.48ms |
| update_1to4 | 2.44ms | 3.94ms | 5.62ms | 1.20ms | 1.46ms | 2.26ms |
| update_1to1000 | 805μs | 145μs | 165μs | 32μs | 439μs | 41μs |
| cellx1000 | 11.10ms | 12.50ms | 78.50ms | 8.10ms | 6.04ms | 10.01ms |
| cellx2500 | 26.87ms | 34.41ms | 232.76ms | 20.13ms | 27.99ms | 33.42ms |
| cellx5000 | 71.51ms | 80.32ms | 570.60ms | 45.63ms | 76.97ms | 73.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 447.90ms | 344.95ms | 2.01s | 234.03ms | 240.36ms | 508.35ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 272.29ms | 249.10ms | 1.53s | 177.59ms | 198.54ms | 281.17ms |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 460.50ms | 1.78s | 282.92ms | 347.62ms | 3.64s |
| 1000x5 - 25 sources (wide dense) | 2.80s | 602.97ms | 3.41s | 420.34ms | 520.13ms | 3.48s |
| 5x500 - 3 sources (deep) | 233.78ms | 255.00ms | 1.14s | 192.31ms | 205.78ms | 223.03ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 444.75ms | 381.65ms | 1.67s | 265.87ms | 275.65ms | 490.52ms |

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
