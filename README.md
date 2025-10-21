# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.11s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.20s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.14s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.22s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.38s |

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
| avoidablePropagation | 211.85ms | 188.40ms | 145.49ms (fail) | 260.02ms | 200.20ms | 2.36s |
| broadPropagation | 449.53ms | 342.30ms | 6.30ms (fail) | 499.65ms | 444.86ms | 4.45s |
| deepPropagation | 177.13ms | 127.17ms | 139.22ms (fail) | 156.86ms | 170.56ms | 1.51s |
| diamond | 278.50ms | 230.91ms | 184.16ms (fail) | 344.56ms | 277.14ms | 2.42s |
| mux | 403.18ms | 369.13ms | 192.95ms (fail) | 429.52ms | 412.94ms | 1.76s |
| repeatedObservers | 45.96ms | 43.29ms | 51.87ms (fail) | 76.98ms | 38.45ms | 231.41ms |
| triangle | 101.89ms | 84.36ms | 78.61ms (fail) | 107.53ms | 98.05ms | 756.57ms |
| unstable | 76.05ms | 58.81ms | 325.86ms (fail) | 90.09ms | 74.50ms | 335.62ms |
| molBench | 485.68ms | 484.57ms | 960μs | 486.87ms | 482.15ms | 558.70ms |
| create_signals | 26.03ms | 28.04ms | 60.66ms | 74.19ms | 5.05ms | 70.42ms |
| comp_0to1 | 26.76ms | 11.31ms | 56.56ms | 25.11ms | 21.52ms | 25.02ms |
| comp_1to1 | 23.72ms | 4.12ms | 56.24ms | 39.06ms | 14.85ms | 16.48ms |
| comp_2to1 | 9.70ms | 2.24ms | 37.48ms | 23.05ms | 15.03ms | 19.82ms |
| comp_4to1 | 1.95ms | 9.86ms | 16.45ms | 14.57ms | 14.36ms | 27.37ms |
| comp_1000to1 | 5μs | 3μs | 44μs | 18μs | 4μs | 16μs |
| comp_1to2 | 13.23ms | 17.14ms | 50.34ms | 32.13ms | 16.88ms | 40.76ms |
| comp_1to4 | 11.11ms | 8.72ms | 49.16ms | 14.48ms | 26.45ms | 24.43ms |
| comp_1to8 | 6.74ms | 6.20ms | 46.53ms | 18.66ms | 5.79ms | 20.32ms |
| comp_1to1000 | 4.33ms | 3.46ms | 41.32ms | 13.79ms | 6.50ms | 14.64ms |
| update_1to1 | 10.22ms | 8.79ms | 6.00ms | 16.36ms | 8.22ms | 27.90ms |
| update_2to1 | 4.56ms | 2.17ms | 3.09ms | 8.03ms | 4.40ms | 13.50ms |
| update_4to1 | 2.59ms | 2.58ms | 1.53ms | 4.10ms | 2.06ms | 6.66ms |
| update_1000to1 | 25μs | 20μs | 15μs | 40μs | 20μs | 64μs |
| update_1to2 | 4.58ms | 3.65ms | 3.03ms | 8.36ms | 4.10ms | 13.84ms |
| update_1to4 | 2.58ms | 2.45ms | 1.54ms | 4.09ms | 2.06ms | 6.63ms |
| update_1to1000 | 42μs | 44μs | 430μs | 150μs | 819μs | 168μs |
| cellx1000 | 9.48ms | 7.45ms | 6.21ms | 12.44ms | 9.58ms | 70.27ms |
| cellx2500 | 30.36ms | 19.63ms | 27.45ms | 32.42ms | 24.64ms | 255.34ms |
| cellx5000 | 56.86ms | 41.17ms | 75.11ms | 72.28ms | 64.97ms | 537.63ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.78ms | 229.02ms | 244.72ms | 341.53ms | 446.40ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.63ms | 173.18ms | 194.82ms | 240.23ms | 260.09ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.78s | 284.68ms | 336.22ms | 445.68ms | 3.66s | 1.89s |
| 1000x5 - 25 sources (wide dense) | 3.45s | 401.95ms | 483.22ms | 586.06ms | 2.66s | 3.48s |
| 5x500 - 3 sources (deep) | 223.66ms | 182.71ms | 200.52ms | 246.37ms | 229.17ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.63ms | 265.72ms | 252.93ms | 383.21ms | 448.66ms | 1.67s |

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
