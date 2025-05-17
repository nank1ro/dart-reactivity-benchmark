# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.17s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.10s |
| 4 | preact_signals | 0.28 | 100.0% | 35/35 | 9.99s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.39s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 155.67ms (fail) | 184.59ms | 2.36s | 275.39ms | 208.65ms | 205.35ms |
| broadPropagation | 6.73ms (fail) | 347.23ms | 4.23s | 506.99ms | 460.14ms | 457.44ms |
| deepPropagation | 141.98ms (fail) | 124.41ms | 1.52s | 181.73ms | 173.73ms | 176.93ms |
| diamond | 192.66ms (fail) | 235.68ms | 2.43s | 352.65ms | 292.14ms | 278.16ms |
| mux | 191.09ms (fail) | 370.00ms | 1.86s | 439.52ms | 407.34ms | 381.92ms |
| repeatedObservers | 52.42ms (fail) | 44.87ms | 230.22ms | 78.16ms | 46.79ms | 38.45ms |
| triangle | 76.84ms (fail) | 87.28ms | 776.88ms | 119.80ms | 107.36ms | 98.80ms |
| unstable | 334.93ms (fail) | 60.45ms | 353.47ms | 94.42ms | 74.88ms | 71.17ms |
| molBench | 1.27ms | 490.62ms | 580.56ms | 393.20ms | 487.38ms | 490.73ms |
| create_signals | 59.19ms | 27.85ms | 79.33ms | 72.46ms | 24.61ms | 17.69ms |
| comp_0to1 | 51.58ms | 6.76ms | 33.77ms | 30.53ms | 11.34ms | 18.89ms |
| comp_1to1 | 53.70ms | 4.16ms | 17.15ms | 27.26ms | 27.62ms | 7.08ms |
| comp_2to1 | 35.16ms | 2.23ms | 23.93ms | 43.58ms | 11.84ms | 9.98ms |
| comp_4to1 | 16.45ms | 8.56ms | 16.81ms | 13.70ms | 3.04ms | 8.71ms |
| comp_1000to1 | 41μs | 4μs | 33μs | 15μs | 4μs | 4μs |
| comp_1to2 | 45.06ms | 20.23ms | 35.81ms | 32.24ms | 17.84ms | 15.31ms |
| comp_1to4 | 43.74ms | 9.06ms | 22.14ms | 15.82ms | 9.31ms | 23.35ms |
| comp_1to8 | 43.34ms | 6.26ms | 23.23ms | 20.80ms | 6.56ms | 6.85ms |
| comp_1to1000 | 38.20ms | 3.50ms | 14.83ms | 14.72ms | 4.61ms | 6.16ms |
| update_1to1 | 5.76ms | 11.32ms | 21.75ms | 15.58ms | 9.21ms | 8.19ms |
| update_2to1 | 2.88ms | 5.17ms | 10.65ms | 7.80ms | 4.56ms | 4.06ms |
| update_4to1 | 1.48ms | 2.82ms | 5.87ms | 3.91ms | 2.31ms | 2.11ms |
| update_1000to1 | 15μs | 10μs | 52μs | 39μs | 22μs | 20μs |
| update_1to2 | 2.96ms | 5.64ms | 10.68ms | 7.80ms | 4.92ms | 4.05ms |
| update_1to4 | 1.48ms | 2.49ms | 5.30ms | 3.90ms | 2.34ms | 2.08ms |
| update_1to1000 | 371μs | 49μs | 161μs | 146μs | 43μs | 792μs |
| cellx1000 | 5.18ms | 7.19ms | 69.50ms | 11.95ms | 9.56ms | 10.23ms |
| cellx2500 | 29.16ms | 19.39ms | 248.96ms | 33.09ms | 31.11ms | 26.65ms |
| cellx5000 | 67.55ms | 42.99ms | 556.72ms | 75.42ms | 61.90ms | 73.20ms |
| 10x5 - 2 sources - read 20.0% (simple) | 243.10ms | 231.94ms | 2.00s | 348.41ms | 506.71ms | 438.33ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 201.50ms | 174.04ms | 1.53s | 244.22ms | 276.89ms | 269.82ms |
| 1000x12 - 4 sources - dynamic (large) | 339.12ms | 282.09ms | 1.90s | 468.24ms | 3.74s | 3.55s |
| 1000x5 - 25 sources (wide dense) | 505.61ms | 408.81ms | 3.54s | 592.75ms | 3.37s | 2.60s |
| 5x500 - 3 sources (deep) | 205.47ms | 189.75ms | 1.16s | 257.68ms | 226.74ms | 232.28ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.74ms | 261.31ms | 1.71s | 386.49ms | 471.58ms | 452.23ms |

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
