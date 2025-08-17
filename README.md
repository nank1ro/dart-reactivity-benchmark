# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.39s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.15s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.46s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.24s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.59s |

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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.33s | 160.22ms (fail) | 202.06ms | 193.19ms | 276.32ms | 215.09ms |
| broadPropagation | 4.30s | 6.44ms (fail) | 463.73ms | 355.17ms | 525.96ms | 458.41ms |
| deepPropagation | 1.53s | 140.63ms (fail) | 177.12ms | 128.41ms | 167.18ms | 175.20ms |
| diamond | 2.39s | 210.07ms (fail) | 279.14ms | 236.72ms | 348.98ms | 287.82ms |
| mux | 1.82s | 195.86ms (fail) | 386.66ms | 377.97ms | 448.76ms | 407.51ms |
| repeatedObservers | 228.35ms | 52.53ms (fail) | 40.19ms | 43.66ms | 82.43ms | 46.34ms |
| triangle | 766.37ms | 86.31ms (fail) | 98.52ms | 85.22ms | 116.50ms | 99.96ms |
| unstable | 342.46ms | 382.42ms (fail) | 74.43ms | 61.24ms | 97.50ms | 75.80ms |
| molBench | 582.10ms | 902μs | 488.81ms | 489.27ms | 501.35ms | 438.08ms |
| create_signals | 67.89ms | 68.77ms | 4.64ms | 28.42ms | 96.58ms | 25.14ms |
| comp_0to1 | 15.39ms | 61.27ms | 17.68ms | 7.41ms | 36.05ms | 11.77ms |
| comp_1to1 | 47.00ms | 57.80ms | 14.88ms | 4.29ms | 42.10ms | 28.50ms |
| comp_2to1 | 23.37ms | 38.45ms | 16.72ms | 2.26ms | 37.41ms | 9.21ms |
| comp_4to1 | 24.61ms | 16.97ms | 12.65ms | 8.49ms | 4.26ms | 2.02ms |
| comp_1000to1 | 16μs | 44μs | 5μs | 6μs | 26μs | 5μs |
| comp_1to2 | 38.68ms | 47.77ms | 14.10ms | 18.05ms | 35.69ms | 23.32ms |
| comp_1to4 | 22.81ms | 46.06ms | 23.93ms | 7.61ms | 20.97ms | 14.48ms |
| comp_1to8 | 23.49ms | 45.54ms | 5.85ms | 7.54ms | 19.37ms | 7.83ms |
| comp_1to1000 | 15.36ms | 41.50ms | 6.69ms | 3.57ms | 14.03ms | 4.38ms |
| update_1to1 | 24.34ms | 6.01ms | 8.29ms | 10.07ms | 16.43ms | 10.24ms |
| update_2to1 | 12.05ms | 3.10ms | 4.44ms | 2.14ms | 8.04ms | 4.54ms |
| update_4to1 | 6.01ms | 1.53ms | 2.30ms | 2.54ms | 4.15ms | 2.53ms |
| update_1000to1 | 74μs | 15μs | 20μs | 19μs | 40μs | 25μs |
| update_1to2 | 11.60ms | 3.03ms | 4.08ms | 4.94ms | 8.36ms | 4.48ms |
| update_1to4 | 5.92ms | 1.55ms | 2.09ms | 2.41ms | 4.28ms | 2.55ms |
| update_1to1000 | 170μs | 418μs | 811μs | 35μs | 150μs | 42μs |
| cellx1000 | 71.81ms | 5.29ms | 9.78ms | 7.36ms | 12.06ms | 9.64ms |
| cellx2500 | 253.66ms | 23.06ms | 27.13ms | 19.32ms | 36.80ms | 32.64ms |
| cellx5000 | 553.70ms | 66.69ms | 77.91ms | 46.56ms | 92.33ms | 66.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.04s | 269.08ms | 520.67ms | 237.99ms | 355.48ms | 510.67ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.52s | 203.54ms | 293.78ms | 180.67ms | 256.55ms | 280.39ms |
| 1000x12 - 4 sources - dynamic (large) | 1.89s | 357.25ms | 3.73s | 288.73ms | 465.26ms | 3.76s |
| 1000x5 - 25 sources (wide dense) | 3.47s | 511.88ms | 2.73s | 410.38ms | 615.85ms | 3.43s |
| 5x500 - 3 sources (deep) | 1.13s | 208.49ms | 248.95ms | 196.31ms | 255.97ms | 222.17ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.69s | 264.55ms | 467.52ms | 264.96ms | 386.80ms | 481.01ms |

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
