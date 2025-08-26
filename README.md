# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.33s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.66s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 2.36s | 146.34ms (fail) | 201.66ms | 193.26ms | 261.20ms | 218.75ms |
| broadPropagation | 4.54s | 6.53ms (fail) | 454.88ms | 354.49ms | 489.56ms | 459.93ms |
| deepPropagation | 1.54s | 143.22ms (fail) | 178.66ms | 128.56ms | 163.19ms | 186.60ms |
| diamond | 2.39s | 184.82ms (fail) | 279.57ms | 235.81ms | 359.65ms | 300.59ms |
| mux | 1.86s | 192.94ms (fail) | 394.24ms | 379.07ms | 429.04ms | 413.97ms |
| repeatedObservers | 235.72ms | 52.41ms (fail) | 40.20ms | 43.61ms | 82.20ms | 44.08ms |
| triangle | 775.07ms | 81.72ms (fail) | 100.00ms | 85.40ms | 114.11ms | 106.14ms |
| unstable | 338.83ms | 348.15ms (fail) | 74.22ms | 61.79ms | 97.23ms | 75.76ms |
| molBench | 580.59ms | 940μs | 473.78ms | 489.45ms | 500.63ms | 486.52ms |
| create_signals | 72.81ms | 71.12ms | 5.33ms | 28.55ms | 75.71ms | 26.20ms |
| comp_0to1 | 25.45ms | 60.30ms | 23.52ms | 7.26ms | 35.67ms | 11.83ms |
| comp_1to1 | 28.98ms | 59.19ms | 12.30ms | 4.19ms | 51.95ms | 30.60ms |
| comp_2to1 | 11.80ms | 42.10ms | 20.95ms | 2.23ms | 11.82ms | 8.32ms |
| comp_4to1 | 18.34ms | 18.85ms | 14.09ms | 8.38ms | 9.45ms | 10.05ms |
| comp_1000to1 | 16μs | 45μs | 5μs | 5μs | 19μs | 5μs |
| comp_1to2 | 39.04ms | 51.87ms | 18.79ms | 13.74ms | 34.87ms | 20.15ms |
| comp_1to4 | 28.29ms | 47.00ms | 29.18ms | 9.13ms | 16.82ms | 7.11ms |
| comp_1to8 | 25.92ms | 45.82ms | 6.66ms | 5.37ms | 22.08ms | 6.54ms |
| comp_1to1000 | 15.87ms | 41.73ms | 6.99ms | 3.42ms | 14.26ms | 4.49ms |
| update_1to1 | 22.34ms | 6.20ms | 8.31ms | 10.08ms | 16.31ms | 11.23ms |
| update_2to1 | 11.78ms | 3.12ms | 4.43ms | 2.16ms | 8.02ms | 5.17ms |
| update_4to1 | 6.37ms | 1.56ms | 2.14ms | 2.47ms | 4.10ms | 2.80ms |
| update_1000to1 | 59μs | 15μs | 20μs | 23μs | 40μs | 40μs |
| update_1to2 | 11.66ms | 3.07ms | 4.08ms | 4.99ms | 8.18ms | 4.97ms |
| update_1to4 | 5.66ms | 1.55ms | 2.07ms | 2.42ms | 4.08ms | 2.80ms |
| update_1to1000 | 168μs | 421μs | 835μs | 46μs | 150μs | 44μs |
| cellx1000 | 79.29ms | 5.46ms | 10.07ms | 7.41ms | 12.45ms | 11.90ms |
| cellx2500 | 267.77ms | 27.18ms | 26.07ms | 19.54ms | 39.09ms | 35.41ms |
| cellx5000 | 567.19ms | 62.57ms | 67.58ms | 42.10ms | 96.91ms | 70.51ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.02s | 234.01ms | 446.69ms | 242.72ms | 346.68ms | 510.64ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.51s | 202.76ms | 273.50ms | 181.46ms | 252.63ms | 285.74ms |
| 1000x12 - 4 sources - dynamic (large) | 1.93s | 353.73ms | 3.73s | 281.38ms | 459.17ms | 3.77s |
| 1000x5 - 25 sources (wide dense) | 3.50s | 513.67ms | 2.73s | 404.82ms | 607.50ms | 3.53s |
| 5x500 - 3 sources (deep) | 1.14s | 209.47ms | 232.78ms | 191.42ms | 256.67ms | 223.19ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.70s | 262.27ms | 460.01ms | 266.82ms | 383.55ms | 486.26ms |

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
