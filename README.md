# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.96s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.38s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.06s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.50s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 276.14ms | 205.71ms | 2.34s | 186.77ms | 211.13ms | 158.72ms (fail) |
| broadPropagation | 512.34ms | 451.12ms | 4.26s | 360.57ms | 448.61ms | 6.34ms (fail) |
| deepPropagation | 177.60ms | 177.72ms | 1.52s | 128.28ms | 168.86ms | 141.00ms (fail) |
| diamond | 369.02ms | 290.83ms | 2.38s | 236.04ms | 288.83ms | 199.85ms (fail) |
| mux | 442.72ms | 384.57ms | 1.84s | 373.92ms | 406.73ms | 190.16ms (fail) |
| repeatedObservers | 80.23ms | 38.40ms | 227.35ms | 45.01ms | 46.68ms | 53.45ms (fail) |
| triangle | 118.38ms | 99.67ms | 759.15ms | 84.77ms | 106.76ms | 80.30ms (fail) |
| unstable | 95.14ms | 70.55ms | 347.46ms | 61.30ms | 79.84ms | 337.34ms (fail) |
| molBench | 442.43ms | 492.28ms | 587.78ms | 493.21ms | 489.69ms | 951μs |
| create_signals | 80.12ms | 4.98ms | 89.40ms | 27.37ms | 26.63ms | 63.77ms |
| comp_0to1 | 30.96ms | 24.30ms | 20.44ms | 9.20ms | 12.44ms | 55.22ms |
| comp_1to1 | 50.86ms | 12.63ms | 43.24ms | 4.81ms | 34.62ms | 59.84ms |
| comp_2to1 | 41.05ms | 17.94ms | 37.32ms | 2.52ms | 10.66ms | 37.64ms |
| comp_4to1 | 14.32ms | 13.34ms | 19.35ms | 7.96ms | 2.94ms | 16.98ms |
| comp_1000to1 | 15μs | 5μs | 22μs | 4μs | 8μs | 42μs |
| comp_1to2 | 29.92ms | 13.36ms | 37.48ms | 12.76ms | 20.49ms | 44.53ms |
| comp_1to4 | 34.93ms | 24.78ms | 25.66ms | 12.15ms | 16.03ms | 43.98ms |
| comp_1to8 | 23.83ms | 5.88ms | 24.53ms | 5.44ms | 6.96ms | 42.23ms |
| comp_1to1000 | 15.43ms | 4.38ms | 16.02ms | 3.38ms | 4.55ms | 37.60ms |
| update_1to1 | 16.15ms | 11.60ms | 25.56ms | 11.30ms | 9.32ms | 5.76ms |
| update_2to1 | 7.94ms | 4.08ms | 11.63ms | 3.16ms | 4.58ms | 2.88ms |
| update_4to1 | 4.12ms | 2.07ms | 6.23ms | 2.79ms | 2.30ms | 1.46ms |
| update_1000to1 | 40μs | 20μs | 69μs | 26μs | 23μs | 15μs |
| update_1to2 | 8.12ms | 4.06ms | 12.35ms | 4.30ms | 4.92ms | 2.96ms |
| update_1to4 | 4.13ms | 2.04ms | 5.94ms | 1.59ms | 2.33ms | 1.46ms |
| update_1to1000 | 151μs | 40μs | 172μs | 45μs | 44μs | 376μs |
| cellx1000 | 14.37ms | 9.91ms | 77.09ms | 8.88ms | 9.48ms | 5.33ms |
| cellx2500 | 44.43ms | 35.76ms | 271.06ms | 19.63ms | 31.46ms | 29.70ms |
| cellx5000 | 119.79ms | 85.32ms | 601.86ms | 47.93ms | 65.71ms | 61.01ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.41ms | 439.73ms | 2.01s | 229.55ms | 523.04ms | 266.98ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 246.27ms | 281.27ms | 1.54s | 176.65ms | 284.02ms | 206.22ms |
| 1000x12 - 4 sources - dynamic (large) | 480.65ms | 3.50s | 1.96s | 283.46ms | 3.76s | 343.82ms |
| 1000x5 - 25 sources (wide dense) | 594.62ms | 2.58s | 3.53s | 413.88ms | 3.26s | 505.50ms |
| 5x500 - 3 sources (deep) | 262.20ms | 228.82ms | 1.15s | 188.19ms | 230.18ms | 207.07ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.60ms | 445.33ms | 1.73s | 265.77ms | 485.12ms | 257.26ms |

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
