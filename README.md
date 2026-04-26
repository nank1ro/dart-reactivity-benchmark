# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.15s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.50s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.70s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 2.29s | 200.41ms | 196.05ms | 209.92ms | 276.65ms | 149.88ms (fail) |
| broadPropagation | 4.28s | 467.52ms | 359.67ms | 469.93ms | 496.30ms | 6.91ms (fail) |
| deepPropagation | 1.54s | 170.69ms | 129.49ms | 183.74ms | 165.14ms | 136.26ms (fail) |
| diamond | 2.32s | 291.02ms | 245.64ms | 288.54ms | 338.08ms | 200.53ms (fail) |
| mux | 1.76s | 395.94ms | 362.43ms | 372.80ms | 416.52ms | 182.54ms (fail) |
| repeatedObservers | 225.21ms | 45.56ms | 45.59ms | 42.84ms | 80.83ms | 58.34ms (fail) |
| triangle | 761.59ms | 100.66ms | 87.82ms | 101.17ms | 116.66ms | 77.12ms (fail) |
| unstable | 338.24ms | 75.64ms | 62.02ms | 71.69ms | 95.70ms | 335.53ms (fail) |
| molBench | 585.78ms | 494.05ms | 480.94ms | 495.68ms | 489.58ms | 997μs |
| create_signals | 88.50ms | 25.51ms | 27.10ms | 5.38ms | 88.19ms | 58.72ms |
| comp_0to1 | 25.89ms | 11.35ms | 7.09ms | 17.54ms | 38.38ms | 54.10ms |
| comp_1to1 | 30.94ms | 17.94ms | 4.51ms | 13.87ms | 39.94ms | 54.38ms |
| comp_2to1 | 34.01ms | 15.21ms | 2.48ms | 15.87ms | 45.95ms | 36.16ms |
| comp_4to1 | 15.24ms | 2.67ms | 10.46ms | 15.12ms | 13.17ms | 16.54ms |
| comp_1000to1 | 15μs | 5μs | 3μs | 4μs | 16μs | 43μs |
| comp_1to2 | 37.89ms | 12.84ms | 15.27ms | 18.71ms | 32.64ms | 45.80ms |
| comp_1to4 | 22.95ms | 11.60ms | 9.01ms | 33.26ms | 16.03ms | 45.23ms |
| comp_1to8 | 22.61ms | 6.10ms | 3.90ms | 6.66ms | 21.22ms | 44.41ms |
| comp_1to1000 | 15.43ms | 4.09ms | 5.68ms | 6.34ms | 17.12ms | 39.68ms |
| update_1to1 | 21.24ms | 8.94ms | 8.74ms | 9.23ms | 15.72ms | 8.91ms |
| update_2to1 | 10.41ms | 4.46ms | 2.60ms | 4.58ms | 7.90ms | 2.91ms |
| update_4to1 | 5.37ms | 2.26ms | 1.23ms | 2.31ms | 3.90ms | 2.46ms |
| update_1000to1 | 52μs | 22μs | 11μs | 23μs | 39μs | 14μs |
| update_1to2 | 10.41ms | 4.43ms | 2.34ms | 4.57ms | 8.03ms | 3.98ms |
| update_1to4 | 5.19ms | 2.25ms | 1.21ms | 2.46ms | 3.94ms | 1.44ms |
| update_1to1000 | 157μs | 41μs | 46μs | 863μs | 151μs | 384μs |
| cellx1000 | 70.36ms | 9.64ms | 8.98ms | 9.83ms | 11.78ms | 5.17ms |
| cellx2500 | 238.76ms | 31.13ms | 19.24ms | 28.34ms | 30.88ms | 24.25ms |
| cellx5000 | 530.04ms | 61.44ms | 40.99ms | 76.90ms | 67.66ms | 61.62ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.97s | 506.81ms | 238.37ms | 455.70ms | 360.36ms | 259.03ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.49s | 282.62ms | 184.10ms | 278.56ms | 249.06ms | 199.24ms |
| 1000x12 - 4 sources - dynamic (large) | 1.85s | 3.82s | 274.60ms | 3.77s | 464.20ms | 336.19ms |
| 1000x5 - 25 sources (wide dense) | 3.34s | 3.37s | 413.96ms | 2.79s | 598.89ms | 516.51ms |
| 5x500 - 3 sources (deep) | 1.12s | 224.77ms | 197.17ms | 232.58ms | 252.39ms | 206.53ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.64s | 475.38ms | 263.35ms | 452.69ms | 385.06ms | 256.84ms |

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
