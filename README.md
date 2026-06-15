# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.34s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 9.89s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.18s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.11s |
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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 197.51ms | 146.30ms (fail) | 202.75ms | 186.09ms | 2.34s | 276.44ms |
| broadPropagation | 445.25ms | 6.33ms (fail) | 515.80ms | 343.45ms | 4.45s | 505.32ms |
| deepPropagation | 176.14ms | 137.39ms (fail) | 166.73ms | 124.09ms | 1.52s | 170.76ms |
| diamond | 279.23ms | 178.31ms (fail) | 282.16ms | 230.03ms | 2.33s | 357.88ms |
| mux | 376.68ms | 183.22ms (fail) | 394.76ms | 356.79ms | 1.82s | 421.99ms |
| repeatedObservers | 40.54ms | 52.94ms (fail) | 45.77ms | 43.21ms | 230.64ms | 79.97ms |
| triangle | 100.61ms | 80.58ms (fail) | 100.20ms | 85.04ms | 759.88ms | 115.75ms |
| unstable | 73.00ms | 336.31ms (fail) | 73.13ms | 59.76ms | 341.74ms | 95.66ms |
| molBench | 484.52ms | 1.08ms | 495.82ms | 488.65ms | 594.89ms | 492.11ms |
| create_signals | 5.58ms | 66.24ms | 27.89ms | 31.53ms | 74.33ms | 77.15ms |
| comp_0to1 | 18.44ms | 65.23ms | 12.02ms | 7.50ms | 34.22ms | 38.64ms |
| comp_1to1 | 14.31ms | 57.75ms | 26.73ms | 4.36ms | 33.27ms | 48.62ms |
| comp_2to1 | 17.60ms | 39.14ms | 17.91ms | 2.45ms | 33.41ms | 10.39ms |
| comp_4to1 | 10.47ms | 16.86ms | 9.80ms | 13.94ms | 18.99ms | 17.71ms |
| comp_1000to1 | 6μs | 44μs | 5μs | 4μs | 16μs | 18μs |
| comp_1to2 | 29.16ms | 47.56ms | 24.66ms | 20.82ms | 39.14ms | 30.95ms |
| comp_1to4 | 35.60ms | 46.71ms | 16.75ms | 8.19ms | 18.43ms | 31.63ms |
| comp_1to8 | 8.34ms | 44.62ms | 6.66ms | 4.67ms | 20.98ms | 25.45ms |
| comp_1to1000 | 6.85ms | 40.40ms | 4.47ms | 4.02ms | 15.57ms | 14.35ms |
| update_1to1 | 9.48ms | 5.77ms | 9.75ms | 10.00ms | 24.48ms | 16.12ms |
| update_2to1 | 4.67ms | 3.02ms | 4.93ms | 2.65ms | 11.09ms | 7.79ms |
| update_4to1 | 2.50ms | 1.64ms | 2.46ms | 2.50ms | 6.43ms | 3.99ms |
| update_1000to1 | 23μs | 15μs | 24μs | 10μs | 52μs | 39μs |
| update_1to2 | 4.68ms | 2.91ms | 4.89ms | 4.00ms | 10.55ms | 8.09ms |
| update_1to4 | 2.33ms | 1.54ms | 2.50ms | 1.13ms | 5.36ms | 4.00ms |
| update_1to1000 | 50μs | 387μs | 44μs | 52μs | 178μs | 144μs |
| cellx1000 | 10.23ms | 5.58ms | 10.20ms | 7.48ms | 83.63ms | 13.23ms |
| cellx2500 | 34.81ms | 25.77ms | 34.75ms | 20.92ms | 292.77ms | 41.65ms |
| cellx5000 | 90.16ms | 78.57ms | 76.68ms | 49.88ms | 681.94ms | 114.18ms |
| 10x5 - 2 sources - read 20.0% (simple) | 434.93ms | 243.97ms | 498.20ms | 233.93ms | 1.91s | 355.81ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.15ms | 203.37ms | 287.66ms | 175.77ms | 1.47s | 250.87ms |
| 1000x12 - 4 sources - dynamic (large) | 3.49s | 351.37ms | 3.65s | 287.60ms | 1.87s | 473.40ms |
| 1000x5 - 25 sources (wide dense) | 2.54s | 514.70ms | 3.47s | 404.23ms | 3.31s | 608.25ms |
| 5x500 - 3 sources (deep) | 224.83ms | 207.12ms | 222.16ms | 192.03ms | 1.11s | 252.09ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 446.89ms | 264.20ms | 482.88ms | 270.97ms | 1.66s | 383.74ms |

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
