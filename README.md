# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.29s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.35s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.24s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.18s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.55s |

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
| avoidablePropagation | 2.46s | 157.72ms (fail) | 202.34ms | 194.90ms | 259.83ms | 212.98ms |
| broadPropagation | 4.50s | 6.52ms (fail) | 458.76ms | 356.82ms | 502.56ms | 461.39ms |
| deepPropagation | 1.57s | 139.35ms (fail) | 176.52ms | 126.78ms | 163.38ms | 178.76ms |
| diamond | 2.48s | 198.54ms (fail) | 290.02ms | 237.68ms | 356.57ms | 283.58ms |
| mux | 1.88s | 198.37ms (fail) | 388.79ms | 381.05ms | 435.77ms | 411.83ms |
| repeatedObservers | 239.78ms | 52.50ms (fail) | 40.10ms | 43.85ms | 80.44ms | 46.99ms |
| triangle | 794.77ms | 79.26ms (fail) | 99.77ms | 85.47ms | 116.67ms | 105.63ms |
| unstable | 346.63ms | 343.60ms (fail) | 74.48ms | 61.47ms | 95.61ms | 75.81ms |
| molBench | 585.28ms | 960μs | 483.44ms | 489.44ms | 492.75ms | 485.52ms |
| create_signals | 71.56ms | 68.22ms | 5.33ms | 26.34ms | 77.13ms | 26.09ms |
| comp_0to1 | 25.10ms | 63.04ms | 17.36ms | 7.62ms | 29.86ms | 11.80ms |
| comp_1to1 | 17.34ms | 64.70ms | 14.89ms | 4.21ms | 44.89ms | 26.28ms |
| comp_2to1 | 20.11ms | 39.59ms | 16.30ms | 2.28ms | 46.32ms | 15.59ms |
| comp_4to1 | 28.31ms | 17.07ms | 12.35ms | 8.38ms | 4.42ms | 7.09ms |
| comp_1000to1 | 15μs | 50μs | 4μs | 4μs | 15μs | 7μs |
| comp_1to2 | 38.78ms | 52.90ms | 26.77ms | 17.49ms | 30.97ms | 20.44ms |
| comp_1to4 | 25.08ms | 51.52ms | 20.11ms | 9.08ms | 19.33ms | 7.30ms |
| comp_1to8 | 21.40ms | 50.72ms | 10.85ms | 4.68ms | 22.69ms | 6.45ms |
| comp_1to1000 | 15.31ms | 46.59ms | 4.78ms | 3.52ms | 14.36ms | 4.37ms |
| update_1to1 | 25.80ms | 6.04ms | 8.32ms | 10.02ms | 16.36ms | 10.22ms |
| update_2to1 | 14.04ms | 3.11ms | 4.38ms | 2.12ms | 8.06ms | 4.56ms |
| update_4to1 | 7.13ms | 1.54ms | 2.09ms | 2.54ms | 4.09ms | 2.55ms |
| update_1000to1 | 70μs | 15μs | 20μs | 15μs | 40μs | 26μs |
| update_1to2 | 12.40ms | 3.03ms | 4.07ms | 4.98ms | 8.62ms | 4.64ms |
| update_1to4 | 6.93ms | 1.52ms | 2.10ms | 2.32ms | 4.11ms | 2.54ms |
| update_1to1000 | 175μs | 433μs | 58μs | 33μs | 150μs | 44μs |
| cellx1000 | 71.39ms | 5.17ms | 12.02ms | 7.19ms | 12.23ms | 9.77ms |
| cellx2500 | 257.40ms | 23.68ms | 25.93ms | 19.10ms | 33.38ms | 31.98ms |
| cellx5000 | 548.17ms | 66.72ms | 68.89ms | 42.88ms | 75.51ms | 67.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.13s | 268.29ms | 442.44ms | 241.68ms | 348.85ms | 507.59ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.55s | 207.93ms | 275.71ms | 182.31ms | 252.38ms | 279.62ms |
| 1000x12 - 4 sources - dynamic (large) | 2.02s | 346.92ms | 3.71s | 285.17ms | 465.81ms | 3.78s |
| 1000x5 - 25 sources (wide dense) | 3.52s | 513.60ms | 2.75s | 411.56ms | 610.34ms | 3.45s |
| 5x500 - 3 sources (deep) | 1.14s | 209.09ms | 234.00ms | 192.16ms | 264.92ms | 226.67ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.76s | 264.10ms | 462.06ms | 265.66ms | 389.17ms | 474.42ms |

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
