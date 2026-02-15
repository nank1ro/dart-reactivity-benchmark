# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.77s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.34s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.74s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.55s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.88s |
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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.72ms | 2.33s | 148.49ms (fail) | 200.66ms | 205.44ms | 275.41ms |
| broadPropagation | 463.58ms | 4.27s | 6.16ms (fail) | 361.56ms | 453.93ms | 500.10ms |
| deepPropagation | 168.98ms | 1.53s | 136.82ms (fail) | 128.12ms | 175.14ms | 165.81ms |
| diamond | 284.69ms | 2.32s | 192.91ms (fail) | 243.25ms | 287.78ms | 351.78ms |
| mux | 402.21ms | 1.75s | 184.42ms (fail) | 365.58ms | 378.06ms | 413.62ms |
| repeatedObservers | 46.06ms | 226.54ms | 55.67ms (fail) | 45.83ms | 41.53ms | 83.38ms |
| triangle | 100.17ms | 772.03ms | 78.19ms (fail) | 89.14ms | 100.25ms | 114.30ms |
| unstable | 75.69ms | 339.73ms | 336.18ms (fail) | 61.93ms | 70.75ms | 95.30ms |
| molBench | 495.62ms | 586.30ms | 1.20ms | 480.97ms | 495.25ms | 494.23ms |
| create_signals | 27.08ms | 54.33ms | 61.07ms | 22.44ms | 5.48ms | 68.58ms |
| comp_0to1 | 12.13ms | 14.79ms | 54.44ms | 8.63ms | 18.62ms | 27.48ms |
| comp_1to1 | 24.55ms | 46.28ms | 56.01ms | 4.35ms | 14.03ms | 43.38ms |
| comp_2to1 | 19.33ms | 30.12ms | 38.03ms | 2.35ms | 17.57ms | 18.46ms |
| comp_4to1 | 3.76ms | 14.02ms | 31.27ms | 10.99ms | 15.89ms | 12.94ms |
| comp_1000to1 | 8μs | 16μs | 41μs | 3μs | 4μs | 19μs |
| comp_1to2 | 17.15ms | 35.38ms | 45.95ms | 13.48ms | 19.23ms | 31.80ms |
| comp_1to4 | 14.19ms | 17.49ms | 45.51ms | 17.46ms | 30.51ms | 18.83ms |
| comp_1to8 | 7.13ms | 20.41ms | 44.27ms | 4.97ms | 6.94ms | 26.92ms |
| comp_1to1000 | 4.23ms | 15.53ms | 39.27ms | 3.32ms | 6.11ms | 14.75ms |
| update_1to1 | 8.92ms | 21.40ms | 7.30ms | 4.67ms | 9.06ms | 15.96ms |
| update_2to1 | 4.47ms | 10.82ms | 2.85ms | 2.35ms | 4.58ms | 7.93ms |
| update_4to1 | 2.27ms | 5.45ms | 1.51ms | 1.27ms | 2.32ms | 3.99ms |
| update_1000to1 | 21μs | 52μs | 14μs | 11μs | 31μs | 40μs |
| update_1to2 | 4.44ms | 10.47ms | 4.62ms | 2.33ms | 4.49ms | 7.95ms |
| update_1to4 | 2.26ms | 5.40ms | 1.48ms | 1.21ms | 2.47ms | 4.21ms |
| update_1to1000 | 42μs | 171μs | 387μs | 50μs | 1.03ms | 148μs |
| cellx1000 | 10.71ms | 76.80ms | 5.42ms | 7.68ms | 10.49ms | 14.93ms |
| cellx2500 | 34.25ms | 265.28ms | 29.30ms | 27.16ms | 30.21ms | 61.26ms |
| cellx5000 | 72.16ms | 572.02ms | 83.47ms | 65.39ms | 84.26ms | 160.31ms |
| 10x5 - 2 sources - read 20.0% (simple) | 498.02ms | 1.99s | 246.00ms | 238.28ms | 468.85ms | 366.69ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.97ms | 1.48s | 204.27ms | 183.95ms | 275.19ms | 248.93ms |
| 1000x12 - 4 sources - dynamic (large) | 3.50s | 1.88s | 353.81ms | 284.22ms | 3.84s | 458.93ms |
| 1000x5 - 25 sources (wide dense) | 3.25s | 3.38s | 518.93ms | 409.99ms | 2.79s | 595.89ms |
| 5x500 - 3 sources (deep) | 222.20ms | 1.11s | 211.76ms | 203.75ms | 232.55ms | 252.88ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 483.49ms | 1.70s | 269.36ms | 267.99ms | 452.61ms | 383.07ms |

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
