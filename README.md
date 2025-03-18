# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.01s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.37s |
| 4 | signals | 0.22 | 100.0% | 35/35 | 11.22s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.58s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.53s |

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
| avoidablePropagation | 273.88ms | 204.29ms | 2.31s | 187.58ms | 206.14ms | 163.16ms (fail) |
| broadPropagation | 498.34ms | 464.11ms | 4.33s | 363.86ms | 459.80ms | 6.52ms (fail) |
| deepPropagation | 173.12ms | 174.20ms | 1.54s | 124.27ms | 182.55ms | 144.10ms (fail) |
| diamond | 352.55ms | 278.43ms | 2.41s | 238.56ms | 286.86ms | 203.75ms (fail) |
| mux | 442.16ms | 385.63ms | 1.90s | 372.91ms | 410.75ms | 207.34ms (fail) |
| repeatedObservers | 83.37ms | 38.77ms | 229.64ms | 45.92ms | 46.20ms | 52.32ms (fail) |
| triangle | 116.38ms | 104.61ms | 763.03ms | 85.99ms | 100.98ms | 83.28ms (fail) |
| unstable | 94.06ms | 70.73ms | 351.21ms | 60.70ms | 74.43ms | 338.84ms (fail) |
| molBench | 494.40ms | 490.90ms | 579.68ms | 491.84ms | 486.52ms | 1.23ms |
| create_signals | 87.80ms | 4.58ms | 69.19ms | 25.83ms | 25.72ms | 68.90ms |
| comp_0to1 | 56.43ms | 17.97ms | 23.79ms | 7.24ms | 11.55ms | 55.78ms |
| comp_1to1 | 46.57ms | 11.61ms | 16.98ms | 4.13ms | 27.47ms | 60.24ms |
| comp_2to1 | 28.81ms | 10.05ms | 25.50ms | 2.28ms | 13.68ms | 38.52ms |
| comp_4to1 | 16.93ms | 16.06ms | 19.02ms | 7.79ms | 2.00ms | 18.05ms |
| comp_1000to1 | 15μs | 4μs | 14μs | 3μs | 15μs | 41μs |
| comp_1to2 | 32.30ms | 19.81ms | 33.23ms | 11.14ms | 19.17ms | 44.38ms |
| comp_1to4 | 15.67ms | 28.67ms | 22.48ms | 12.57ms | 9.66ms | 43.46ms |
| comp_1to8 | 21.27ms | 5.33ms | 20.52ms | 3.88ms | 10.82ms | 42.77ms |
| comp_1to1000 | 15.45ms | 6.15ms | 16.87ms | 3.19ms | 6.90ms | 37.65ms |
| update_1to1 | 16.18ms | 8.20ms | 21.36ms | 11.38ms | 15.01ms | 5.72ms |
| update_2to1 | 9.58ms | 4.07ms | 10.52ms | 5.03ms | 7.53ms | 2.86ms |
| update_4to1 | 4.04ms | 2.08ms | 5.85ms | 2.79ms | 3.84ms | 1.43ms |
| update_1000to1 | 41μs | 20μs | 55μs | 10μs | 41μs | 15μs |
| update_1to2 | 8.10ms | 4.05ms | 10.55ms | 5.73ms | 7.77ms | 2.98ms |
| update_1to4 | 4.03ms | 2.06ms | 5.27ms | 2.52ms | 3.79ms | 1.44ms |
| update_1to1000 | 150μs | 846μs | 161μs | 42μs | 75μs | 382μs |
| cellx1000 | 12.20ms | 9.70ms | 71.12ms | 7.23ms | 11.71ms | 5.95ms |
| cellx2500 | 45.33ms | 27.69ms | 256.00ms | 20.27ms | 32.91ms | 27.42ms |
| cellx5000 | 131.55ms | 73.70ms | 574.17ms | 47.73ms | 71.43ms | 76.21ms |
| 10x5 - 2 sources - read 20.0% (simple) | 347.33ms | 445.58ms | 2.02s | 234.56ms | 504.82ms | 252.36ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.79ms | 272.31ms | 1.55s | 176.33ms | 283.82ms | 213.45ms |
| 1000x12 - 4 sources - dynamic (large) | 470.77ms | 3.53s | 1.91s | 287.76ms | 3.74s | 359.40ms |
| 1000x5 - 25 sources (wide dense) | 595.13ms | 2.61s | 3.57s | 411.05ms | 3.45s | 499.21ms |
| 5x500 - 3 sources (deep) | 257.51ms | 230.46ms | 1.16s | 192.06ms | 230.51ms | 205.79ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 379.60ms | 453.58ms | 1.75s | 265.53ms | 481.57ms | 269.67ms |

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
