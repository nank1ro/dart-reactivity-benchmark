# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.65s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.32s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.30s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.63s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.97s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 153.26ms (fail) | 2.33s | 276.39ms | 202.62ms | 206.90ms | 182.17ms |
| broadPropagation | 6.51ms (fail) | 4.53s | 502.23ms | 453.80ms | 461.41ms | 344.91ms |
| deepPropagation | 143.15ms (fail) | 1.57s | 170.15ms | 173.89ms | 177.27ms | 121.84ms |
| diamond | 189.13ms (fail) | 2.49s | 346.36ms | 282.19ms | 281.27ms | 232.29ms |
| mux | 194.16ms (fail) | 1.86s | 446.94ms | 398.82ms | 442.98ms | 371.81ms |
| repeatedObservers | 53.38ms (fail) | 233.17ms | 81.18ms | 41.58ms | 44.41ms | 45.60ms |
| triangle | 75.50ms (fail) | 784.01ms | 116.72ms | 98.11ms | 103.38ms | 84.33ms |
| unstable | 337.24ms (fail) | 349.52ms | 96.77ms | 70.10ms | 79.48ms | 68.77ms |
| molBench | 921μs | 570.99ms | 491.69ms | 488.68ms | 486.80ms | 482.60ms |
| create_signals | 67.23ms | 94.51ms | 105.63ms | 5.14ms | 28.42ms | 21.18ms |
| comp_0to1 | 55.99ms | 17.23ms | 40.66ms | 17.80ms | 11.05ms | 7.78ms |
| comp_1to1 | 57.48ms | 55.30ms | 55.29ms | 14.49ms | 27.49ms | 4.47ms |
| comp_2to1 | 39.31ms | 24.57ms | 40.25ms | 17.45ms | 15.73ms | 2.84ms |
| comp_4to1 | 18.45ms | 20.30ms | 5.45ms | 7.31ms | 4.24ms | 11.83ms |
| comp_1000to1 | 43μs | 28μs | 18μs | 7μs | 5μs | 3μs |
| comp_1to2 | 47.96ms | 39.68ms | 33.35ms | 15.45ms | 19.00ms | 10.58ms |
| comp_1to4 | 46.93ms | 23.57ms | 29.89ms | 43.99ms | 9.91ms | 16.39ms |
| comp_1to8 | 43.82ms | 24.37ms | 22.19ms | 5.98ms | 8.83ms | 4.43ms |
| comp_1to1000 | 39.23ms | 16.36ms | 16.96ms | 4.85ms | 5.15ms | 3.41ms |
| update_1to1 | 5.66ms | 26.45ms | 16.09ms | 8.60ms | 8.91ms | 8.70ms |
| update_2to1 | 3.11ms | 12.99ms | 9.47ms | 4.34ms | 4.87ms | 2.43ms |
| update_4to1 | 1.41ms | 6.99ms | 4.04ms | 2.18ms | 2.20ms | 2.32ms |
| update_1000to1 | 15μs | 61μs | 42μs | 21μs | 22μs | 25μs |
| update_1to2 | 2.88ms | 12.71ms | 7.99ms | 4.61ms | 4.51ms | 2.43ms |
| update_1to4 | 1.41ms | 6.39ms | 4.01ms | 2.21ms | 2.20ms | 2.08ms |
| update_1to1000 | 400μs | 197μs | 170μs | 158μs | 42μs | 48μs |
| cellx1000 | 5.39ms | 72.38ms | 12.42ms | 9.63ms | 9.48ms | 8.50ms |
| cellx2500 | 32.13ms | 268.65ms | 32.58ms | 25.71ms | 31.32ms | 19.57ms |
| cellx5000 | 96.85ms | 610.00ms | 71.44ms | 65.83ms | 59.50ms | 45.33ms |
| 10x5 - 2 sources - read 20.0% (simple) | 240.78ms | 2.06s | 351.50ms | 437.05ms | 509.56ms | 228.19ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 199.15ms | 1.55s | 243.27ms | 266.84ms | 284.71ms | 178.30ms |
| 1000x12 - 4 sources - dynamic (large) | 343.50ms | 1.88s | 458.80ms | 3.75s | 4.01s | 278.43ms |
| 1000x5 - 25 sources (wide dense) | 501.13ms | 3.54s | 578.25ms | 2.71s | 3.59s | 405.86ms |
| 5x500 - 3 sources (deep) | 205.40ms | 1.15s | 248.58ms | 228.67ms | 225.62ms | 190.51ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 258.84ms | 1.73s | 383.54ms | 455.42ms | 473.36ms | 262.75ms |

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
