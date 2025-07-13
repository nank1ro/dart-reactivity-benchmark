# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.28s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.32s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.72s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 147.50ms (fail) | 2.35s | 273.70ms | 201.57ms | 209.04ms | 184.93ms |
| broadPropagation | 6.02ms (fail) | 4.47s | 506.67ms | 459.65ms | 462.09ms | 344.42ms |
| deepPropagation | 143.13ms (fail) | 1.54s | 167.78ms | 176.54ms | 174.36ms | 119.93ms |
| diamond | 203.79ms (fail) | 2.47s | 352.43ms | 280.79ms | 289.03ms | 229.24ms |
| mux | 196.48ms (fail) | 1.83s | 440.97ms | 406.58ms | 409.75ms | 366.96ms |
| repeatedObservers | 52.81ms (fail) | 238.12ms | 81.45ms | 39.81ms | 44.78ms | 46.01ms |
| triangle | 75.86ms (fail) | 779.99ms | 118.11ms | 102.57ms | 99.34ms | 85.29ms |
| unstable | 336.11ms (fail) | 354.62ms | 98.05ms | 69.91ms | 79.36ms | 67.53ms |
| molBench | 921μs | 581.37ms | 492.00ms | 488.42ms | 485.51ms | 487.47ms |
| create_signals | 66.25ms | 71.03ms | 73.66ms | 5.17ms | 24.16ms | 26.94ms |
| comp_0to1 | 52.76ms | 25.74ms | 29.43ms | 17.01ms | 11.00ms | 8.00ms |
| comp_1to1 | 58.76ms | 18.33ms | 29.13ms | 13.95ms | 26.75ms | 4.26ms |
| comp_2to1 | 37.72ms | 17.53ms | 31.73ms | 22.02ms | 8.34ms | 2.28ms |
| comp_4to1 | 16.56ms | 18.41ms | 5.02ms | 14.14ms | 3.74ms | 10.31ms |
| comp_1000to1 | 42μs | 23μs | 17μs | 4μs | 4μs | 4μs |
| comp_1to2 | 45.46ms | 39.37ms | 33.31ms | 15.63ms | 12.90ms | 14.59ms |
| comp_1to4 | 43.82ms | 23.98ms | 21.61ms | 23.18ms | 11.01ms | 15.94ms |
| comp_1to8 | 42.88ms | 21.38ms | 21.31ms | 7.94ms | 6.34ms | 4.59ms |
| comp_1to1000 | 38.81ms | 16.03ms | 16.70ms | 5.60ms | 4.09ms | 3.16ms |
| update_1to1 | 5.68ms | 25.68ms | 16.44ms | 8.61ms | 8.90ms | 10.43ms |
| update_2to1 | 3.10ms | 11.28ms | 7.84ms | 4.27ms | 4.76ms | 2.31ms |
| update_4to1 | 1.42ms | 7.05ms | 3.99ms | 2.21ms | 2.26ms | 2.50ms |
| update_1000to1 | 14μs | 68μs | 40μs | 21μs | 22μs | 25μs |
| update_1to2 | 2.85ms | 12.74ms | 7.98ms | 4.62ms | 4.46ms | 5.04ms |
| update_1to4 | 1.46ms | 6.11ms | 4.03ms | 2.51ms | 2.22ms | 2.45ms |
| update_1to1000 | 379μs | 175μs | 182μs | 1.05ms | 41μs | 46μs |
| cellx1000 | 5.14ms | 67.53ms | 11.81ms | 9.63ms | 9.50ms | 7.11ms |
| cellx2500 | 24.91ms | 247.52ms | 31.78ms | 25.47ms | 30.49ms | 19.61ms |
| cellx5000 | 63.68ms | 533.59ms | 73.63ms | 65.01ms | 57.40ms | 42.77ms |
| 10x5 - 2 sources - read 20.0% (simple) | 248.86ms | 2.01s | 356.52ms | 477.50ms | 523.97ms | 232.99ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 201.41ms | 1.59s | 248.78ms | 282.28ms | 280.47ms | 182.33ms |
| 1000x12 - 4 sources - dynamic (large) | 344.25ms | 1.92s | 456.94ms | 3.69s | 3.72s | 279.46ms |
| 1000x5 - 25 sources (wide dense) | 503.86ms | 3.58s | 593.10ms | 2.72s | 3.57s | 413.54ms |
| 5x500 - 3 sources (deep) | 205.06ms | 1.15s | 259.51ms | 225.40ms | 223.42ms | 190.59ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 258.62ms | 1.69s | 379.01ms | 451.09ms | 475.53ms | 262.80ms |

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
