# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.32s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 8.88s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 4.80s |
| 4 | signals | 0.29 | 100.0% | 35/35 | 9.25s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 25.94s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.27s | 200.70ms | 170.45ms | 187.80ms | 243.30ms | 133.96ms (fail) |
| broadPropagation | 4.06s | 381.95ms | 301.49ms | 389.10ms | 463.04ms | 5.54ms (fail) |
| deepPropagation | 1.42s | 178.37ms | 107.97ms | 181.42ms | 151.45ms | 152.78ms (fail) |
| diamond | 2.22s | 261.41ms | 232.20ms | 252.76ms | 343.53ms | 174.89ms (fail) |
| mux | 1.71s | 329.96ms | 334.88ms | 330.78ms | 388.74ms | 157.53ms (fail) |
| repeatedObservers | 222.45ms | 39.63ms | 39.47ms | 33.68ms | 72.44ms | 45.78ms (fail) |
| triangle | 736.96ms | 92.31ms | 80.80ms | 90.81ms | 111.68ms | 75.30ms (fail) |
| unstable | 316.86ms | 66.19ms | 59.35ms | 58.63ms | 96.27ms | 322.50ms (fail) |
| molBench | 450.15ms | 365.35ms | 363.19ms | 388.48ms | 370.56ms | 856μs |
| create_signals | 69.73ms | 23.18ms | 30.50ms | 6.63ms | 71.89ms | 61.02ms |
| comp_0to1 | 23.53ms | 11.33ms | 8.70ms | 19.64ms | 25.98ms | 53.64ms |
| comp_1to1 | 34.90ms | 28.64ms | 5.74ms | 16.82ms | 38.38ms | 57.89ms |
| comp_2to1 | 12.37ms | 11.15ms | 3.21ms | 12.49ms | 24.34ms | 35.84ms |
| comp_4to1 | 24.46ms | 7.51ms | 8.36ms | 13.26ms | 15.85ms | 16.87ms |
| comp_1000to1 | 37μs | 8μs | 8μs | 6μs | 24μs | 45μs |
| comp_1to2 | 41.68ms | 20.72ms | 20.32ms | 23.99ms | 32.75ms | 47.48ms |
| comp_1to4 | 33.09ms | 13.78ms | 7.62ms | 31.17ms | 23.72ms | 46.39ms |
| comp_1to8 | 25.38ms | 8.45ms | 8.16ms | 15.27ms | 22.36ms | 47.52ms |
| comp_1to1000 | 15.80ms | 4.67ms | 4.01ms | 9.26ms | 14.35ms | 41.87ms |
| update_1to1 | 19.95ms | 8.69ms | 3.85ms | 8.04ms | 14.37ms | 4.66ms |
| update_2to1 | 9.75ms | 4.29ms | 1.93ms | 3.92ms | 7.12ms | 2.46ms |
| update_4to1 | 5.51ms | 2.16ms | 1.28ms | 1.85ms | 3.58ms | 1.14ms |
| update_1000to1 | 50μs | 21μs | 9μs | 18μs | 37μs | 11μs |
| update_1to2 | 10.10ms | 4.35ms | 1.95ms | 3.85ms | 7.32ms | 2.21ms |
| update_1to4 | 4.95ms | 2.19ms | 1.05ms | 1.99ms | 3.66ms | 1.09ms |
| update_1to1000 | 161μs | 54μs | 44μs | 59μs | 151μs | 391μs |
| cellx1000 | 82.78ms | 9.55ms | 9.07ms | 11.45ms | 16.71ms | 7.69ms |
| cellx2500 | 236.21ms | 30.10ms | 25.52ms | 27.79ms | 42.75ms | 31.79ms |
| cellx5000 | 529.57ms | 66.95ms | 55.74ms | 71.20ms | 92.54ms | 76.81ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.00s | 426.51ms | 230.87ms | 410.26ms | 359.39ms | 224.10ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.49s | 239.51ms | 171.10ms | 236.26ms | 251.41ms | 172.62ms |
| 1000x12 - 4 sources - dynamic (large) | 1.69s | 3.19s | 251.28ms | 3.09s | 366.86ms | 271.92ms |
| 1000x5 - 25 sources (wide dense) | 3.36s | 2.61s | 352.66ms | 2.32s | 539.09ms | 380.27ms |
| 5x500 - 3 sources (deep) | 1.15s | 215.85ms | 207.82ms | 226.67ms | 272.93ms | 202.76ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.65s | 399.26ms | 223.89ms | 400.58ms | 313.69ms | 218.36ms |

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
