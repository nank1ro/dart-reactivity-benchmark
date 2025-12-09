# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.34s |
| 🥈 | signals | 0.29 | 100.0% | 35/35 | 9.15s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.97s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 8.63s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.65s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.14s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 196.54ms | 167.80ms | 136.14ms (fail) | 247.94ms | 184.54ms | 2.23s |
| broadPropagation | 399.88ms | 302.68ms | 5.79ms (fail) | 455.20ms | 382.57ms | 4.10s |
| deepPropagation | 170.93ms | 107.66ms | 153.70ms (fail) | 149.44ms | 174.45ms | 1.43s |
| diamond | 257.72ms | 235.94ms | 176.69ms (fail) | 347.69ms | 253.16ms | 2.25s |
| mux | 333.07ms | 326.83ms | 159.31ms (fail) | 381.96ms | 329.72ms | 1.87s |
| repeatedObservers | 39.16ms | 40.63ms | 47.65ms (fail) | 72.72ms | 35.28ms | 226.85ms |
| triangle | 93.40ms | 80.59ms | 74.78ms (fail) | 112.83ms | 97.36ms | 759.60ms |
| unstable | 64.67ms | 59.53ms | 328.00ms (fail) | 97.79ms | 58.67ms | 338.17ms |
| molBench | 390.43ms | 365.71ms | 845μs | 397.20ms | 365.09ms | 482.79ms |
| create_signals | 24.63ms | 33.69ms | 71.32ms | 78.66ms | 6.73ms | 50.10ms |
| comp_0to1 | 12.22ms | 9.46ms | 62.63ms | 28.25ms | 21.06ms | 20.26ms |
| comp_1to1 | 16.66ms | 6.07ms | 62.93ms | 50.14ms | 13.13ms | 34.99ms |
| comp_2to1 | 18.80ms | 3.40ms | 46.95ms | 26.16ms | 22.68ms | 24.45ms |
| comp_4to1 | 2.85ms | 10.42ms | 19.97ms | 6.58ms | 10.82ms | 24.34ms |
| comp_1000to1 | 10μs | 5μs | 45μs | 17μs | 12μs | 17μs |
| comp_1to2 | 16.39ms | 18.01ms | 45.81ms | 42.45ms | 30.43ms | 32.19ms |
| comp_1to4 | 16.09ms | 8.04ms | 46.16ms | 17.39ms | 27.98ms | 31.10ms |
| comp_1to8 | 13.98ms | 8.22ms | 43.79ms | 23.55ms | 7.95ms | 26.79ms |
| comp_1to1000 | 6.10ms | 4.96ms | 38.49ms | 15.79ms | 7.06ms | 16.98ms |
| update_1to1 | 8.81ms | 5.21ms | 4.62ms | 14.37ms | 8.41ms | 20.55ms |
| update_2to1 | 4.89ms | 1.95ms | 2.56ms | 7.23ms | 4.29ms | 9.95ms |
| update_4to1 | 2.21ms | 1.06ms | 1.26ms | 3.63ms | 2.15ms | 5.56ms |
| update_1000to1 | 20μs | 11μs | 12μs | 37μs | 21μs | 50μs |
| update_1to2 | 4.31ms | 1.89ms | 2.39ms | 7.88ms | 3.80ms | 10.38ms |
| update_1to4 | 2.13ms | 1.08ms | 1.26ms | 3.63ms | 2.15ms | 4.87ms |
| update_1to1000 | 59μs | 75μs | 373μs | 161μs | 825μs | 169μs |
| cellx1000 | 11.03ms | 8.85ms | 10.65ms | 21.19ms | 11.62ms | 109.35ms |
| cellx2500 | 33.01ms | 26.25ms | 34.92ms | 69.83ms | 34.47ms | 304.93ms |
| cellx5000 | 96.10ms | 77.52ms | 86.05ms | 184.38ms | 99.49ms | 644.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 416.66ms | 224.49ms | 223.78ms | 361.03ms | 381.78ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 239.47ms | 172.66ms | 172.50ms | 252.37ms | 233.39ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.09s | 250.18ms | 273.65ms | 366.82ms | 2.97s | 1.76s |
| 1000x5 - 25 sources (wide dense) | 2.57s | 354.95ms | 382.39ms | 544.25ms | 2.25s | 3.41s |
| 5x500 - 3 sources (deep) | 211.86ms | 199.35ms | 201.45ms | 271.61ms | 224.08ms | 1.19s |
| 100x15 - 6 sources - dynamic (very dynamic) | 389.00ms | 224.39ms | 221.07ms | 306.90ms | 378.36ms | 1.69s |

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
