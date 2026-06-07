# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.40s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.15s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.12s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.31s |
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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.88ms | 206.34ms | 2.36s | 199.07ms | 147.77ms (fail) | 185.67ms |
| broadPropagation | 511.07ms | 456.88ms | 4.47s | 446.70ms | 6.07ms (fail) | 345.98ms |
| deepPropagation | 173.35ms | 179.37ms | 1.51s | 175.55ms | 139.51ms (fail) | 123.88ms |
| diamond | 356.86ms | 283.44ms | 2.38s | 284.13ms | 182.81ms (fail) | 229.95ms |
| mux | 428.85ms | 400.00ms | 1.80s | 385.57ms | 193.00ms (fail) | 361.01ms |
| repeatedObservers | 80.07ms | 45.95ms | 229.52ms | 40.99ms | 52.87ms (fail) | 43.27ms |
| triangle | 120.70ms | 100.41ms | 749.21ms | 99.12ms | 83.82ms (fail) | 86.03ms |
| unstable | 95.16ms | 73.44ms | 342.73ms | 74.34ms | 337.03ms (fail) | 59.24ms |
| molBench | 483.74ms | 496.19ms | 591.64ms | 486.55ms | 951μs | 487.83ms |
| create_signals | 79.87ms | 27.68ms | 54.31ms | 5.62ms | 63.08ms | 31.29ms |
| comp_0to1 | 37.28ms | 12.13ms | 15.55ms | 18.99ms | 57.48ms | 8.87ms |
| comp_1to1 | 47.19ms | 32.13ms | 48.18ms | 22.33ms | 57.25ms | 4.34ms |
| comp_2to1 | 10.05ms | 20.32ms | 25.44ms | 21.93ms | 39.75ms | 2.33ms |
| comp_4to1 | 18.08ms | 7.92ms | 25.32ms | 11.68ms | 17.57ms | 12.83ms |
| comp_1000to1 | 19μs | 4μs | 16μs | 4μs | 44μs | 4μs |
| comp_1to2 | 40.40ms | 21.64ms | 41.64ms | 25.98ms | 47.41ms | 16.15ms |
| comp_1to4 | 18.97ms | 19.46ms | 25.08ms | 33.34ms | 47.73ms | 7.69ms |
| comp_1to8 | 26.12ms | 6.66ms | 25.49ms | 7.38ms | 46.80ms | 4.13ms |
| comp_1to1000 | 14.40ms | 4.11ms | 15.51ms | 6.71ms | 40.40ms | 3.75ms |
| update_1to1 | 16.09ms | 9.80ms | 24.13ms | 9.36ms | 5.75ms | 9.95ms |
| update_2to1 | 7.79ms | 4.95ms | 12.57ms | 4.62ms | 2.95ms | 2.27ms |
| update_4to1 | 3.98ms | 2.47ms | 6.81ms | 2.38ms | 1.47ms | 2.50ms |
| update_1000to1 | 39μs | 24μs | 60μs | 23μs | 15μs | 28μs |
| update_1to2 | 7.98ms | 4.86ms | 13.40ms | 4.68ms | 2.89ms | 4.91ms |
| update_1to4 | 3.99ms | 2.50ms | 6.54ms | 2.33ms | 1.51ms | 1.72ms |
| update_1to1000 | 145μs | 43μs | 164μs | 619μs | 411μs | 54μs |
| cellx1000 | 13.68ms | 11.20ms | 90.20ms | 11.64ms | 6.38ms | 7.64ms |
| cellx2500 | 44.95ms | 41.39ms | 296.22ms | 44.06ms | 29.90ms | 23.23ms |
| cellx5000 | 143.78ms | 92.76ms | 671.37ms | 101.64ms | 78.72ms | 61.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 349.04ms | 499.15ms | 1.94s | 444.68ms | 255.57ms | 238.49ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 252.54ms | 282.31ms | 1.47s | 279.20ms | 202.85ms | 177.68ms |
| 1000x12 - 4 sources - dynamic (large) | 481.08ms | 3.68s | 1.88s | 3.62s | 352.86ms | 286.95ms |
| 1000x5 - 25 sources (wide dense) | 615.93ms | 3.41s | 3.38s | 2.57s | 520.33ms | 411.05ms |
| 5x500 - 3 sources (deep) | 254.56ms | 222.97ms | 1.12s | 227.32ms | 207.72ms | 197.28ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 392.57ms | 486.96ms | 1.68s | 455.16ms | 267.26ms | 270.98ms |

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
