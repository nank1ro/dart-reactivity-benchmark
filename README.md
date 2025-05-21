# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.73s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 10.23s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.21s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.43s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.04s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 148.73ms (fail) | 194.71ms | 2.34s | 273.90ms | 210.25ms | 201.73ms |
| broadPropagation | 6.49ms (fail) | 345.79ms | 4.53s | 501.72ms | 448.86ms | 449.08ms |
| deepPropagation | 138.42ms (fail) | 120.58ms | 1.57s | 169.44ms | 166.47ms | 178.01ms |
| diamond | 181.43ms (fail) | 227.43ms | 2.44s | 360.45ms | 285.09ms | 278.95ms |
| mux | 196.52ms (fail) | 374.67ms | 1.85s | 440.59ms | 404.72ms | 402.95ms |
| repeatedObservers | 55.26ms (fail) | 45.35ms | 231.76ms | 81.08ms | 50.46ms | 39.47ms |
| triangle | 84.13ms (fail) | 85.00ms | 774.13ms | 119.52ms | 101.81ms | 98.45ms |
| unstable | 338.42ms (fail) | 66.75ms | 352.86ms | 97.77ms | 79.28ms | 69.99ms |
| molBench | 877μs | 486.83ms | 573.57ms | 492.67ms | 485.51ms | 490.92ms |
| create_signals | 65.18ms | 23.92ms | 92.01ms | 99.72ms | 27.23ms | 18.39ms |
| comp_0to1 | 56.67ms | 7.91ms | 24.20ms | 37.37ms | 12.38ms | 14.72ms |
| comp_1to1 | 65.30ms | 4.20ms | 45.70ms | 54.49ms | 28.52ms | 7.17ms |
| comp_2to1 | 45.01ms | 2.34ms | 24.04ms | 40.70ms | 9.36ms | 10.10ms |
| comp_4to1 | 18.86ms | 8.71ms | 26.48ms | 4.95ms | 2.00ms | 6.94ms |
| comp_1000to1 | 45μs | 4μs | 17μs | 21μs | 5μs | 4μs |
| comp_1to2 | 47.69ms | 14.97ms | 36.51ms | 29.51ms | 18.46ms | 24.98ms |
| comp_1to4 | 46.12ms | 6.77ms | 18.19ms | 26.82ms | 10.42ms | 19.36ms |
| comp_1to8 | 45.02ms | 7.69ms | 21.05ms | 24.48ms | 6.37ms | 7.09ms |
| comp_1to1000 | 41.18ms | 3.64ms | 16.26ms | 17.26ms | 4.36ms | 3.87ms |
| update_1to1 | 5.68ms | 10.29ms | 26.66ms | 18.08ms | 8.97ms | 8.62ms |
| update_2to1 | 3.14ms | 2.30ms | 11.98ms | 7.88ms | 4.50ms | 4.22ms |
| update_4to1 | 1.46ms | 2.76ms | 6.37ms | 3.99ms | 2.26ms | 2.16ms |
| update_1000to1 | 14μs | 24μs | 71μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.86ms | 5.12ms | 12.45ms | 8.03ms | 4.46ms | 4.62ms |
| update_1to4 | 1.42ms | 2.46ms | 5.90ms | 3.97ms | 2.23ms | 2.15ms |
| update_1to1000 | 398μs | 47μs | 185μs | 177μs | 44μs | 43μs |
| cellx1000 | 5.49ms | 8.02ms | 82.12ms | 12.39ms | 10.21ms | 10.26ms |
| cellx2500 | 28.73ms | 25.77ms | 285.26ms | 41.59ms | 38.69ms | 30.74ms |
| cellx5000 | 78.00ms | 72.39ms | 597.51ms | 122.58ms | 83.89ms | 82.92ms |
| 10x5 - 2 sources - read 20.0% (simple) | 238.02ms | 230.27ms | 2.07s | 367.13ms | 517.81ms | 435.72ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.71ms | 178.08ms | 1.53s | 252.98ms | 281.67ms | 267.89ms |
| 1000x12 - 4 sources - dynamic (large) | 343.58ms | 288.72ms | 1.96s | 473.50ms | 3.77s | 3.67s |
| 1000x5 - 25 sources (wide dense) | 502.14ms | 412.30ms | 3.58s | 599.18ms | 3.43s | 2.72s |
| 5x500 - 3 sources (deep) | 204.04ms | 197.06ms | 1.19s | 256.85ms | 225.43ms | 226.26ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 256.02ms | 269.58ms | 1.71s | 387.29ms | 481.45ms | 450.54ms |

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
