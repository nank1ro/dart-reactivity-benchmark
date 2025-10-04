# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.47s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.54s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.61s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 212.13ms | 192.57ms | 148.08ms (fail) | 258.64ms | 202.05ms | 2.36s |
| broadPropagation | 486.01ms | 351.10ms | 6.40ms (fail) | 493.65ms | 462.13ms | 4.42s |
| deepPropagation | 173.99ms | 124.36ms | 140.78ms (fail) | 161.69ms | 179.38ms | 1.54s |
| diamond | 290.11ms | 236.34ms | 188.17ms (fail) | 344.58ms | 281.80ms | 2.41s |
| mux | 408.52ms | 379.80ms | 197.56ms (fail) | 426.45ms | 399.82ms | 1.84s |
| repeatedObservers | 46.84ms | 43.84ms | 52.75ms (fail) | 80.51ms | 40.99ms | 232.95ms |
| triangle | 102.09ms | 85.87ms | 80.88ms (fail) | 113.19ms | 130.12ms | 784.05ms |
| unstable | 76.34ms | 60.39ms | 374.76ms (fail) | 96.60ms | 74.63ms | 343.72ms |
| molBench | 488.12ms | 490.38ms | 1.03ms | 493.65ms | 489.33ms | 583.94ms |
| create_signals | 25.77ms | 22.68ms | 62.14ms | 67.00ms | 4.82ms | 51.98ms |
| comp_0to1 | 11.89ms | 9.21ms | 56.75ms | 26.07ms | 18.51ms | 15.88ms |
| comp_1to1 | 29.33ms | 4.23ms | 59.59ms | 43.66ms | 11.11ms | 40.80ms |
| comp_2to1 | 16.65ms | 2.32ms | 39.45ms | 26.71ms | 11.88ms | 23.99ms |
| comp_4to1 | 5.88ms | 8.72ms | 17.66ms | 18.70ms | 14.10ms | 17.45ms |
| comp_1000to1 | 5μs | 6μs | 46μs | 28μs | 5μs | 21μs |
| comp_1to2 | 13.50ms | 15.84ms | 49.00ms | 33.34ms | 18.37ms | 34.64ms |
| comp_1to4 | 12.02ms | 6.78ms | 47.43ms | 23.60ms | 32.30ms | 20.82ms |
| comp_1to8 | 6.84ms | 4.52ms | 46.77ms | 31.49ms | 7.75ms | 24.04ms |
| comp_1to1000 | 4.39ms | 3.47ms | 42.31ms | 14.22ms | 7.28ms | 15.55ms |
| update_1to1 | 10.25ms | 8.08ms | 6.04ms | 17.54ms | 8.34ms | 28.47ms |
| update_2to1 | 4.62ms | 2.79ms | 3.16ms | 8.05ms | 4.43ms | 14.15ms |
| update_4to1 | 2.54ms | 2.63ms | 1.56ms | 4.11ms | 2.12ms | 7.10ms |
| update_1000to1 | 26μs | 13μs | 15μs | 40μs | 20μs | 69μs |
| update_1to2 | 4.65ms | 3.69ms | 3.09ms | 8.16ms | 4.07ms | 13.97ms |
| update_1to4 | 2.54ms | 2.40ms | 1.55ms | 4.08ms | 2.09ms | 7.03ms |
| update_1to1000 | 43μs | 49μs | 447μs | 149μs | 918μs | 173μs |
| cellx1000 | 9.98ms | 7.25ms | 5.23ms | 12.06ms | 9.99ms | 72.44ms |
| cellx2500 | 33.16ms | 19.16ms | 28.89ms | 35.27ms | 27.74ms | 254.93ms |
| cellx5000 | 76.64ms | 43.87ms | 71.05ms | 90.66ms | 83.96ms | 597.10ms |
| 10x5 - 2 sources - read 20.0% (simple) | 505.31ms | 240.14ms | 232.81ms | 358.30ms | 509.20ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.99ms | 184.11ms | 196.65ms | 249.81ms | 292.57ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.92s | 285.71ms | 345.17ms | 465.98ms | 3.75s | 1.92s |
| 1000x5 - 25 sources (wide dense) | 3.51s | 409.34ms | 505.15ms | 606.67ms | 2.74s | 3.49s |
| 5x500 - 3 sources (deep) | 223.53ms | 197.72ms | 205.83ms | 256.29ms | 249.00ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.72ms | 266.48ms | 259.22ms | 375.53ms | 465.41ms | 1.73s |

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
