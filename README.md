# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.35s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 8.77s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.89s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 9.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 25.86s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.08s |

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
| avoidablePropagation | 193.30ms | 132.44ms (fail) | 203.55ms | 168.33ms | 2.25s | 247.41ms |
| broadPropagation | 381.40ms | 5.50ms (fail) | 423.52ms | 304.97ms | 4.04s | 462.38ms |
| deepPropagation | 177.62ms | 156.95ms (fail) | 174.02ms | 107.60ms | 1.43s | 150.68ms |
| diamond | 256.34ms | 175.41ms (fail) | 265.68ms | 233.43ms | 2.23s | 345.59ms |
| mux | 332.82ms | 157.78ms (fail) | 334.08ms | 326.38ms | 1.71s | 381.54ms |
| repeatedObservers | 34.41ms | 45.54ms (fail) | 39.37ms | 40.62ms | 217.96ms | 73.17ms |
| triangle | 94.33ms | 75.41ms (fail) | 91.72ms | 80.26ms | 718.77ms | 114.56ms |
| unstable | 58.52ms | 315.06ms (fail) | 66.03ms | 57.87ms | 320.05ms | 96.69ms |
| molBench | 366.15ms | 1.21ms | 388.93ms | 362.73ms | 476.44ms | 370.65ms |
| create_signals | 6.94ms | 72.44ms | 24.26ms | 34.17ms | 45.50ms | 72.74ms |
| comp_0to1 | 20.65ms | 58.17ms | 11.84ms | 17.23ms | 15.21ms | 41.33ms |
| comp_1to1 | 25.49ms | 61.82ms | 30.21ms | 5.94ms | 29.11ms | 53.04ms |
| comp_2to1 | 14.87ms | 45.00ms | 16.59ms | 3.43ms | 43.36ms | 29.48ms |
| comp_4to1 | 12.71ms | 15.73ms | 9.41ms | 12.81ms | 25.52ms | 17.55ms |
| comp_1000to1 | 12μs | 39μs | 6μs | 5μs | 16μs | 18μs |
| comp_1to2 | 18.75ms | 44.29ms | 23.28ms | 15.73ms | 37.87ms | 40.60ms |
| comp_1to4 | 26.96ms | 44.38ms | 22.44ms | 10.95ms | 22.91ms | 19.91ms |
| comp_1to8 | 8.38ms | 42.59ms | 8.48ms | 5.83ms | 23.88ms | 25.52ms |
| comp_1to1000 | 6.11ms | 37.35ms | 5.49ms | 5.32ms | 14.99ms | 14.87ms |
| update_1to1 | 8.39ms | 4.56ms | 9.87ms | 3.93ms | 19.88ms | 14.39ms |
| update_2to1 | 4.30ms | 2.42ms | 5.11ms | 1.92ms | 9.81ms | 7.25ms |
| update_4to1 | 2.00ms | 1.15ms | 2.43ms | 956μs | 4.97ms | 3.62ms |
| update_1000to1 | 18μs | 11μs | 26μs | 9μs | 50μs | 37μs |
| update_1to2 | 3.83ms | 2.37ms | 5.20ms | 1.93ms | 9.79ms | 7.13ms |
| update_1to4 | 2.22ms | 1.22ms | 2.49ms | 938μs | 4.92ms | 3.59ms |
| update_1to1000 | 179μs | 397μs | 60μs | 44μs | 158μs | 166μs |
| cellx1000 | 10.74ms | 7.57ms | 12.32ms | 9.11ms | 81.21ms | 18.23ms |
| cellx2500 | 31.63ms | 27.27ms | 37.93ms | 27.84ms | 256.30ms | 50.91ms |
| cellx5000 | 86.83ms | 56.13ms | 79.83ms | 70.11ms | 574.74ms | 115.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 398.72ms | 233.88ms | 417.68ms | 227.19ms | 2.00s | 361.79ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 234.91ms | 173.58ms | 237.42ms | 172.99ms | 1.47s | 252.04ms |
| 1000x12 - 4 sources - dynamic (large) | 3.03s | 272.79ms | 3.16s | 253.41ms | 1.65s | 371.44ms |
| 1000x5 - 25 sources (wide dense) | 2.31s | 386.90ms | 2.59s | 357.76ms | 3.33s | 545.03ms |
| 5x500 - 3 sources (deep) | 226.30ms | 202.96ms | 214.71ms | 199.35ms | 1.15s | 273.75ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 387.97ms | 217.91ms | 398.94ms | 226.15ms | 1.65s | 310.94ms |

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
