# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.22s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.07s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.00s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.35s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 209.13ms | 187.40ms | 144.81ms (fail) | 278.40ms | 207.58ms | 2.36s |
| broadPropagation | 448.62ms | 350.62ms | 5.97ms (fail) | 495.15ms | 451.14ms | 4.51s |
| deepPropagation | 172.63ms | 122.20ms | 139.58ms (fail) | 170.31ms | 177.01ms | 1.50s |
| diamond | 284.67ms | 229.05ms | 193.12ms (fail) | 353.12ms | 280.35ms | 2.38s |
| mux | 392.22ms | 358.52ms | 181.08ms (fail) | 413.18ms | 372.31ms | 1.87s |
| repeatedObservers | 46.24ms | 45.11ms | 52.93ms (fail) | 80.48ms | 40.39ms | 222.66ms |
| triangle | 102.46ms | 84.26ms | 77.40ms (fail) | 118.17ms | 101.22ms | 749.37ms |
| unstable | 78.11ms | 64.07ms | 338.52ms (fail) | 97.38ms | 70.22ms | 341.31ms |
| molBench | 495.46ms | 485.20ms | 1.03ms | 491.67ms | 486.24ms | 588.97ms |
| create_signals | 26.61ms | 26.79ms | 67.56ms | 83.69ms | 5.36ms | 70.44ms |
| comp_0to1 | 11.77ms | 7.94ms | 59.05ms | 44.90ms | 17.95ms | 28.10ms |
| comp_1to1 | 17.58ms | 4.18ms | 54.87ms | 38.72ms | 14.12ms | 40.00ms |
| comp_2to1 | 8.88ms | 2.29ms | 41.55ms | 36.66ms | 17.95ms | 35.88ms |
| comp_4to1 | 1.81ms | 10.13ms | 16.27ms | 10.81ms | 8.34ms | 26.83ms |
| comp_1000to1 | 5μs | 5μs | 40μs | 16μs | 4μs | 15μs |
| comp_1to2 | 15.96ms | 19.57ms | 45.40ms | 27.74ms | 24.40ms | 37.98ms |
| comp_1to4 | 11.91ms | 6.43ms | 42.53ms | 20.97ms | 21.27ms | 23.70ms |
| comp_1to8 | 6.19ms | 7.09ms | 41.50ms | 19.95ms | 8.78ms | 23.03ms |
| comp_1to1000 | 4.24ms | 3.35ms | 37.82ms | 14.31ms | 7.66ms | 15.09ms |
| update_1to1 | 9.27ms | 4.61ms | 6.10ms | 15.46ms | 8.87ms | 26.16ms |
| update_2to1 | 4.71ms | 2.31ms | 3.07ms | 7.77ms | 4.43ms | 12.86ms |
| update_4to1 | 2.40ms | 1.15ms | 1.53ms | 3.88ms | 2.22ms | 7.35ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 68μs |
| update_1to2 | 4.63ms | 2.26ms | 3.07ms | 7.90ms | 4.40ms | 13.82ms |
| update_1to4 | 2.48ms | 1.15ms | 1.56ms | 3.87ms | 2.22ms | 6.98ms |
| update_1to1000 | 42μs | 29μs | 363μs | 147μs | 2.32ms | 175μs |
| cellx1000 | 9.74ms | 7.30ms | 5.64ms | 13.24ms | 9.57ms | 70.72ms |
| cellx2500 | 33.93ms | 19.19ms | 23.96ms | 31.15ms | 25.30ms | 255.12ms |
| cellx5000 | 72.08ms | 42.27ms | 82.15ms | 67.67ms | 64.31ms | 578.74ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.90ms | 233.64ms | 237.65ms | 347.01ms | 453.22ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.90ms | 174.03ms | 211.78ms | 243.75ms | 273.86ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.57s | 278.31ms | 350.54ms | 462.86ms | 3.66s | 1.95s |
| 1000x5 - 25 sources (wide dense) | 3.54s | 412.94ms | 515.30ms | 589.49ms | 2.51s | 3.43s |
| 5x500 - 3 sources (deep) | 228.28ms | 196.02ms | 209.76ms | 255.50ms | 229.99ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.33ms | 263.66ms | 266.07ms | 379.33ms | 439.67ms | 1.67s |

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
