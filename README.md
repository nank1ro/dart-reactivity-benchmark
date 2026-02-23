# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.31s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 8.66s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.81s |
| 4 | signals | 0.28 | 100.0% | 35/35 | 9.17s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 25.95s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.06s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 198.30ms | 170.53ms | 133.74ms (fail) | 241.40ms | 184.74ms | 2.30s |
| broadPropagation | 385.07ms | 301.59ms | 5.83ms (fail) | 462.12ms | 382.52ms | 4.04s |
| deepPropagation | 177.22ms | 107.77ms | 153.16ms (fail) | 151.73ms | 180.92ms | 1.42s |
| diamond | 259.84ms | 232.38ms | 176.40ms (fail) | 343.50ms | 252.29ms | 2.26s |
| mux | 327.80ms | 329.16ms | 157.48ms (fail) | 390.31ms | 324.26ms | 1.72s |
| repeatedObservers | 39.51ms | 39.27ms | 45.33ms (fail) | 72.44ms | 33.64ms | 222.01ms |
| triangle | 92.97ms | 79.79ms | 75.65ms (fail) | 111.36ms | 90.77ms | 739.10ms |
| unstable | 66.60ms | 59.70ms | 322.47ms (fail) | 96.19ms | 58.44ms | 318.42ms |
| molBench | 365.22ms | 362.88ms | 856μs | 370.49ms | 388.08ms | 450.53ms |
| create_signals | 26.02ms | 31.73ms | 72.41ms | 72.76ms | 6.72ms | 61.35ms |
| comp_0to1 | 10.84ms | 8.40ms | 54.25ms | 32.56ms | 22.59ms | 23.40ms |
| comp_1to1 | 28.25ms | 5.73ms | 55.28ms | 49.27ms | 17.05ms | 17.31ms |
| comp_2to1 | 16.08ms | 2.88ms | 35.55ms | 23.37ms | 19.50ms | 18.55ms |
| comp_4to1 | 9.24ms | 11.67ms | 16.49ms | 8.75ms | 14.84ms | 15.15ms |
| comp_1000to1 | 5μs | 5μs | 42μs | 36μs | 9μs | 29μs |
| comp_1to2 | 15.20ms | 10.49ms | 46.88ms | 34.62ms | 17.33ms | 40.93ms |
| comp_1to4 | 15.95ms | 13.16ms | 46.69ms | 16.67ms | 24.11ms | 31.21ms |
| comp_1to8 | 8.35ms | 4.82ms | 44.83ms | 20.41ms | 8.26ms | 25.13ms |
| comp_1to1000 | 5.00ms | 4.43ms | 40.44ms | 13.83ms | 5.42ms | 15.84ms |
| update_1to1 | 8.66ms | 3.88ms | 4.55ms | 14.36ms | 7.51ms | 19.82ms |
| update_2to1 | 4.55ms | 2.03ms | 2.36ms | 7.12ms | 3.51ms | 9.85ms |
| update_4to1 | 2.08ms | 1.05ms | 1.17ms | 3.60ms | 2.03ms | 5.52ms |
| update_1000to1 | 21μs | 11μs | 12μs | 37μs | 19μs | 49μs |
| update_1to2 | 4.24ms | 2.05ms | 2.34ms | 7.16ms | 3.74ms | 9.86ms |
| update_1to4 | 2.06ms | 1.03ms | 1.22ms | 3.63ms | 1.96ms | 4.99ms |
| update_1to1000 | 59μs | 44μs | 389μs | 143μs | 178μs | 168μs |
| cellx1000 | 9.84ms | 8.35ms | 8.35ms | 15.60ms | 9.98ms | 77.90ms |
| cellx2500 | 31.81ms | 25.41ms | 28.04ms | 44.44ms | 24.98ms | 246.53ms |
| cellx5000 | 70.03ms | 61.81ms | 66.99ms | 99.94ms | 68.17ms | 539.90ms |
| 10x5 - 2 sources - read 20.0% (simple) | 424.72ms | 228.48ms | 227.03ms | 360.75ms | 397.10ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 238.44ms | 171.19ms | 172.95ms | 250.50ms | 239.30ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.14s | 247.62ms | 267.78ms | 365.26ms | 3.02s | 1.70s |
| 1000x5 - 25 sources (wide dense) | 2.58s | 352.43ms | 379.28ms | 537.09ms | 2.25s | 3.35s |
| 5x500 - 3 sources (deep) | 211.44ms | 203.02ms | 199.86ms | 283.72ms | 220.96ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 392.81ms | 224.13ms | 217.68ms | 306.17ms | 386.92ms | 1.66s |

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
