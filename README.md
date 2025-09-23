# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.39s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.50s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.49s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.69s |
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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 207.73ms | 166.78ms (fail) | 263.01ms | 215.21ms | 192.76ms | 2.37s |
| broadPropagation | 465.58ms | 6.44ms (fail) | 494.43ms | 467.32ms | 352.93ms | 4.31s |
| deepPropagation | 181.07ms | 141.15ms (fail) | 164.31ms | 176.97ms | 126.57ms | 1.55s |
| diamond | 280.16ms | 192.41ms (fail) | 366.24ms | 291.95ms | 236.50ms | 2.39s |
| mux | 397.77ms | 192.05ms (fail) | 449.70ms | 413.22ms | 380.54ms | 1.85s |
| repeatedObservers | 40.15ms | 52.67ms (fail) | 81.30ms | 46.84ms | 43.76ms | 230.22ms |
| triangle | 100.03ms | 80.53ms (fail) | 117.55ms | 103.99ms | 85.63ms | 784.59ms |
| unstable | 74.88ms | 339.23ms (fail) | 99.00ms | 76.44ms | 59.88ms | 344.24ms |
| molBench | 489.75ms | 1.43ms | 500.54ms | 486.78ms | 489.74ms | 582.78ms |
| create_signals | 5.25ms | 71.37ms | 54.47ms | 26.31ms | 27.99ms | 65.41ms |
| comp_0to1 | 18.05ms | 64.17ms | 25.97ms | 12.45ms | 8.18ms | 15.96ms |
| comp_1to1 | 10.84ms | 60.98ms | 33.69ms | 26.53ms | 4.28ms | 49.16ms |
| comp_2to1 | 13.15ms | 39.73ms | 36.90ms | 8.52ms | 2.33ms | 43.43ms |
| comp_4to1 | 15.77ms | 17.23ms | 16.53ms | 2.02ms | 7.74ms | 32.39ms |
| comp_1000to1 | 4μs | 44μs | 17μs | 5μs | 4μs | 16μs |
| comp_1to2 | 29.78ms | 48.65ms | 45.66ms | 13.68ms | 10.34ms | 33.62ms |
| comp_1to4 | 34.72ms | 47.14ms | 22.91ms | 19.25ms | 12.35ms | 23.07ms |
| comp_1to8 | 9.57ms | 46.89ms | 25.32ms | 5.85ms | 5.06ms | 24.62ms |
| comp_1to1000 | 6.71ms | 41.59ms | 15.35ms | 5.43ms | 3.80ms | 15.42ms |
| update_1to1 | 9.32ms | 6.04ms | 17.92ms | 9.97ms | 10.02ms | 22.80ms |
| update_2to1 | 4.94ms | 3.19ms | 9.27ms | 4.53ms | 2.44ms | 11.10ms |
| update_4to1 | 2.34ms | 1.53ms | 4.49ms | 2.80ms | 2.47ms | 5.66ms |
| update_1000to1 | 32μs | 15μs | 46μs | 26μs | 24μs | 59μs |
| update_1to2 | 4.54ms | 3.05ms | 9.17ms | 4.57ms | 3.72ms | 11.15ms |
| update_1to4 | 2.34ms | 1.54ms | 4.48ms | 2.57ms | 2.35ms | 5.66ms |
| update_1to1000 | 225μs | 417μs | 154μs | 47μs | 46μs | 197μs |
| cellx1000 | 10.28ms | 6.28ms | 14.69ms | 10.71ms | 8.35ms | 87.91ms |
| cellx2500 | 37.75ms | 34.48ms | 42.80ms | 39.66ms | 22.90ms | 281.16ms |
| cellx5000 | 104.22ms | 78.28ms | 128.58ms | 107.34ms | 60.54ms | 626.45ms |
| 10x5 - 2 sources - read 20.0% (simple) | 446.01ms | 240.65ms | 349.40ms | 507.81ms | 239.28ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.98ms | 197.25ms | 252.38ms | 279.91ms | 180.94ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.75s | 353.84ms | 474.12ms | 4.00s | 284.87ms | 1.99s |
| 1000x5 - 25 sources (wide dense) | 2.76s | 518.63ms | 620.30ms | 3.44s | 407.95ms | 3.51s |
| 5x500 - 3 sources (deep) | 231.77ms | 209.70ms | 257.74ms | 222.13ms | 192.74ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 461.84ms | 264.34ms | 393.65ms | 471.75ms | 271.81ms | 1.73s |

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
