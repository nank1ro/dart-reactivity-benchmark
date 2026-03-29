# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.96s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.45s |
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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 274.62ms | 197.62ms | 150.03ms (fail) | 210.70ms | 2.25s | 203.71ms |
| broadPropagation | 499.18ms | 358.86ms | 6.03ms (fail) | 455.61ms | 4.28s | 465.89ms |
| deepPropagation | 164.18ms | 130.26ms | 139.37ms (fail) | 174.64ms | 1.54s | 170.48ms |
| diamond | 348.38ms | 245.84ms | 186.78ms (fail) | 286.35ms | 2.31s | 286.79ms |
| mux | 417.98ms | 360.56ms | 178.18ms (fail) | 375.62ms | 1.78s | 405.18ms |
| repeatedObservers | 80.75ms | 45.69ms | 57.02ms (fail) | 42.49ms | 235.46ms | 46.13ms |
| triangle | 113.03ms | 89.99ms | 75.98ms (fail) | 100.26ms | 758.52ms | 101.32ms |
| unstable | 95.26ms | 62.11ms | 335.94ms (fail) | 72.23ms | 341.04ms | 75.70ms |
| molBench | 489.86ms | 481.39ms | 1.18ms | 496.21ms | 589.34ms | 494.65ms |
| create_signals | 96.41ms | 28.36ms | 59.19ms | 5.37ms | 89.65ms | 26.94ms |
| comp_0to1 | 35.32ms | 7.21ms | 56.10ms | 17.84ms | 23.07ms | 11.86ms |
| comp_1to1 | 49.12ms | 4.23ms | 55.02ms | 10.90ms | 44.45ms | 26.04ms |
| comp_2to1 | 23.59ms | 2.33ms | 37.06ms | 18.76ms | 23.52ms | 19.84ms |
| comp_4to1 | 9.51ms | 8.74ms | 16.65ms | 24.05ms | 27.94ms | 5.27ms |
| comp_1000to1 | 16μs | 5μs | 44μs | 9μs | 24μs | 7μs |
| comp_1to2 | 32.38ms | 19.07ms | 45.78ms | 19.37ms | 38.12ms | 15.53ms |
| comp_1to4 | 19.17ms | 9.09ms | 44.24ms | 34.31ms | 21.57ms | 7.02ms |
| comp_1to8 | 21.89ms | 4.97ms | 43.73ms | 5.78ms | 23.89ms | 6.50ms |
| comp_1to1000 | 14.30ms | 3.83ms | 39.60ms | 5.51ms | 15.10ms | 4.09ms |
| update_1to1 | 15.70ms | 4.62ms | 8.88ms | 9.00ms | 21.03ms | 8.91ms |
| update_2to1 | 7.83ms | 2.38ms | 2.86ms | 4.59ms | 10.40ms | 4.47ms |
| update_4to1 | 3.89ms | 1.23ms | 2.71ms | 2.29ms | 5.89ms | 2.44ms |
| update_1000to1 | 39μs | 11μs | 14μs | 23μs | 53μs | 22μs |
| update_1to2 | 8.03ms | 2.39ms | 4.48ms | 4.55ms | 10.39ms | 4.42ms |
| update_1to4 | 3.95ms | 1.23ms | 1.45ms | 2.42ms | 5.25ms | 2.27ms |
| update_1to1000 | 143μs | 49μs | 397μs | 901μs | 153μs | 43μs |
| cellx1000 | 12.19ms | 7.62ms | 5.45ms | 10.20ms | 81.66ms | 10.04ms |
| cellx2500 | 38.73ms | 22.20ms | 27.29ms | 30.20ms | 276.76ms | 40.66ms |
| cellx5000 | 121.47ms | 59.74ms | 73.92ms | 102.47ms | 582.80ms | 96.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 345.23ms | 242.55ms | 238.60ms | 460.70ms | 1.99s | 516.26ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.53ms | 185.01ms | 199.50ms | 277.64ms | 1.49s | 280.22ms |
| 1000x12 - 4 sources - dynamic (large) | 468.13ms | 283.41ms | 345.83ms | 3.74s | 1.87s | 3.52s |
| 1000x5 - 25 sources (wide dense) | 600.90ms | 417.46ms | 515.63ms | 2.76s | 3.41s | 3.40s |
| 5x500 - 3 sources (deep) | 252.90ms | 197.17ms | 207.09ms | 232.68ms | 1.15s | 223.81ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 386.85ms | 260.61ms | 273.69ms | 452.95ms | 1.64s | 478.30ms |

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
