# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.64s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.39s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 9.89s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.63s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.89ms | 196.78ms | 2.31s | 193.49ms | 202.27ms | 146.56ms (fail) |
| broadPropagation | 500.68ms | 440.06ms | 4.31s | 346.31ms | 448.47ms | 5.93ms (fail) |
| deepPropagation | 166.12ms | 178.41ms | 1.55s | 120.15ms | 176.14ms | 147.15ms (fail) |
| diamond | 343.66ms | 276.60ms | 2.44s | 232.09ms | 279.26ms | 197.87ms (fail) |
| mux | 431.52ms | 373.37ms | 1.82s | 359.79ms | 399.14ms | 195.11ms (fail) |
| repeatedObservers | 75.78ms | 36.44ms | 227.78ms | 43.73ms | 46.13ms | 51.14ms (fail) |
| triangle | 108.75ms | 94.90ms | 759.73ms | 83.81ms | 100.62ms | 74.93ms (fail) |
| unstable | 93.74ms | 68.81ms | 347.00ms | 60.18ms | 70.58ms | 340.73ms (fail) |
| molBench | 478.71ms | 478.31ms | 570.05ms | 480.50ms | 478.57ms | 1.16ms |
| create_signals | 94.79ms | 4.54ms | 63.05ms | 26.16ms | 30.43ms | 69.86ms |
| comp_0to1 | 33.91ms | 22.74ms | 15.44ms | 6.54ms | 13.78ms | 57.85ms |
| comp_1to1 | 44.92ms | 17.91ms | 40.76ms | 3.91ms | 25.78ms | 53.69ms |
| comp_2to1 | 42.08ms | 20.88ms | 22.73ms | 2.24ms | 14.95ms | 35.48ms |
| comp_4to1 | 12.85ms | 10.95ms | 20.06ms | 8.40ms | 1.81ms | 16.39ms |
| comp_1000to1 | 15μs | 4μs | 16μs | 3μs | 4μs | 42μs |
| comp_1to2 | 38.05ms | 25.83ms | 36.73ms | 10.14ms | 18.70ms | 45.01ms |
| comp_1to4 | 14.93ms | 20.20ms | 18.20ms | 14.28ms | 11.24ms | 42.35ms |
| comp_1to8 | 19.64ms | 13.41ms | 20.77ms | 4.17ms | 7.28ms | 42.10ms |
| comp_1to1000 | 14.54ms | 10.10ms | 15.29ms | 2.87ms | 6.72ms | 38.82ms |
| update_1to1 | 16.17ms | 8.81ms | 23.41ms | 11.10ms | 9.22ms | 5.73ms |
| update_2to1 | 8.32ms | 4.48ms | 10.72ms | 4.90ms | 4.55ms | 2.72ms |
| update_4to1 | 4.05ms | 3.37ms | 7.06ms | 2.56ms | 2.34ms | 1.42ms |
| update_1000to1 | 40μs | 19μs | 63μs | 9μs | 23μs | 15μs |
| update_1to2 | 8.09ms | 4.03ms | 13.02ms | 5.37ms | 4.85ms | 2.95ms |
| update_1to4 | 4.06ms | 2.00ms | 7.87ms | 2.26ms | 2.34ms | 1.52ms |
| update_1to1000 | 149μs | 1.46ms | 187μs | 45μs | 43μs | 379μs |
| cellx1000 | 12.90ms | 9.58ms | 80.19ms | 6.87ms | 9.45ms | 5.09ms |
| cellx2500 | 31.25ms | 24.88ms | 279.06ms | 19.00ms | 32.11ms | 27.57ms |
| cellx5000 | 60.89ms | 63.77ms | 563.18ms | 42.02ms | 62.18ms | 53.33ms |
| 10x5 - 2 sources - read 20.0% (simple) | 350.89ms | 432.74ms | 2.05s | 237.85ms | 510.85ms | 282.93ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.50ms | 268.15ms | 1.57s | 171.91ms | 276.68ms | 245.58ms |
| 1000x12 - 4 sources - dynamic (large) | 454.25ms | 3.53s | 1.94s | 271.96ms | 3.96s | 343.70ms |
| 1000x5 - 25 sources (wide dense) | 596.14ms | 2.57s | 3.53s | 407.03ms | 3.51s | 530.58ms |
| 5x500 - 3 sources (deep) | 267.93ms | 229.21ms | 1.20s | 190.55ms | 223.47ms | 197.89ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.63ms | 449.58ms | 1.77s | 263.03ms | 460.66ms | 274.87ms |

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
