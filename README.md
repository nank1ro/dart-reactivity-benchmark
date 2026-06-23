# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.73s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.84s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.33s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.01s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.54s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.35s |

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
| avoidablePropagation | 218.47ms | 157.56ms (fail) | 210.74ms | 183.43ms | 2.30s | 265.56ms |
| broadPropagation | 521.75ms | 6.40ms (fail) | 474.44ms | 358.86ms | 4.18s | 483.98ms |
| deepPropagation | 190.23ms | 152.21ms (fail) | 193.98ms | 121.53ms | 1.48s | 165.63ms |
| diamond | 284.98ms | 188.65ms (fail) | 292.31ms | 261.39ms | 2.27s | 375.19ms |
| mux | 387.29ms | 184.79ms (fail) | 393.26ms | 359.74ms | 1.71s | 430.45ms |
| repeatedObservers | 41.82ms | 53.98ms (fail) | 46.91ms | 42.90ms | 228.97ms | 88.93ms |
| triangle | 105.77ms | 92.31ms (fail) | 106.93ms | 86.70ms | 721.95ms | 120.07ms |
| unstable | 73.09ms | 342.88ms (fail) | 79.78ms | 60.69ms | 338.84ms | 106.09ms |
| molBench | 547.97ms | 1.00ms | 547.49ms | 552.37ms | 639.83ms | 559.23ms |
| create_signals | 5.70ms | 61.12ms | 27.71ms | 23.53ms | 54.90ms | 56.13ms |
| comp_0to1 | 19.66ms | 53.32ms | 12.08ms | 8.97ms | 15.01ms | 25.91ms |
| comp_1to1 | 15.60ms | 54.27ms | 33.14ms | 4.31ms | 42.81ms | 29.59ms |
| comp_2to1 | 20.12ms | 37.68ms | 13.51ms | 2.28ms | 24.56ms | 41.57ms |
| comp_4to1 | 12.72ms | 15.73ms | 7.76ms | 12.60ms | 30.69ms | 14.22ms |
| comp_1000to1 | 4μs | 39μs | 6μs | 3μs | 83μs | 18μs |
| comp_1to2 | 32.59ms | 44.21ms | 23.31ms | 16.90ms | 37.81ms | 36.34ms |
| comp_1to4 | 21.22ms | 43.38ms | 7.51ms | 6.89ms | 17.34ms | 21.76ms |
| comp_1to8 | 8.04ms | 41.28ms | 6.12ms | 6.44ms | 19.41ms | 19.96ms |
| comp_1to1000 | 3.33ms | 36.65ms | 4.00ms | 3.50ms | 14.60ms | 14.24ms |
| update_1to1 | 8.43ms | 6.16ms | 10.62ms | 4.39ms | 23.58ms | 16.38ms |
| update_2to1 | 4.21ms | 3.39ms | 5.34ms | 2.30ms | 11.50ms | 8.18ms |
| update_4to1 | 2.11ms | 1.64ms | 2.65ms | 1.15ms | 5.90ms | 4.07ms |
| update_1000to1 | 21μs | 25μs | 28μs | 11μs | 58μs | 40μs |
| update_1to2 | 4.20ms | 3.30ms | 5.34ms | 2.18ms | 11.42ms | 8.55ms |
| update_1to4 | 2.12ms | 1.65ms | 2.61ms | 1.15ms | 5.79ms | 4.15ms |
| update_1to1000 | 44μs | 366μs | 40μs | 42μs | 153μs | 143μs |
| cellx1000 | 12.64ms | 4.79ms | 9.50ms | 6.82ms | 73.68ms | 11.05ms |
| cellx2500 | 26.99ms | 22.03ms | 31.57ms | 18.75ms | 263.18ms | 31.90ms |
| cellx5000 | 69.42ms | 66.03ms | 66.84ms | 44.40ms | 596.95ms | 73.85ms |
| 10x5 - 2 sources - read 20.0% (simple) | 426.03ms | 251.54ms | 483.74ms | 243.03ms | 1.98s | 373.64ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 269.74ms | 203.50ms | 274.58ms | 187.00ms | 1.40s | 270.73ms |
| 1000x12 - 4 sources - dynamic (large) | 3.32s | 313.67ms | 3.56s | 267.57ms | 1.81s | 428.84ms |
| 1000x5 - 25 sources (wide dense) | 2.51s | 468.90ms | 3.38s | 406.58ms | 3.42s | 639.55ms |
| 5x500 - 3 sources (deep) | 233.70ms | 202.35ms | 228.48ms | 193.28ms | 1.14s | 265.82ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 437.14ms | 236.47ms | 468.45ms | 237.03ms | 1.68s | 341.31ms |

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
