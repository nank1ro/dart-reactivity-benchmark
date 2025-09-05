# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.23s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.42s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.43s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.59s |
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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.76ms | 163.27ms (fail) | 259.73ms | 211.35ms | 201.33ms | 2.34s |
| broadPropagation | 465.68ms | 6.43ms (fail) | 489.14ms | 457.04ms | 362.14ms | 4.45s |
| deepPropagation | 178.02ms | 139.90ms (fail) | 161.72ms | 175.76ms | 129.43ms | 1.57s |
| diamond | 282.08ms | 201.23ms (fail) | 349.89ms | 289.50ms | 233.41ms | 2.42s |
| mux | 391.31ms | 196.48ms (fail) | 421.32ms | 410.21ms | 388.29ms | 1.84s |
| repeatedObservers | 40.72ms | 52.47ms (fail) | 80.45ms | 46.33ms | 43.85ms | 239.50ms |
| triangle | 101.04ms | 83.77ms (fail) | 112.59ms | 99.86ms | 85.25ms | 772.56ms |
| unstable | 75.09ms | 340.19ms (fail) | 95.62ms | 76.42ms | 60.40ms | 345.54ms |
| molBench | 488.34ms | 984μs | 496.73ms | 485.45ms | 489.40ms | 584.45ms |
| create_signals | 16.75ms | 63.38ms | 75.11ms | 25.01ms | 30.93ms | 68.49ms |
| comp_0to1 | 19.53ms | 57.17ms | 25.34ms | 10.62ms | 10.36ms | 27.73ms |
| comp_1to1 | 6.95ms | 58.04ms | 45.56ms | 28.59ms | 8.84ms | 42.00ms |
| comp_2to1 | 11.57ms | 38.95ms | 23.76ms | 9.00ms | 4.28ms | 22.87ms |
| comp_4to1 | 11.69ms | 17.08ms | 14.50ms | 1.95ms | 19.59ms | 15.98ms |
| comp_1000to1 | 5μs | 44μs | 18μs | 5μs | 3μs | 17μs |
| comp_1to2 | 28.62ms | 50.38ms | 39.52ms | 20.14ms | 12.25ms | 34.50ms |
| comp_1to4 | 25.50ms | 47.19ms | 20.45ms | 10.48ms | 7.04ms | 22.80ms |
| comp_1to8 | 5.42ms | 46.87ms | 19.46ms | 6.25ms | 6.46ms | 24.93ms |
| comp_1to1000 | 6.54ms | 42.73ms | 14.32ms | 4.33ms | 3.45ms | 16.37ms |
| update_1to1 | 8.38ms | 6.00ms | 16.43ms | 10.21ms | 10.03ms | 24.94ms |
| update_2to1 | 7.26ms | 3.17ms | 8.10ms | 4.60ms | 2.37ms | 12.06ms |
| update_4to1 | 2.21ms | 1.54ms | 4.09ms | 2.53ms | 2.52ms | 6.27ms |
| update_1000to1 | 20μs | 15μs | 40μs | 26μs | 21μs | 58μs |
| update_1to2 | 4.11ms | 3.02ms | 8.34ms | 4.56ms | 4.98ms | 12.20ms |
| update_1to4 | 2.07ms | 1.55ms | 4.09ms | 2.54ms | 2.44ms | 6.11ms |
| update_1to1000 | 773μs | 428μs | 149μs | 43μs | 49μs | 173μs |
| cellx1000 | 9.83ms | 5.83ms | 11.99ms | 9.63ms | 8.74ms | 72.56ms |
| cellx2500 | 26.31ms | 31.64ms | 33.12ms | 32.88ms | 19.33ms | 261.25ms |
| cellx5000 | 69.94ms | 72.92ms | 79.36ms | 63.58ms | 41.44ms | 552.92ms |
| 10x5 - 2 sources - read 20.0% (simple) | 443.17ms | 245.73ms | 352.03ms | 512.27ms | 240.15ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 299.37ms | 197.47ms | 247.91ms | 280.38ms | 182.21ms | 1.56s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 341.23ms | 464.69ms | 3.99s | 285.20ms | 1.92s |
| 1000x5 - 25 sources (wide dense) | 2.74s | 510.48ms | 613.76ms | 3.44s | 403.29ms | 3.44s |
| 5x500 - 3 sources (deep) | 236.09ms | 204.93ms | 252.86ms | 221.55ms | 192.67ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 463.81ms | 262.86ms | 387.09ms | 481.78ms | 262.97ms | 1.72s |

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
