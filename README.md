# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.32s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 10.99s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.91s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.90s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 269.75ms | 202.34ms | 2.34s | 196.77ms | 145.30ms (fail) | 187.58ms |
| broadPropagation | 505.71ms | 450.19ms | 4.43s | 444.31ms | 6.07ms (fail) | 348.11ms |
| deepPropagation | 172.65ms | 167.62ms | 1.52s | 175.59ms | 139.03ms (fail) | 123.96ms |
| diamond | 361.53ms | 284.55ms | 2.37s | 283.19ms | 181.43ms (fail) | 226.28ms |
| mux | 426.89ms | 389.49ms | 1.76s | 377.55ms | 192.84ms (fail) | 359.89ms |
| repeatedObservers | 80.01ms | 45.53ms | 242.84ms | 40.94ms | 52.98ms (fail) | 43.28ms |
| triangle | 114.58ms | 100.12ms | 747.86ms | 115.60ms | 79.32ms (fail) | 84.39ms |
| unstable | 95.16ms | 73.21ms | 346.58ms | 73.28ms | 337.99ms (fail) | 57.88ms |
| molBench | 491.27ms | 496.04ms | 593.15ms | 486.40ms | 968μs | 487.23ms |
| create_signals | 75.08ms | 25.84ms | 68.33ms | 5.37ms | 64.19ms | 29.48ms |
| comp_0to1 | 29.60ms | 11.20ms | 32.92ms | 17.59ms | 54.80ms | 7.43ms |
| comp_1to1 | 27.23ms | 30.91ms | 31.20ms | 13.47ms | 56.15ms | 4.17ms |
| comp_2to1 | 39.28ms | 18.49ms | 36.38ms | 18.79ms | 39.66ms | 2.30ms |
| comp_4to1 | 18.41ms | 2.69ms | 26.71ms | 8.26ms | 17.07ms | 10.72ms |
| comp_1000to1 | 29μs | 4μs | 15μs | 4μs | 44μs | 3μs |
| comp_1to2 | 26.51ms | 21.88ms | 35.96ms | 27.25ms | 47.47ms | 16.49ms |
| comp_1to4 | 30.11ms | 20.06ms | 17.92ms | 30.10ms | 51.47ms | 5.99ms |
| comp_1to8 | 22.98ms | 6.50ms | 20.59ms | 6.97ms | 44.72ms | 4.35ms |
| comp_1to1000 | 14.37ms | 4.09ms | 15.47ms | 5.96ms | 39.92ms | 3.62ms |
| update_1to1 | 15.90ms | 9.81ms | 23.71ms | 9.32ms | 5.75ms | 10.03ms |
| update_2to1 | 7.78ms | 4.95ms | 11.31ms | 4.65ms | 2.97ms | 2.24ms |
| update_4to1 | 3.97ms | 2.46ms | 6.70ms | 2.40ms | 1.50ms | 2.07ms |
| update_1000to1 | 39μs | 24μs | 68μs | 23μs | 15μs | 20μs |
| update_1to2 | 8.22ms | 4.86ms | 12.40ms | 4.70ms | 2.90ms | 4.08ms |
| update_1to4 | 4.02ms | 2.50ms | 6.26ms | 2.31ms | 1.53ms | 1.95ms |
| update_1to1000 | 156μs | 43μs | 177μs | 604μs | 412μs | 51μs |
| cellx1000 | 11.94ms | 9.94ms | 72.81ms | 9.76ms | 5.21ms | 7.90ms |
| cellx2500 | 34.09ms | 34.89ms | 254.65ms | 28.17ms | 23.37ms | 20.18ms |
| cellx5000 | 79.86ms | 75.58ms | 581.98ms | 75.05ms | 78.07ms | 48.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 347.01ms | 500.19ms | 1.93s | 436.58ms | 252.91ms | 237.45ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.60ms | 282.38ms | 1.43s | 270.80ms | 202.16ms | 174.46ms |
| 1000x12 - 4 sources - dynamic (large) | 469.11ms | 3.64s | 1.84s | 3.53s | 336.46ms | 282.54ms |
| 1000x5 - 25 sources (wide dense) | 642.74ms | 3.37s | 3.35s | 2.53s | 506.88ms | 411.07ms |
| 5x500 - 3 sources (deep) | 252.16ms | 224.12ms | 1.09s | 231.23ms | 203.60ms | 193.60ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 386.26ms | 483.10ms | 1.64s | 442.68ms | 263.69ms | 268.22ms |

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
