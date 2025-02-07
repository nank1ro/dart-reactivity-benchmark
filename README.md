# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.75s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.71s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.52s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.86s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.98s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.22s | 2.36s | 160.24ms (fail) | 210.92ms | 190.27ms | 209.81ms |
| broadPropagation | 5.56s | 4.46s | 6.00ms (fail) | 460.32ms | 352.72ms | 460.13ms |
| deepPropagation | 2.03s | 1.57s | 141.67ms (fail) | 174.35ms | 126.68ms | 172.90ms |
| diamond | 3.50s | 2.44s | 195.32ms (fail) | 282.41ms | 237.45ms | 274.67ms |
| mux | 2.09s | 1.85s | 194.69ms (fail) | 408.58ms | 383.33ms | 386.82ms |
| repeatedObservers | 209.46ms | 240.00ms | 54.30ms (fail) | 44.84ms | 44.61ms | 41.14ms |
| triangle | 1.15s | 782.58ms | 78.88ms (fail) | 102.85ms | 86.13ms | 105.11ms |
| unstable | 344.04ms | 353.44ms | 337.34ms (fail) | 78.19ms | 60.86ms | 70.58ms |
| molBench | 1.75s | 588.76ms | 925μs | 486.48ms | 481.30ms | 483.87ms |
| create_signals | 74.90ms | 68.93ms | 64.67ms | 32.54ms | 21.69ms | 4.73ms |
| comp_0to1 | 34.83ms | 20.93ms | 50.53ms | 14.22ms | 5.22ms | 17.79ms |
| comp_1to1 | 42.12ms | 31.80ms | 53.79ms | 33.27ms | 8.99ms | 15.35ms |
| comp_2to1 | 21.03ms | 23.32ms | 34.43ms | 9.35ms | 6.92ms | 22.32ms |
| comp_4to1 | 14.16ms | 13.39ms | 17.67ms | 2.24ms | 10.71ms | 11.07ms |
| comp_1000to1 | 3.78ms | 17μs | 84μs | 5μs | 4μs | 5μs |
| comp_1to2 | 28.00ms | 34.67ms | 49.17ms | 14.23ms | 16.85ms | 28.22ms |
| comp_1to4 | 29.27ms | 17.86ms | 44.11ms | 13.77ms | 8.73ms | 29.87ms |
| comp_1to8 | 25.65ms | 19.76ms | 44.18ms | 7.25ms | 9.17ms | 7.04ms |
| comp_1to1000 | 19.72ms | 15.65ms | 40.19ms | 5.57ms | 6.34ms | 5.69ms |
| update_1to1 | 43.58ms | 25.93ms | 10.53ms | 9.35ms | 4.45ms | 8.75ms |
| update_2to1 | 21.56ms | 11.76ms | 2.96ms | 4.75ms | 3.35ms | 4.37ms |
| update_4to1 | 10.82ms | 7.04ms | 2.28ms | 2.33ms | 1.09ms | 2.25ms |
| update_1000to1 | 120μs | 60μs | 14μs | 23μs | 10μs | 21μs |
| update_1to2 | 21.56ms | 12.52ms | 3.86ms | 4.73ms | 2.20ms | 4.35ms |
| update_1to4 | 11.12ms | 6.17ms | 1.50ms | 2.33ms | 1.09ms | 2.21ms |
| update_1to1000 | 210μs | 158μs | 404μs | 46μs | 31μs | 880μs |
| cellx1000 | 197.52ms | 70.94ms | 5.60ms | 10.62ms | 7.83ms | 9.56ms |
| cellx2500 | 583.19ms | 257.76ms | 21.33ms | 39.86ms | 22.60ms | 26.96ms |
| cellx5000 | 1.20s | 603.02ms | 64.33ms | 112.53ms | 62.41ms | 69.25ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 2.03s | 245.16ms | 503.54ms | 235.77ms | 423.29ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.37s (partial) | 1.55s | 204.56ms | 295.85ms | 184.27ms | 270.37ms |
| 1000x12 - 4 sources - dynamic (large) | 4.09s (partial) | 1.93s | 338.77ms | 3.91s | 284.85ms | 3.34s |
| 1000x5 - 25 sources (wide dense) | 4.89s (partial) | 3.59s | 505.66ms | 3.53s | 409.25ms | 2.51s |
| 5x500 - 3 sources (deep) | 1.98s (partial) | 1.15s | 233.68ms | 228.55ms | 203.19ms | 230.18ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.78s (partial) | 1.72s | 264.96ms | 489.42ms | 265.82ms | 452.38ms |

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
