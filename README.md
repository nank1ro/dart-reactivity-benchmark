# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.77 | 100.0% | 35/35 | 2.92s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 4.23s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 7.95s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 8.64s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 20.83s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 2.61s |

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
| avoidablePropagation | 1.76s | 167.24ms | 143.20ms | 170.16ms | 208.53ms | 117.78ms (fail) |
| broadPropagation | 3.25s | 379.61ms | 275.27ms | 414.75ms | 379.51ms | 5.11ms (fail) |
| deepPropagation | 1.16s | 139.30ms | 94.28ms | 160.01ms | 126.86ms | 119.34ms (fail) |
| diamond | 1.73s | 219.33ms | 205.16ms | 223.55ms | 283.25ms | 148.28ms (fail) |
| mux | 1.34s | 302.79ms | 283.41ms | 298.16ms | 335.64ms | 145.03ms (fail) |
| repeatedObservers | 181.27ms | 36.01ms | 34.38ms | 32.78ms | 68.86ms | 42.64ms (fail) |
| triangle | 566.28ms | 82.53ms | 69.81ms | 88.54ms | 97.50ms | 62.54ms (fail) |
| unstable | 266.97ms | 60.28ms | 47.53ms | 56.89ms | 82.88ms | 267.15ms (fail) |
| molBench | 497.15ms | 424.54ms | 434.94ms | 424.45ms | 441.09ms | 795μs |
| create_signals | 62.29ms | 24.34ms | 20.84ms | 16.19ms | 85.77ms | 54.17ms |
| comp_0to1 | 11.34ms | 10.55ms | 6.98ms | 13.81ms | 27.98ms | 46.91ms |
| comp_1to1 | 33.27ms | 18.28ms | 3.21ms | 5.99ms | 37.37ms | 42.84ms |
| comp_2to1 | 20.38ms | 9.59ms | 1.77ms | 10.41ms | 41.26ms | 29.49ms |
| comp_4to1 | 28.52ms | 7.04ms | 7.57ms | 6.86ms | 7.23ms | 13.23ms |
| comp_1000to1 | 18μs | 4μs | 3μs | 4μs | 13μs | 31μs |
| comp_1to2 | 22.67ms | 15.08ms | 12.20ms | 20.02ms | 25.80ms | 34.13ms |
| comp_1to4 | 13.17ms | 18.07ms | 7.75ms | 20.32ms | 11.97ms | 33.66ms |
| comp_1to8 | 15.23ms | 8.45ms | 4.05ms | 6.63ms | 15.54ms | 31.58ms |
| comp_1to1000 | 11.28ms | 4.28ms | 2.55ms | 4.89ms | 11.25ms | 28.30ms |
| update_1to1 | 18.15ms | 7.31ms | 3.67ms | 7.38ms | 13.00ms | 4.63ms |
| update_2to1 | 8.87ms | 3.64ms | 1.85ms | 3.79ms | 6.50ms | 2.36ms |
| update_4to1 | 4.53ms | 1.84ms | 963μs | 1.85ms | 3.24ms | 1.19ms |
| update_1000to1 | 44μs | 18μs | 15μs | 18μs | 33μs | 12μs |
| update_1to2 | 8.79ms | 3.63ms | 1.86ms | 3.77ms | 6.64ms | 2.33ms |
| update_1to4 | 4.43ms | 1.92ms | 910μs | 2.33ms | 3.25ms | 1.19ms |
| update_1to1000 | 120μs | 57μs | 20μs | 419μs | 125μs | 273μs |
| cellx1000 | 59.82ms | 7.77ms | 5.27ms | 7.88ms | 9.16ms | 3.99ms |
| cellx2500 | 230.44ms | 21.03ms | 16.80ms | 23.41ms | 25.87ms | 23.49ms |
| cellx5000 | 517.58ms | 60.61ms | 36.30ms | 63.57ms | 66.70ms | 53.64ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.54s | 387.29ms | 188.00ms | 331.30ms | 293.35ms | 192.01ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.10s | 212.71ms | 150.67ms | 202.74ms | 212.34ms | 156.96ms |
| 1000x12 - 4 sources - dynamic (large) | 1.43s | 2.69s | 208.53ms | 2.69s | 332.07ms | 233.88ms |
| 1000x5 - 25 sources (wide dense) | 2.69s | 2.78s | 322.58ms | 2.12s | 496.71ms | 361.64ms |
| 5x500 - 3 sources (deep) | 904.55ms | 177.84ms | 148.50ms | 182.90ms | 204.87ms | 168.50ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.34s | 361.00ms | 183.38ms | 339.49ms | 263.88ms | 184.46ms |

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
