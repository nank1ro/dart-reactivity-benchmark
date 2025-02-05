# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.77 | 100.0% | 35/35 | 3.66s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 10.98s |
| 🥉 | preact_signals | 0.23 | 100.0% | 35/35 | 9.91s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.32s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.76s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.18s | 2.33s | 166.23ms (fail) | 206.49ms | 191.33ms | 212.67ms |
| broadPropagation | 5.54s | 4.32s | 6.76ms (fail) | 463.55ms | 346.45ms | 467.60ms |
| deepPropagation | 2.08s | 1.57s | 144.48ms (fail) | 173.44ms | 122.54ms | 174.60ms |
| diamond | 3.56s | 2.46s | 201.31ms (fail) | 285.38ms | 238.76ms | 275.87ms |
| mux | 2.17s | 1.84s | 193.42ms (fail) | 413.37ms | 379.73ms | 400.76ms |
| repeatedObservers | 216.73ms | 237.93ms | 54.34ms (fail) | 45.65ms | 43.80ms | 41.44ms |
| triangle | 1.16s | 778.91ms | 79.83ms (fail) | 100.96ms | 83.33ms | 98.78ms |
| unstable | 348.51ms | 351.66ms | 342.87ms (fail) | 77.36ms | 59.77ms | 71.08ms |
| molBench | 1.75s | 589.47ms | 921μs | 485.89ms | 486.97ms | 484.23ms |
| create_signals | 77.64ms | 71.49ms | 72.96ms | 29.52ms | 20.94ms | 4.71ms |
| comp_0to1 | 36.00ms | 18.77ms | 51.84ms | 14.72ms | 5.03ms | 17.65ms |
| comp_1to1 | 53.56ms | 29.15ms | 51.86ms | 23.58ms | 11.54ms | 17.73ms |
| comp_2to1 | 25.89ms | 17.34ms | 37.19ms | 8.91ms | 13.89ms | 25.14ms |
| comp_4to1 | 13.20ms | 27.76ms | 16.95ms | 3.56ms | 1.85ms | 12.94ms |
| comp_1000to1 | 2.34ms | 15μs | 103μs | 5μs | 3μs | 9μs |
| comp_1to2 | 32.70ms | 39.97ms | 47.05ms | 16.93ms | 10.01ms | 25.17ms |
| comp_1to4 | 31.21ms | 24.51ms | 43.37ms | 10.28ms | 7.24ms | 32.73ms |
| comp_1to8 | 25.23ms | 21.03ms | 43.30ms | 6.71ms | 3.75ms | 7.67ms |
| comp_1to1000 | 19.34ms | 15.17ms | 39.98ms | 4.74ms | 3.38ms | 6.26ms |
| update_1to1 | 45.95ms | 23.22ms | 5.83ms | 9.38ms | 4.40ms | 8.80ms |
| update_2to1 | 21.45ms | 12.60ms | 2.82ms | 4.73ms | 2.93ms | 4.37ms |
| update_4to1 | 10.74ms | 5.79ms | 1.52ms | 2.35ms | 1.14ms | 2.18ms |
| update_1000to1 | 116μs | 69μs | 15μs | 36μs | 11μs | 21μs |
| update_1to2 | 21.93ms | 14.07ms | 2.96ms | 4.72ms | 2.20ms | 4.35ms |
| update_1to4 | 10.90ms | 7.00ms | 1.45ms | 2.41ms | 1.13ms | 2.34ms |
| update_1to1000 | 218μs | 164μs | 408μs | 45μs | 39μs | 1.11ms |
| cellx1000 | 186.34ms | 70.79ms | 5.37ms | 9.83ms | 7.50ms | 11.52ms |
| cellx2500 | 558.68ms | 248.46ms | 19.37ms | 34.24ms | 21.22ms | 61.10ms |
| cellx5000 | 1.24s | 545.55ms | 61.81ms | 68.83ms | 49.32ms | 156.98ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.64s (partial) | 2.00s | 265.55ms | 511.02ms | 226.40ms | 435.79ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.36s (partial) | 1.52s | 209.75ms | 277.92ms | 173.21ms | 270.31ms |
| 1000x12 - 4 sources - dynamic (large) | 4.15s (partial) | 1.82s | 335.93ms | 3.46s | 282.54ms | 3.38s |
| 1000x5 - 25 sources (wide dense) | 4.96s (partial) | 3.49s | 526.23ms | 3.52s | 398.82ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.40s (partial) | 1.13s | 233.26ms | 228.23ms | 195.61ms | 230.80ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.82s (partial) | 1.70s | 263.42ms | 479.09ms | 263.62ms | 446.39ms |

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
