# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.21s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.36s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.11s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.61s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| avoidablePropagation | 2.33s | 161.72ms (fail) | 200.29ms | 194.45ms | 260.73ms | 215.66ms |
| broadPropagation | 4.36s | 6.52ms (fail) | 461.79ms | 355.51ms | 486.93ms | 465.48ms |
| deepPropagation | 1.54s | 138.84ms (fail) | 178.79ms | 127.92ms | 163.28ms | 175.96ms |
| diamond | 2.44s | 188.10ms (fail) | 281.90ms | 234.66ms | 346.00ms | 285.04ms |
| mux | 1.84s | 193.12ms (fail) | 398.40ms | 376.73ms | 432.23ms | 410.74ms |
| repeatedObservers | 236.41ms | 52.51ms (fail) | 40.19ms | 43.50ms | 80.81ms | 47.74ms |
| triangle | 760.00ms | 80.76ms (fail) | 99.70ms | 85.27ms | 114.07ms | 102.31ms |
| unstable | 346.43ms | 377.62ms (fail) | 75.02ms | 59.79ms | 94.86ms | 75.73ms |
| molBench | 582.36ms | 1.29ms | 488.42ms | 488.88ms | 493.80ms | 405.12ms |
| create_signals | 72.30ms | 66.25ms | 5.34ms | 21.58ms | 53.66ms | 25.43ms |
| comp_0to1 | 25.50ms | 61.70ms | 17.14ms | 6.76ms | 24.90ms | 11.34ms |
| comp_1to1 | 17.36ms | 56.88ms | 12.71ms | 4.14ms | 28.19ms | 24.86ms |
| comp_2to1 | 20.89ms | 38.92ms | 9.39ms | 2.22ms | 32.41ms | 7.90ms |
| comp_4to1 | 31.45ms | 17.37ms | 14.98ms | 7.88ms | 4.31ms | 1.96ms |
| comp_1000to1 | 16μs | 44μs | 6μs | 9μs | 25μs | 5μs |
| comp_1to2 | 36.40ms | 47.98ms | 15.69ms | 15.22ms | 32.58ms | 20.29ms |
| comp_1to4 | 25.09ms | 46.23ms | 30.36ms | 16.21ms | 14.59ms | 10.01ms |
| comp_1to8 | 24.60ms | 45.50ms | 7.79ms | 4.08ms | 19.07ms | 6.45ms |
| comp_1to1000 | 15.44ms | 41.77ms | 9.67ms | 3.08ms | 14.11ms | 4.44ms |
| update_1to1 | 28.29ms | 6.03ms | 8.33ms | 9.92ms | 16.51ms | 10.13ms |
| update_2to1 | 12.96ms | 3.17ms | 4.38ms | 2.64ms | 8.03ms | 4.64ms |
| update_4to1 | 7.23ms | 1.54ms | 2.06ms | 2.56ms | 4.14ms | 2.53ms |
| update_1000to1 | 70μs | 15μs | 20μs | 24μs | 39μs | 26μs |
| update_1to2 | 14.04ms | 3.04ms | 4.07ms | 4.36ms | 8.43ms | 4.51ms |
| update_1to4 | 6.50ms | 1.55ms | 2.17ms | 2.51ms | 5.44ms | 2.54ms |
| update_1to1000 | 187μs | 411μs | 58μs | 43μs | 297μs | 57μs |
| cellx1000 | 69.76ms | 5.16ms | 9.74ms | 7.21ms | 14.62ms | 9.62ms |
| cellx2500 | 248.47ms | 27.57ms | 27.02ms | 19.82ms | 49.94ms | 33.91ms |
| cellx5000 | 569.73ms | 72.46ms | 79.60ms | 42.82ms | 100.98ms | 68.28ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.03s | 246.25ms | 448.67ms | 230.04ms | 353.47ms | 511.05ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.51s | 196.68ms | 283.13ms | 183.67ms | 247.64ms | 288.46ms |
| 1000x12 - 4 sources - dynamic (large) | 2.06s | 347.25ms | 3.71s | 280.19ms | 460.35ms | 3.75s |
| 1000x5 - 25 sources (wide dense) | 3.48s | 510.93ms | 2.75s | 411.52ms | 609.79ms | 3.43s |
| 5x500 - 3 sources (deep) | 1.14s | 203.74ms | 231.10ms | 192.96ms | 252.02ms | 224.15ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.73s | 260.86ms | 462.43ms | 263.16ms | 384.45ms | 475.26ms |

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
